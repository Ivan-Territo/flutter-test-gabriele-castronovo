import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {

  static const String _baseUrl = 'https://69846b7e885008c00db120c3.mockapi.io/api/v1';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<List<Map<String, dynamic>>> getRooms() async {
    try {
      final response = await _dio.get('/Exam1');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        if (data.isNotEmpty && data[0]['rooms'] != null) {
          final List<dynamic> rooms = data[0]['rooms'];
          return rooms.cast<Map<String, dynamic>>();
        }
        return [];
      }
      return [];
    } catch (e) {
      if (kDebugMode) { print('❌ Errore getRooms: $e'); }
      return [];
    }
  }
}
