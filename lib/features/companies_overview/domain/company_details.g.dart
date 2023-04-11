// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyDetails _$$_CompanyDetailsFromJson(Map<String, dynamic> json) =>
    _$_CompanyDetails(
      symbol: json['Symbol'] as String,
      name: json['Name'] as String,
      description: json['Description'] as String,
      marketCapitalisation: int.parse(json['MarketCapitalization'] as String),
    );

Map<String, dynamic> _$$_CompanyDetailsToJson(_$_CompanyDetails instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'Name': instance.name,
      'Description': instance.description,
      'MarketCapitalization': instance.marketCapitalisation,
    };
