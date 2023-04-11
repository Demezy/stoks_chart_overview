import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException.tokenLimitExceeded() = _TokenLimitExceeded;
  const factory ApiException.notFound(String sym) = _NotFound;
  const factory ApiException.unrecognizedServerResponse() =
      _UnrecognizedServerResponse;
  const factory ApiException.apiUnavailable() = _ApiUnavailable;
}

// Bypass of some freezed internal problems with toString override.
extension ApiExceptionMessage on ApiException {
  String message() {
    return when(
      notFound: (sym) => 'Записть $sym не найдена, возможно не верное имя',
      tokenLimitExceeded: () =>
          'Превышено колличество запросов в минуту. Подождите или используйте токен с большим доступным колличеством.',
      unrecognizedServerResponse: () => 'Не удалось распознать ответ сервера',
      apiUnavailable: () => 'Внутренняя ошибка при подключении к серверу',
    );
  }
}
