import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioApiProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://www.alphavantage.co/'));
  return dio;
});
