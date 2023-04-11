import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/companies_overview_providers.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/company_detales_updater.dart';

class CompaniesOverview extends HookConsumerWidget {
  const CompaniesOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final touchedIndex = useState<int>(0);
    final companyDetales = ref.watch(companyDetalesUpdaterProvider);
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex.value = -1;
                  return;
                }
                touchedIndex.value =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: companyDetales
                .map(
                  (companyDetail) => PieChartSectionData(
                    value:companyDetail.marketCapitalisation as double,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build2(BuildContext context, WidgetRef ref) {
    final companyRepository = ref.watch(companyRepositoryProvider);
    companyRepository
        .getTrackedCompanies()
        .then((companies) => companies.forEach(print));

    return Scaffold(
      body: Container(
        color: Colors.grey,
      ),
    );
  }
}
