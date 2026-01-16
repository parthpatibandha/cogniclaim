import 'package:cogniclaim_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:dartantic_ai/dartantic_ai.dart';

class MyragchatEndpoint extends Endpoint {
  Future<MyRagChat> getMyRagChat(Session session, String message) async {
    final geminiApiKey = session.passwords['geminiApiKey'];
    if (geminiApiKey == null) {
      throw Exception('Gemini API key not found');
    }

    // Configure the Dartantic AI agent for Gemini before sending the prompt.
    final agent = Agent.forProvider(
      GoogleProvider(apiKey: geminiApiKey),
      chatModelName: 'gemini-2.5-flash-lite',
    );

    final response = await agent.send(message);
    final responseText = response.output;

    return MyRagChat(
      message: responseText,
      author: 'AI Bot',
      timestamp: DateTime.now(),
    );
  }
}
