import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException.apiRateLimitExceeded() = _ApiRateLimitExceeded;
  const factory ApiException.unrecognizedServerResponse() =
      _UnrecognizedServerResponse;
  const factory ApiException.apiUnavailable() = _ApiUnavailable;
}

// Bypass of some freezed internal problems with toString override.
extension ApiExceptionMessage on ApiException {
  String message() {
    return when(
      apiRateLimitExceeded: () =>
          'Превышено колличество запросов в минуту. Подождите или используйте токен с большим доступным колличеством.',
      unrecognizedServerResponse: () => 'Не удалось распознать ответ сервера',
      apiUnavailable: () => 'Внутренняя ошибка при подключении к серверу',
    );
  }
}
