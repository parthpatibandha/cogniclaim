/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AiChat implements _i1.SerializableModel {
  AiChat._({
    this.id,
    required this.uniqueId,
    required this.message,
    required this.author,
    required this.timestamp,
    this.image,
  });

  factory AiChat({
    int? id,
    required String uniqueId,
    required String message,
    required String author,
    required DateTime timestamp,
    String? image,
  }) = _AiChatImpl;

  factory AiChat.fromJson(Map<String, dynamic> jsonSerialization) {
    return AiChat(
      id: jsonSerialization['id'] as int?,
      uniqueId: jsonSerialization['uniqueId'] as String,
      message: jsonSerialization['message'] as String,
      author: jsonSerialization['author'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      image: jsonSerialization['image'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The unique id
  String uniqueId;

  /// The greeting message.
  String message;

  /// The author of the greeting message.
  String author;

  /// The time when the message was created.
  DateTime timestamp;

  /// The image file
  String? image;

  /// Returns a shallow copy of this [AiChat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AiChat copyWith({
    int? id,
    String? uniqueId,
    String? message,
    String? author,
    DateTime? timestamp,
    String? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AiChat',
      if (id != null) 'id': id,
      'uniqueId': uniqueId,
      'message': message,
      'author': author,
      'timestamp': timestamp.toJson(),
      if (image != null) 'image': image,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AiChatImpl extends AiChat {
  _AiChatImpl({
    int? id,
    required String uniqueId,
    required String message,
    required String author,
    required DateTime timestamp,
    String? image,
  }) : super._(
         id: id,
         uniqueId: uniqueId,
         message: message,
         author: author,
         timestamp: timestamp,
         image: image,
       );

  /// Returns a shallow copy of this [AiChat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AiChat copyWith({
    Object? id = _Undefined,
    String? uniqueId,
    String? message,
    String? author,
    DateTime? timestamp,
    Object? image = _Undefined,
  }) {
    return AiChat(
      id: id is int? ? id : this.id,
      uniqueId: uniqueId ?? this.uniqueId,
      message: message ?? this.message,
      author: author ?? this.author,
      timestamp: timestamp ?? this.timestamp,
      image: image is String? ? image : this.image,
    );
  }
}
