import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoks_chart_overview/exceptions/api_exception.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/companies_overview_providers.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_details.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_repository.dart';

typedef CompaniesInfo = List<CompanyDetails>;

class CompanyDetailsUpdater extends StateNotifier<AsyncValue<CompaniesInfo>> {
  final CompanyRepository companyRepository;

  CompanyDetailsUpdater(this.companyRepository)
      : super(const AsyncValue.loading()) {
    // Load initial data.
    // ignore: prefer-async-await
    companyRepository.getTrackedCompanies().then((value) {
      state = AsyncValue.data(value);
    }).onError((error, stackTrace) {
      state = AsyncValue.error(error ?? 'Some error occured', stackTrace);
    });
  }

  // Method that retrieve new data from server and update state.
  Future<void> update() async {
    try {
      state = const AsyncValue.loading();
      final updatedData = await companyRepository.getTrackedCompanies();
      state = AsyncValue.data(updatedData);
    } on ApiException catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final companyDetailsUpdaterProvider =
    StateNotifierProvider<CompanyDetailsUpdater, AsyncValue<CompaniesInfo>>(
  (ref) {
    final companyRepository = ref.watch(companyRepositoryProvider);
    return CompanyDetailsUpdater(companyRepository);
  },
);

final companyDetailsStreamProvider =
    StreamProvider<AsyncValue<CompaniesInfo>>((ref) async* {
  final companyDetails = ref.watch(companyDetailsUpdaterProvider);
  yield companyDetails;
});
