// dart
import 'dart:io';

import 'package:cogniclaim_client/cogniclaim_client.dart';
import 'package:cogniclaim_flutter/chat/app_constants.dart';
import 'package:cogniclaim_flutter/chat/cubit/chat_cubit.dart';
import 'package:cogniclaim_flutter/chat/cubit/chat_state.dart';
import 'package:cogniclaim_flutter/utils/logger.dart';
import 'package:dartantic_interface/dartantic_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatCubit(),
      child: const _ChatView(),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView();

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  File? _selectedImage;
  XFile? _selectedImageXFile;

  Future<void> _pickImage() async {
    // request appropriate permission
    PermissionStatus status;
    if (Platform.isAndroid) {
      status = await Permission.storage.request();
    } else {
      status = await Permission.photos.request();
    }
    Logger.log("Permission Status : $status");

    /*if (!status.isGranted) {
      // permission denied
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gallery permission is required to attach images')),
      );
      return;
    }*/

    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked == null) return;
    setState(() {
      _selectedImageXFile = picked;
      _selectedImage = File(picked.path);
    });
  }

  void _send(BuildContext context) async {
    final text = _controller.text;
    if (text.trim().isEmpty) return;

    if (_selectedImage != null) {
      context.read<ChatCubit>().sendUserMessage(text, _selectedImage!);
    } else {
      context.read<ChatCubit>().sendUserMessage(text, null);
    }

    _controller.clear();
    setState(() {
      _selectedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Chat')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                Logger.log("UI state received : $state");
                if (state is ChatInitial) {
                  return const Center(child: Text('No messages yet'));
                } else if (state is ChatError) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                } else {
                  final success = state as ChatSuccess;
                  final messages = success.messages;
                  return buildMessageList(messages);
                }
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                if (_selectedImage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            _selectedImage!,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _selectedImage!.path.split('/').last,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onSubmitted: (_) => _send(context),
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: _pickImage,
                      tooltip: 'Attach image',
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _send(context),
                      child: const Text('Send'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageList(List<AiChat> messages) {
    Logger.log("UI : $messages");

    final displayMessages = messages.reversed.toList();

    // Scroll to bottom after the list rebuilds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });

    return ListView.builder(
      controller: _scrollController,
      reverse: true, // newest at top
      itemCount: displayMessages.length,
      itemBuilder: (context, index) {
        final msg = displayMessages[index];
        final isUser = (msg.author == AppConstants.RoleUser);
        final align = isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start;
        final color = isUser ? Colors.blue[200] : Colors.grey[300];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: align,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 320),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    if (isUser == false && msg.message.isEmpty)
                      CircularProgressIndicator(color: Colors.blue),
                    if (msg.image != null)
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.file(File(msg.image!)),
                      ),
                    Text(msg.message),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formatTime(msg.timestamp),
                style: const TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatTime(DateTime t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
}
