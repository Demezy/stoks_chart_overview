// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyDetales _$$_CompanyDetalesFromJson(Map<String, dynamic> json) =>
    _$_CompanyDetales(
      symbol: json['Symbol'] as String,
      marketCapitalisation: int.parse(json['MarketCapitalization'] as String),
    );

Map<String, dynamic> _$$_CompanyDetalesToJson(_$_CompanyDetales instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'MarketCapitalization': instance.marketCapitalisation,
    };
