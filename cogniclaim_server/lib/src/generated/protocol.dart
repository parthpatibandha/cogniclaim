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
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i4;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i5;
import 'greetings/greeting.dart' as _i6;
import 'myragchat/aichat.dart' as _i7;
import 'myragchat/models/chat_message.dart' as _i8;
import 'myragchat/models/chat_message_type.dart' as _i9;
import 'myragchat/models/chat_session.dart' as _i10;
import 'myragchat/models/data_fetcher_task.dart' as _i11;
import 'myragchat/models/data_fetcher_task_type.dart' as _i12;
import 'myragchat/models/rag_document.dart' as _i13;
import 'myragchat/models/rag_document_type.dart' as _i14;
import 'myragchat/models/table_of_contents.dart' as _i15;
import 'myragchat/myragchat.dart' as _i16;
export 'greetings/greeting.dart';
export 'myragchat/aichat.dart';
export 'myragchat/models/chat_message.dart';
export 'myragchat/models/chat_message_type.dart';
export 'myragchat/models/chat_session.dart';
export 'myragchat/models/data_fetcher_task.dart';
export 'myragchat/models/data_fetcher_task_type.dart';
export 'myragchat/models/rag_document.dart';
export 'myragchat/models/rag_document_type.dart';
export 'myragchat/models/table_of_contents.dart';
export 'myragchat/myragchat.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'aichats',
      dartName: 'AiChat',
      schema: 'public',
      module: 'cogniclaim',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'aichats_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uniqueId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'author',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'image',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'aichats_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_message',
      dartName: 'ChatMessage',
      schema: 'public',
      module: 'cogniclaim',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'chatSessionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ChatMessageType',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'chat_session',
      dartName: 'ChatSession',
      schema: 'public',
      module: 'cogniclaim',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'chat_session_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'keyToken',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'goodAnswer',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'chat_session_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'createdAt',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'rag_document',
      dartName: 'RAGDocument',
      schema: 'public',
      module: 'cogniclaim',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'rag_document_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'embedding',
          columnType: _i2.ColumnType.vector,
          isNullable: false,
          dartType: 'Vector(768)',
          vectorDimension: 768,
        ),
        _i2.ColumnDefinition(
          name: 'fetchTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'sourceUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'embeddingSummary',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'shortDescription',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RAGDocumentType',
        ),
        _i2.ColumnDefinition(
          name: 'domain',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'rag_document_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'rag_document_sourceUrl',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'sourceUrl',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'rag_document_vector',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'embedding',
            ),
          ],
          type: 'hnsw',
          isUnique: false,
          isPrimary: false,
          vectorDistanceFunction: _i2.VectorDistanceFunction.cosine,
          vectorColumnType: _i2.ColumnType.vector,
        ),
        _i2.IndexDefinition(
          indexName: 'rag_document_type',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'type',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i5.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i6.Greeting) {
      return _i6.Greeting.fromJson(data) as T;
    }
    if (t == _i7.AiChat) {
      return _i7.AiChat.fromJson(data) as T;
    }
    if (t == _i8.ChatMessage) {
      return _i8.ChatMessage.fromJson(data) as T;
    }
    if (t == _i9.ChatMessageType) {
      return _i9.ChatMessageType.fromJson(data) as T;
    }
    if (t == _i10.ChatSession) {
      return _i10.ChatSession.fromJson(data) as T;
    }
    if (t == _i11.DataFetcherTask) {
      return _i11.DataFetcherTask.fromJson(data) as T;
    }
    if (t == _i12.DataFetcherTaskType) {
      return _i12.DataFetcherTaskType.fromJson(data) as T;
    }
    if (t == _i13.RAGDocument) {
      return _i13.RAGDocument.fromJson(data) as T;
    }
    if (t == _i14.RAGDocumentType) {
      return _i14.RAGDocumentType.fromJson(data) as T;
    }
    if (t == _i15.TableOfContents) {
      return _i15.TableOfContents.fromJson(data) as T;
    }
    if (t == _i16.MyRagChat) {
      return _i16.MyRagChat.fromJson(data) as T;
    }
    if (t == _i1.getType<_i6.Greeting?>()) {
      return (data != null ? _i6.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AiChat?>()) {
      return (data != null ? _i7.AiChat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ChatMessage?>()) {
      return (data != null ? _i8.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ChatMessageType?>()) {
      return (data != null ? _i9.ChatMessageType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ChatSession?>()) {
      return (data != null ? _i10.ChatSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DataFetcherTask?>()) {
      return (data != null ? _i11.DataFetcherTask.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DataFetcherTaskType?>()) {
      return (data != null ? _i12.DataFetcherTaskType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.RAGDocument?>()) {
      return (data != null ? _i13.RAGDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.RAGDocumentType?>()) {
      return (data != null ? _i14.RAGDocumentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TableOfContents?>()) {
      return (data != null ? _i15.TableOfContents.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.MyRagChat?>()) {
      return (data != null ? _i16.MyRagChat.fromJson(data) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<int>(e)).toList()
              : null)
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i5.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i6.Greeting => 'Greeting',
      _i7.AiChat => 'AiChat',
      _i8.ChatMessage => 'ChatMessage',
      _i9.ChatMessageType => 'ChatMessageType',
      _i10.ChatSession => 'ChatSession',
      _i11.DataFetcherTask => 'DataFetcherTask',
      _i12.DataFetcherTaskType => 'DataFetcherTaskType',
      _i13.RAGDocument => 'RAGDocument',
      _i14.RAGDocumentType => 'RAGDocumentType',
      _i15.TableOfContents => 'TableOfContents',
      _i16.MyRagChat => 'MyRagChat',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('cogniclaim.', '');
    }

    switch (data) {
      case _i6.Greeting():
        return 'Greeting';
      case _i7.AiChat():
        return 'AiChat';
      case _i8.ChatMessage():
        return 'ChatMessage';
      case _i9.ChatMessageType():
        return 'ChatMessageType';
      case _i10.ChatSession():
        return 'ChatSession';
      case _i11.DataFetcherTask():
        return 'DataFetcherTask';
      case _i12.DataFetcherTaskType():
        return 'DataFetcherTaskType';
      case _i13.RAGDocument():
        return 'RAGDocument';
      case _i14.RAGDocumentType():
        return 'RAGDocumentType';
      case _i15.TableOfContents():
        return 'TableOfContents';
      case _i16.MyRagChat():
        return 'MyRagChat';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i5.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i6.Greeting>(data['data']);
    }
    if (dataClassName == 'AiChat') {
      return deserialize<_i7.AiChat>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i8.ChatMessage>(data['data']);
    }
    if (dataClassName == 'ChatMessageType') {
      return deserialize<_i9.ChatMessageType>(data['data']);
    }
    if (dataClassName == 'ChatSession') {
      return deserialize<_i10.ChatSession>(data['data']);
    }
    if (dataClassName == 'DataFetcherTask') {
      return deserialize<_i11.DataFetcherTask>(data['data']);
    }
    if (dataClassName == 'DataFetcherTaskType') {
      return deserialize<_i12.DataFetcherTaskType>(data['data']);
    }
    if (dataClassName == 'RAGDocument') {
      return deserialize<_i13.RAGDocument>(data['data']);
    }
    if (dataClassName == 'RAGDocumentType') {
      return deserialize<_i14.RAGDocumentType>(data['data']);
    }
    if (dataClassName == 'TableOfContents') {
      return deserialize<_i15.TableOfContents>(data['data']);
    }
    if (dataClassName == 'MyRagChat') {
      return deserialize<_i16.MyRagChat>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i5.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i5.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i7.AiChat:
        return _i7.AiChat.t;
      case _i8.ChatMessage:
        return _i8.ChatMessage.t;
      case _i10.ChatSession:
        return _i10.ChatSession.t;
      case _i13.RAGDocument:
        return _i13.RAGDocument.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'cogniclaim';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i5.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
