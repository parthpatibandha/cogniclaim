import 'dart:io';
import 'dart:typed_data';

import 'package:cogniclaim_client/cogniclaim_client.dart';
import 'package:cogniclaim_flutter/chat/app_constants.dart';
import 'package:cogniclaim_flutter/chat/cubit/chat_state.dart';
import 'package:cogniclaim_flutter/main.dart';
import 'package:cogniclaim_flutter/utils/logger.dart';
import 'package:dartantic_interface/dartantic_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<AiChat> messages = [];

  void sendUserMessage(String message, File? file) async {
    Logger.log("sendUserMessage");
    try {
      String userMessageID = generateUniqueId();
      messages.add(
        AiChat(
            uniqueId: userMessageID,
            message: message,
            author: AppConstants.RoleUser,
            timestamp: DateTime.now(),
            image: file?.path,
      ),
    );

    String aiMessageID = generateAiUniqueId();
    messages.add(
    AiChat(
    uniqueId: aiMessageID,
    message: "",
    author: AppConstants.RoleAi,
    timestamp: DateTime.now(),
    ),
    );

    emit(ChatSuccess(messages: messages));


    List<int>? bytesList;
    String fileName = "";
    if(file != null) {
    final bytes = await file.readAsBytes(); // Uint8List
    bytesList = bytes.toList();
    fileName = getFileNameManual(file);
    }

    Logger.log("sendUserMessage performAiChat API Called");
    await client.aichat.performAiChat(message, aiMessageID, bytesList, fileName, "").then((
    result,
    ) {
    Logger.log("Success in sendUserMessage: $result");

    final idx = messages.indexWhere((msg) => msg.uniqueId == aiMessageID);
    if (idx != -1) {
    messages[idx].message = result.message;
    emit(ChatSuccess(messages: messages));
    } else {
    // Fallback: if placeholder isn't found, append the AI response
    messages.add(
    AiChat(
    uniqueId: aiMessageID,
    message: result.message,
    author: AppConstants.RoleAi,
    timestamp: DateTime.now(),
    ),
    );
    emit(ChatSuccess(messages: messages));
    }
    });
    } catch (e) {
    Logger.log("Error in sendUserMessage: $e");
    emit(ChatError(errorMessage: e.toString()));
    }
  }

  String generateUniqueId() {
    String miles = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    String year = DateTime
        .now()
        .year
        .toString();
    return "$year$miles";
  }

  String generateAiUniqueId() {
    String miles = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    String year = DateTime
        .now()
        .month
        .toString();
    return "$year$miles";
  }

  String getFileNameManual(File file) {
    String fileName = file.path
        .split(Platform.pathSeparator)
        .last;
    Logger.log('File name: $fileName'); // Output: file.txt
    return fileName;
  }
}
