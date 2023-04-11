import 'package:stoks_chart_overview/features/companies_overview/domain/company_detales.dart';

abstract class CompanyRepository {
  Future<CompanyDetales> getCompanyDetalesBySym(String companySym);
  Future<List<CompanyDetales>> getTrackedCompanies();
}
