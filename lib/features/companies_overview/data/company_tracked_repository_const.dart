import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_tracked_repository.dart';

class CompanyTrackedRepositoryConst implements CompanyTrackedRepository {
  @override
  Future<List<String>> getCompanySymbols() async {
    return Consts.trackedCompanySymbols;
  }
}
