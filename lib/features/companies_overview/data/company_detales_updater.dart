import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/companies_overview_providers.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_detales.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_repository.dart';

typedef CompaniesInfo = List<CompanyDetales>;

class CompanyDetalesUpdater extends StateNotifier<CompaniesInfo> {
  final CompanyRepository companyRepository;
  CompanyDetalesUpdater(this.companyRepository) : super([]) {
    try {
      // ignore: prefer-async-await
      companyRepository.getTrackedCompanies().then((value) => state = value);
    } finally {}
  }

  // Method that retrieve new data from server and update state.
  Future<void> update() async {
    try {
      state = await companyRepository.getTrackedCompanies();
    } finally {}
  }
}

final companyDetalesUpdaterProvider =
    StateNotifierProvider<CompanyDetalesUpdater, CompaniesInfo>((ref) {
  final companyRepository =
      ref.watch<CompanyRepository>(companyRepositoryProvider);
  return CompanyDetalesUpdater(companyRepository);
});
