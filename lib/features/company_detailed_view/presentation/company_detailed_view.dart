import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stoks_chart_overview/features/companies_overview/domain/company_details.dart';

class CompanyDetailedView extends StatelessWidget {
  final CompanyDetails companyDetails;

  const CompanyDetailedView({
    required this.companyDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyDetails.name),
      ),
      body: ListView(
        children: [
          FlutterLogo(
            size: min(MediaQuery.of(context).size.width * 0.5, 300),
          ),
          Card(
            child: Text('Description: ${companyDetails.description}'),
          ),
          Card(
            child: Text(
              'Capitalisation: ${companyDetails.marketCapitalisation}',
            ),
          ),
        ],
      ),
    );
  }
}
