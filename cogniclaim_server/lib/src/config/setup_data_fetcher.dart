import 'package:cogniclaim_server/src/business/data_fetcher.dart';
import 'package:cogniclaim_server/src/business/data_sources/pdf_docs.dart';

late final String latestServerpodVersion;

Future<void> configureDataFetcher() async {
  final policyDoc = PdfDocsDataSource(
    title: 'Cogniclaim Privacy Policy',
    owner: 'cogniclaim',
    repo: 'cogniclaim_server',
    branch: 'main',
    basePath: 'privacy_policy.pdf',
    referenceUrl:
        'https://firebasestorage.googleapis.com/v0/b/flarestudio-it.firebasestorage.app/o/AFourWheeler.pdf?alt=media&token=02beb800-702a-4d2c-98a8-8d39166c4290',
  );

  final priceDoc = PdfDocsDataSource(
    title: 'Pricing Document',
    owner: 'cogniclaim',
    repo: 'cogniclaim_server',
    branch: 'main',
    basePath: 'price_document.pdf',
    referenceUrl:
        'https://firebasestorage.googleapis.com/v0/b/flarestudio-it.firebasestorage.app/o/CarItemPrice.pdf?alt=media&token=b54a50a9-cf68-4c6b-a679-9a1107f5f4c5',
  );

  final dataSources = [
    //policyDoc,
    priceDoc,
  ];

  DataFetcher.configure(dataSources);
}
