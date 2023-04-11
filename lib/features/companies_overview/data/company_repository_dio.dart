import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/exceptions/api_exception.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_details.dart';
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
  Future<CompanyDetails> getCompanyDetailsBySym(String companySym) async {
    final companyDetailsResponse = await dio.get<Json>(
      '/query',
      queryParameters: <String, dynamic>{
        'symbol': companySym,
        'function': 'OVERVIEW',
        'apikey': Consts.apiKey,
      },
    );
    if (companyDetailsResponse.statusCode != 200 ||
        companyDetailsResponse.data == null) {
      throw const ApiException.apiUnavailable();
    }
    if (companyDetailsResponse.data!.isEmpty) {
      throw ApiException.notFound(companySym);
    }
    if (companyDetailsResponse.data!['Note'] != null ||
        companyDetailsResponse.data!.length == 1) {
      throw const ApiException.tokenLimitExceeded();
    }
    late final CompanyDetails companyDetails;
    try {
      companyDetails = CompanyDetails.fromJson(companyDetailsResponse.data!);
    } on Exception catch (e) {
      if (e is TypeError) {
        Error.throwWithStackTrace(
          const ApiException.unrecognizedServerResponse(),
          StackTrace.current,
        );
      }
      rethrow;
    }
    return companyDetails;
  }

  @override
  Future<List<CompanyDetails>> getTrackedCompanies() async {
    final trackedCompanySymbols =
        await companyTrackedRepository.getCompanySymbols();
    final futureCompanyDetails =
        trackedCompanySymbols.map(getCompanyDetailsBySym).toList();
    final companyDetails = await Future.wait(futureCompanyDetails);
    return companyDetails;
  }

  @override
  Future<List<AsyncValue<CompanyDetails>>> getMaybeTrackedCompanies() async {
    final trackedCompanySymbols =
        await companyTrackedRepository.getCompanySymbols();
    final futureCompanyDetails = trackedCompanySymbols
        .map(getCompanyDetailsBySym)
        .map<Future<AsyncValue<CompanyDetails>>>(
          (futureDetales) =>
              AsyncValue.guard<CompanyDetails>(() => futureDetales),
        )
        .toList();
    return Future.wait(futureCompanyDetails);
  }
}
