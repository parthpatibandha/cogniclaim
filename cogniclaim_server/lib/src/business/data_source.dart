import 'package:serverpod/serverpod.dart';
import 'package:cogniclaim_server/src/business/data_fetcher.dart';
import 'package:cogniclaim_server/src/generated/protocol.dart';

abstract class DataSource {
  Stream<RawRAGDocument> fetch(Session session, DataFetcher fetcher);

  String get name;
  String get url;
}

enum DataSourceType {
  html,
  markdown,
  text,
}

class RawRAGDocument {
  final String sourceUrl;
  final String document;
  final String title;
  final DataSourceType dataSourceType;
  final RAGDocumentType documentType;
  final String domain;

  RawRAGDocument({
    required this.sourceUrl,
    required this.document,
    required this.title,
    required this.dataSourceType,
    required this.documentType,
    required this.domain,
  });
}
