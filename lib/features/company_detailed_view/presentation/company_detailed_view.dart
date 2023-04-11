import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_detales.dart';

class CompanyDetailedView extends StatelessWidget {
  final CompanyDetales companyDetales;

  const CompanyDetailedView({
    required this.companyDetales,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyDetales.name),
      ),
      body: ListView(
        children: [
          FlutterLogo(
            size: min(MediaQuery.of(context).size.width * 0.5, 300),
          ),
          Card(
            child: Text('Description: ${companyDetales.description}'),
          ),
          Card(
            child: Text(
              'Capitalisation: ${companyDetales.marketCapitalisation}',
            ),
          ),
        ],
      ),
    );
  }
}
