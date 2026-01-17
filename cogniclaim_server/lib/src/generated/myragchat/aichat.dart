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

abstract class AiChat implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = AiChatTable();

  static const db = AiChatRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static AiChatInclude include() {
    return AiChatInclude._();
  }

  static AiChatIncludeList includeList({
    _i1.WhereExpressionBuilder<AiChatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiChatTable>? orderByList,
    AiChatInclude? include,
  }) {
    return AiChatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AiChat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AiChat.t),
      include: include,
    );
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

class AiChatUpdateTable extends _i1.UpdateTable<AiChatTable> {
  AiChatUpdateTable(super.table);

  _i1.ColumnValue<String, String> uniqueId(String value) => _i1.ColumnValue(
    table.uniqueId,
    value,
  );

  _i1.ColumnValue<String, String> message(String value) => _i1.ColumnValue(
    table.message,
    value,
  );

  _i1.ColumnValue<String, String> author(String value) => _i1.ColumnValue(
    table.author,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<String, String> image(String? value) => _i1.ColumnValue(
    table.image,
    value,
  );
}

class AiChatTable extends _i1.Table<int?> {
  AiChatTable({super.tableRelation}) : super(tableName: 'aichats') {
    updateTable = AiChatUpdateTable(this);
    uniqueId = _i1.ColumnString(
      'uniqueId',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    author = _i1.ColumnString(
      'author',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    image = _i1.ColumnString(
      'image',
      this,
    );
  }

  late final AiChatUpdateTable updateTable;

  /// The unique id
  late final _i1.ColumnString uniqueId;

  /// The greeting message.
  late final _i1.ColumnString message;

  /// The author of the greeting message.
  late final _i1.ColumnString author;

  /// The time when the message was created.
  late final _i1.ColumnDateTime timestamp;

  /// The image file
  late final _i1.ColumnString image;

  @override
  List<_i1.Column> get columns => [
    id,
    uniqueId,
    message,
    author,
    timestamp,
    image,
  ];
}

class AiChatInclude extends _i1.IncludeObject {
  AiChatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AiChat.t;
}

class AiChatIncludeList extends _i1.IncludeList {
  AiChatIncludeList._({
    _i1.WhereExpressionBuilder<AiChatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AiChat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AiChat.t;
}

class AiChatRepository {
  const AiChatRepository._();

  /// Returns a list of [AiChat]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<AiChat>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiChatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiChatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AiChat>(
      where: where?.call(AiChat.t),
      orderBy: orderBy?.call(AiChat.t),
      orderByList: orderByList?.call(AiChat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AiChat] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<AiChat?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiChatTable>? where,
    int? offset,
    _i1.OrderByBuilder<AiChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AiChatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AiChat>(
      where: where?.call(AiChat.t),
      orderBy: orderBy?.call(AiChat.t),
      orderByList: orderByList?.call(AiChat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AiChat] by its [id] or null if no such row exists.
  Future<AiChat?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AiChat>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AiChat]s in the list and returns the inserted rows.
  ///
  /// The returned [AiChat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AiChat>> insert(
    _i1.Session session,
    List<AiChat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AiChat>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AiChat] and returns the inserted row.
  ///
  /// The returned [AiChat] will have its `id` field set.
  Future<AiChat> insertRow(
    _i1.Session session,
    AiChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AiChat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AiChat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AiChat>> update(
    _i1.Session session,
    List<AiChat> rows, {
    _i1.ColumnSelections<AiChatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AiChat>(
      rows,
      columns: columns?.call(AiChat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AiChat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AiChat> updateRow(
    _i1.Session session,
    AiChat row, {
    _i1.ColumnSelections<AiChatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AiChat>(
      row,
      columns: columns?.call(AiChat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AiChat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AiChat?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AiChatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AiChat>(
      id,
      columnValues: columnValues(AiChat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AiChat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AiChat>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AiChatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AiChatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AiChatTable>? orderBy,
    _i1.OrderByListBuilder<AiChatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AiChat>(
      columnValues: columnValues(AiChat.t.updateTable),
      where: where(AiChat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AiChat.t),
      orderByList: orderByList?.call(AiChat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AiChat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AiChat>> delete(
    _i1.Session session,
    List<AiChat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AiChat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AiChat].
  Future<AiChat> deleteRow(
    _i1.Session session,
    AiChat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AiChat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AiChat>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AiChatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AiChat>(
      where: where(AiChat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AiChatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AiChat>(
      where: where?.call(AiChat.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
