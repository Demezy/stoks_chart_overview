import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stoks_chart_overview/config/consts.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_detales.dart';
import 'package:stoks_chart_overview/features/companies_overview/presentation/companies_overview.dart';
import 'package:stoks_chart_overview/features/companies_overview/presentation/company_detailed_view.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const CompaniesOverview();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.detales,
          builder: (context, state) {
            final detales = state.extra as CompanyDetales;
            return CompanyDetailedView(
              companyDetales: detales,
            );
          },
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
