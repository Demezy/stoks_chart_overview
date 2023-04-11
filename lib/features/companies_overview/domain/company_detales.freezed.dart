// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_detales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompanyDetales _$CompanyDetalesFromJson(Map<String, dynamic> json) {
  return _CompanyDetales.fromJson(json);
}

/// @nodoc
mixin _$CompanyDetales {
  @JsonKey(name: 'Symbol')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  int get marketCapitalisation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyDetalesCopyWith<CompanyDetales> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyDetalesCopyWith<$Res> {
  factory $CompanyDetalesCopyWith(
          CompanyDetales value, $Res Function(CompanyDetales) then) =
      _$CompanyDetalesCopyWithImpl<$Res, CompanyDetales>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Symbol')
          String symbol,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          int marketCapitalisation});
}

/// @nodoc
class _$CompanyDetalesCopyWithImpl<$Res, $Val extends CompanyDetales>
    implements $CompanyDetalesCopyWith<$Res> {
  _$CompanyDetalesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? marketCapitalisation = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      marketCapitalisation: null == marketCapitalisation
          ? _value.marketCapitalisation
          : marketCapitalisation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompanyDetalesCopyWith<$Res>
    implements $CompanyDetalesCopyWith<$Res> {
  factory _$$_CompanyDetalesCopyWith(
          _$_CompanyDetales value, $Res Function(_$_CompanyDetales) then) =
      __$$_CompanyDetalesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Symbol')
          String symbol,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          int marketCapitalisation});
}

/// @nodoc
class __$$_CompanyDetalesCopyWithImpl<$Res>
    extends _$CompanyDetalesCopyWithImpl<$Res, _$_CompanyDetales>
    implements _$$_CompanyDetalesCopyWith<$Res> {
  __$$_CompanyDetalesCopyWithImpl(
      _$_CompanyDetales _value, $Res Function(_$_CompanyDetales) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? marketCapitalisation = null,
  }) {
    return _then(_$_CompanyDetales(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
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
class _$_CompanyDetales implements _CompanyDetales {
  const _$_CompanyDetales(
      {@JsonKey(name: 'Symbol')
          required this.symbol,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          required this.marketCapitalisation});

  factory _$_CompanyDetales.fromJson(Map<String, dynamic> json) =>
      _$$_CompanyDetalesFromJson(json);

  @override
  @JsonKey(name: 'Symbol')
  final String symbol;
  @override
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  final int marketCapitalisation;

  @override
  String toString() {
    return 'CompanyDetales(symbol: $symbol, marketCapitalisation: $marketCapitalisation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompanyDetales &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.marketCapitalisation, marketCapitalisation) ||
                other.marketCapitalisation == marketCapitalisation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, marketCapitalisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompanyDetalesCopyWith<_$_CompanyDetales> get copyWith =>
      __$$_CompanyDetalesCopyWithImpl<_$_CompanyDetales>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompanyDetalesToJson(
      this,
    );
  }
}

abstract class _CompanyDetales implements CompanyDetales {
  const factory _CompanyDetales(
      {@JsonKey(name: 'Symbol')
          required final String symbol,
      @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
          required final int marketCapitalisation}) = _$_CompanyDetales;

  factory _CompanyDetales.fromJson(Map<String, dynamic> json) =
      _$_CompanyDetales.fromJson;

  @override
  @JsonKey(name: 'Symbol')
  String get symbol;
  @override
  @JsonKey(name: 'MarketCapitalization', fromJson: int.parse)
  int get marketCapitalisation;
  @override
  @JsonKey(ignore: true)
  _$$_CompanyDetalesCopyWith<_$_CompanyDetales> get copyWith =>
      throw _privateConstructorUsedError;
}
