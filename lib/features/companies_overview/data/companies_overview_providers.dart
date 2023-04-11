import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoks_chart_overview/config/app_global.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/company_repository_dio.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/company_tracked_repository_const.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_repository.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_tracked_repository.dart';

final companyTrackedProvider = Provider<CompanyTrackedRepository>(
  (ref) => CompanyTrackedRepositoryConst(),
);
final companyRepositoryProvider = Provider<CompanyRepository>((ref) {
  final dio = ref.watch(dioApiProvider);
  final trackedRepository =
      ref.watch<CompanyTrackedRepository>(companyTrackedProvider);
  return CompanyRepositoryDio(
    dio: dio,
    companyTrackedRepository: trackedRepository,
  );
});
