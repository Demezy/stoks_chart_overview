import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_details.freezed.dart';
part 'company_details.g.dart';

@freezed
class CompanyDetails with _$CompanyDetails {
  const factory CompanyDetails({
    @JsonKey(name: 'Symbol') required String symbol,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Description') required String description,
    @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
        required int marketCapitalisation,
  }) = _CompanyDetails;

  factory CompanyDetails.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailsFromJson(json);
}
