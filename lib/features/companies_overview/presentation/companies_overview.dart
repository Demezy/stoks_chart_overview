import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/exceptions/api_exception.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/company_details_updater.dart';

class CompaniesOverview extends HookConsumerWidget {
  const CompaniesOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoveredIndex = useState<int>(0);
    final companyesDetails = ref.watch(companyDetailsUpdaterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('main page'),
      ),
      body: companyesDetails.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          if (kDebugMode) {
            print(stackTrace);
          }
          if (error is ApiException) {
            return Text(error.message());
          }
          return Text('$error');
        },
        data: (details) {
          return AspectRatio(
            aspectRatio: 1.3,
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        hoveredIndex.value = -1;
                        return;
                      }
                      final sectionIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                      hoveredIndex.value = sectionIndex;
                      if (event is FlTapUpEvent) {
                        context.push(
                          '/${Routes.detales}',
                          extra: details[sectionIndex],
                        );
                      }
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: List<PieChartSectionData>.generate(
                    details.length,
                    (index) {
                      final detail = details[index];
                      final isHovered = index == hoveredIndex.value;
                      return PieChartSectionData(
                        value: detail.marketCapitalisation.toDouble(),
                        radius: isHovered ? 120 : 100,
                        color: Color(
                          Random(detail.symbol.hashCode).nextInt(0xffffffff),
                        ),
                        title: detail.symbol,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
