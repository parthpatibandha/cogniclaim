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
  final Uri referenceUrl;

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

  static Future<http.Response> _getPdfDocument(Uri url) async {
    return await http.get(url);
  }

  @override
  String get name => 'GithubDocs:$owner/$repo:$basePath';

  @override
  Stream<RawRAGDocument> fetch(
    Session session,
    DataFetcher fetcher, {
    String? path,
    Uri? referenceUrl,
  }) async* {
    if (referenceUrl != null) {
      final fileResponse = await _getPdfDocument(referenceUrl);
      if (fileResponse.statusCode == 200) {
        yield RawRAGDocument(
          sourceUrl: referenceUrl,
          document: fileResponse.body,
          dataSourceType: DataSourceType.markdown,
          documentType: RAGDocumentType.documentation,
          title: title,
          domain: "",
        );
      }
    }
  }
}
