import 'package:dio/dio.dart';
import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_detales.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_repository.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_tracked_repository.dart';

typedef Json = Map<String, dynamic>;

class CompanyRepositoryDio implements CompanyRepository {
  final CompanyTrackedRepository companyTrackedRepository;
  final Dio dio;
  CompanyRepositoryDio({
    required this.dio,
    required this.companyTrackedRepository,
  });

  @override
  Future<CompanyDetales> getCompanyDetalesBySym(String companySym) async {
    final companyDetalesResponse = await dio.get<Json>(
      '/query',
      queryParameters: <String, dynamic>{
        'symbol': companySym,
        'function': 'OVERVIEW',
        'apikey': Consts.apiKey,
      },
    );
    if (companyDetalesResponse.statusCode != 200 ||
        companyDetalesResponse.data == null) {
      throw UnimplementedError();
    }
    if (companyDetalesResponse.data!['Note'] != null) {
      throw UnimplementedError();
    }
    late final CompanyDetales companyDetales;
    try {
      companyDetales = CompanyDetales.fromJson(companyDetalesResponse.data!);
    } on TypeError {
      throw UnimplementedError();
    }
    return companyDetales;
  }

  @override
  Future<List<CompanyDetales>> getTrackedCompanies() async {
    final trackedCompanySymbols =
        await companyTrackedRepository.getCompanySymbols();
    final futureCompanyDetails =
        trackedCompanySymbols.map(getCompanyDetalesBySym).toList();
    return Future.wait(futureCompanyDetails);
  }
}
