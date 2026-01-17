import 'dart:io';
import 'dart:typed_data';
import 'package:cogniclaim_server/src/generated/protocol.dart';
import 'package:cross_file/cross_file.dart';
import 'package:serverpod/serverpod.dart';
import 'package:dartantic_ai/dartantic_ai.dart';

class AichatEndpoint extends Endpoint {
  Future<String?> getUploadDescription(Session session, String path) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<AiChat> performAiChat(
    Session session,
    String message,
    String uniqueId,

    List<int>? imageBytes,
    String? filename,
    String? imageUrl,
  ) async {
    final geminiApiKey = session.passwords['geminiApiKey'];
    if (geminiApiKey == null) {
      throw Exception('Gemini API key not found');
    }

    // Configure the Dartantic AI agent for Gemini before sending the prompt.
    final agent = Agent.forProvider(
      GoogleProvider(apiKey: geminiApiKey),
      chatModelName: 'gemini-2.5-flash-lite',
    );

    List<DataPart> imageAttachments = [];

    // Option A: received file bytes from client
    if (imageBytes != null && imageBytes.isNotEmpty) {
      final bytes = Uint8List.fromList(imageBytes); // convert back to Uint8List
      final xFile = XFile.fromData(bytes, name: filename ?? 'upload');
      final dataPart = await DataPart.fromFile(xFile);
      imageAttachments.add(dataPart);
    } else if (imageUrl != null && imageUrl.isNotEmpty) {
      // Option B: download the file server-side from provided URL
      try {
        final httpResponse = await HttpClient()
            .getUrl(Uri.parse(imageUrl))
            .then((req) => req.close());
        if (httpResponse.statusCode == 200) {
          final bytes = await readResponseBytes(httpResponse);
          final xFile = XFile.fromData(
            bytes,
            name: filename ?? Uri.parse(imageUrl).pathSegments.last,
          );
          final dataPart = await DataPart.fromFile(xFile);
          imageAttachments.add(dataPart);
        } else {
          // ignore or log non-200
        }
      } catch (e) {
        // handle download error or continue without attachment
      }
    }

    final response = await agent.send(message, attachments: imageAttachments);
    final responseText = response.output;

    final aiChat = AiChat(
      uniqueId: uniqueId,
      message: responseText,
      author: 'AI Bot',
      timestamp: DateTime.now(),
    );
    await AiChat.db.insert(session, [aiChat]);
    return aiChat;
  }

  Future<Uint8List> readResponseBytes(HttpClientResponse response) async {
    final builder = BytesBuilder();
    await for (final chunk in response) {
      builder.add(chunk);
    }
    return builder.takeBytes();
  }
}
