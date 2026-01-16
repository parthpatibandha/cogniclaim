import 'package:cogniclaim_client/cogniclaim_client.dart';

class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatError extends ChatState {
  final String errorMessage;

  ChatError({required this.errorMessage});
}

class ChatSuccess extends ChatState {
  List<AiChat> messages;

  ChatSuccess({required this.messages});
}
