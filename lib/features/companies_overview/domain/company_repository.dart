import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_details.dart';

abstract class CompanyRepository {
  Future<CompanyDetails> getCompanyDetailsBySym(String companySym);
  Future<List<CompanyDetails>> getTrackedCompanies();
  // Return either success info or String of usuccessful sym. Cathes api exceptions.
  Future<List<AsyncValue<CompanyDetails>>> getMaybeTrackedCompanies();
}
