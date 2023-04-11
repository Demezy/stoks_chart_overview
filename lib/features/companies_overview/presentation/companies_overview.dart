import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/exceptions/api_exception.dart';
import 'package:stoks_chart_overview/features/companies_overview/data/company_details_updater_safe.dart';

class CompaniesOverview extends HookConsumerWidget {
  const CompaniesOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hoveredIndex = useState<int>(0);
    final companyesDetails = ref.watch(companyDetailsUpdaterProviderSafe);
    final pieSize =
        min(MediaQuery.of(context).size.width / 1.5, 300).toDouble();
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
        data: (asyncDetails) {
          final details = asyncDetails
              .where((asyncDetail) => asyncDetail.hasValue)
              .toList();
          final failedDetails = asyncDetails
              .where((asyncDetail) => asyncDetail.hasError)
              .toList();
          if (asyncDetails.isEmpty) {
            return Text(const ApiException.apiUnavailable().message());
          }
          return ListView(
            children: [
              SizedBox(
                width: pieSize,
                height: pieSize,
                child: AspectRatio(
                  aspectRatio: 1.3,
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
                          final sectionIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                          hoveredIndex.value = sectionIndex;
                          if (event is FlTapUpEvent ||
                              event is FlTapDownEvent) {
                            context.push(
                              '${Routes.home}${Routes.detales}',
                              extra: details[sectionIndex].value,
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
                          final detail = details[index].value!;
                          final isHovered = index == hoveredIndex.value;
                          return PieChartSectionData(
                            value: detail.marketCapitalisation.toDouble(),
                            radius: isHovered ? 120 : 100,
                            color: Color(
                              Random(detail.symbol.hashCode)
                                  .nextInt(0xffffffff),
                            ),
                            title: detail.symbol,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ...List.generate(
                failedDetails.length,
                (index) {
                  final error = failedDetails[index].asError?.error;
                  return Card(
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline),
                        Flexible(
                          child: Text(
                            error is ApiException
                                ? error.message()
                                : error.toString(),
                                softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
