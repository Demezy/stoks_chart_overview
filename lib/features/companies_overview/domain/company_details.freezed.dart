// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyDetails _$CompanyDetailsFromJson(Map<String, dynamic> json) {
  return _CompanyDetails.fromJson(json);
}

/// @nodoc
mixin _$CompanyDetails {
  @JsonKey(name: 'Symbol')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  int get marketCapitalisation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyDetailsCopyWith<CompanyDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDetailsCopyWith<$Res> {
  factory $CompanyDetailsCopyWith(
          CompanyDetails value, $Res Function(CompanyDetails) then) =
      _$CompanyDetailsCopyWithImpl<$Res, CompanyDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Symbol')
          String symbol,
      @JsonKey(name: 'Name')
          String name,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          int marketCapitalisation});
}

/// @nodoc
class _$CompanyDetailsCopyWithImpl<$Res, $Val extends CompanyDetails>
    implements $CompanyDetailsCopyWith<$Res> {
  _$CompanyDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? description = null,
    Object? marketCapitalisation = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      marketCapitalisation: null == marketCapitalisation
          ? _value.marketCapitalisation
          : marketCapitalisation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyDetailsCopyWith<$Res>
    implements $CompanyDetailsCopyWith<$Res> {
  factory _$$_CompanyDetailsCopyWith(
          _$_CompanyDetails value, $Res Function(_$_CompanyDetails) then) =
      __$$_CompanyDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Symbol')
          String symbol,
      @JsonKey(name: 'Name')
          String name,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          int marketCapitalisation});
}

/// @nodoc
class __$$_CompanyDetailsCopyWithImpl<$Res>
    extends _$CompanyDetailsCopyWithImpl<$Res, _$_CompanyDetails>
    implements _$$_CompanyDetailsCopyWith<$Res> {
  __$$_CompanyDetailsCopyWithImpl(
      _$_CompanyDetails _value, $Res Function(_$_CompanyDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? description = null,
    Object? marketCapitalisation = null,
  }) {
    return _then(_$_CompanyDetails(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      marketCapitalisation: null == marketCapitalisation
          ? _value.marketCapitalisation
          : marketCapitalisation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompanyDetails implements _CompanyDetails {
  const _$_CompanyDetails(
      {@JsonKey(name: 'Symbol')
          required this.symbol,
      @JsonKey(name: 'Name')
          required this.name,
      @JsonKey(name: 'Description')
          required this.description,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          required this.marketCapitalisation});

  factory _$_CompanyDetails.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyDetailsFromJson(json);

  @override
  @JsonKey(name: 'Symbol')
  final String symbol;
  @override
  @JsonKey(name: 'Name')
  final String name;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  final int marketCapitalisation;

  @override
  String toString() {
    return 'CompanyDetails(symbol: $symbol, name: $name, description: $description, marketCapitalisation: $marketCapitalisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyDetails &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.marketCapitalisation, marketCapitalisation) ||
                other.marketCapitalisation == marketCapitalisation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, symbol, name, description, marketCapitalisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyDetailsCopyWith<_$_CompanyDetails> get copyWith =>
      __$$_CompanyDetailsCopyWithImpl<_$_CompanyDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyDetailsToJson(
      this,
    );
  }
}

abstract class _CompanyDetails implements CompanyDetails {
  const factory _CompanyDetails(
      {@JsonKey(name: 'Symbol')
          required final String symbol,
      @JsonKey(name: 'Name')
          required final String name,
      @JsonKey(name: 'Description')
          required final String description,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          required final int marketCapitalisation}) = _$_CompanyDetails;

  factory _CompanyDetails.fromJson(Map<String, dynamic> json) =
      _$_CompanyDetails.fromJson;

  @override
  @JsonKey(name: 'Symbol')
  String get symbol;
  @override
  @JsonKey(name: 'Name')
  String get name;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  int get marketCapitalisation;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyDetailsCopyWith<_$_CompanyDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
