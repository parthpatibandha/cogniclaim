import 'package:cogniclaim_server/src/business/data_fetcher.dart';
import 'package:cogniclaim_server/src/business/data_source.dart';
import 'package:cogniclaim_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:http/http.dart' as http;

class PdfDocsDataSource implements DataSource {
  final String title;
  final String owner;
  final String repo;
  final String branch;
  final String basePath;
  final String referenceUrl;

  /// Latest version, if known.
  final String? latestVersion;

  PdfDocsDataSource({
    required this.title,
    required this.owner,
    required this.repo,
    required this.branch,
    required this.basePath,
    required this.referenceUrl,
    this.latestVersion,
  });

  static Future<http.Response> _getPdfDocument(String url) async {
    return await http.get(Uri.parse(url));
  }

  @override
  String get name => title;

  @override
  String get url => referenceUrl.toString();

  @override
  Stream<RawRAGDocument> fetch(
    Session session,
    DataFetcher fetcher, {
    String? path,
  }) async* {
    session.log('getPDFDocument from $referenceUrl', level: LogLevel.debug);
    final fileResponse = await _getPdfDocument(referenceUrl);
    if (fileResponse.statusCode == 200) {
      session.log(
        'getPDFDocument from $referenceUrl ,statusCode: ${fileResponse.statusCode}',
        level: LogLevel.debug,
      );
      yield RawRAGDocument(
        sourceUrl: referenceUrl,
        document: fileResponse.body,
        dataSourceType: DataSourceType.text,
        documentType: RAGDocumentType.documentation,
        title: title,
        domain: "https://firebasestorage.googleapis.com/",
      );
    }
  }
}
