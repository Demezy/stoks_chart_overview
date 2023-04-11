import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_detales.freezed.dart';
part 'company_detales.g.dart';

@freezed
class CompanyDetales with _$CompanyDetales {
  const factory CompanyDetales({
    @JsonKey(name: 'Symbol') required String symbol,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
        required int marketCapitalisation,
  }) = _CompanyDetales;

  factory CompanyDetales.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetalesFromJson(json);
}
