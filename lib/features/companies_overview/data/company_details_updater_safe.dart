import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoks_chart_overview/exceptions/api_exception.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/companies_overview_providers.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_details.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_repository.dart';

typedef AsyncCompaniesInfo = List<AsyncValue<CompanyDetails>>;

class CompanyDetailsUpdaterSafe
    extends StateNotifier<AsyncValue<AsyncCompaniesInfo>> {
  final CompanyRepository companyRepository;

  CompanyDetailsUpdaterSafe(this.companyRepository)
      : super(const AsyncValue.loading()) {
    // Load initial data.
    update();
  }

  // Method that retrieve new data from server and update state.
  Future<void> update() async {
    try {
      state = const AsyncValue.loading();
      final updatedData = await companyRepository.getMaybeTrackedCompanies();
      state = AsyncValue.data(updatedData);
    } on ApiException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final companyDetailsUpdaterProviderSafe =
    StateNotifierProvider<CompanyDetailsUpdaterSafe, AsyncValue<AsyncCompaniesInfo>>(
  (ref) {
    final companyRepository = ref.watch(companyRepositoryProvider);
    return CompanyDetailsUpdaterSafe(companyRepository);
  },
);

final companyDetailsStreamProvider =
    StreamProvider<AsyncValue<AsyncCompaniesInfo>>((ref) async* {
  final companyDetails = ref.watch(companyDetailsUpdaterProviderSafe);
  yield companyDetails;
});
