import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiClient {
  static const String baseUrl = 'https://smartsupplymobile.onrender.com';
  final AuthService _authService = AuthService();

  // Make authenticated GET request
  Future<http.Response> get(String endpoint) async {
    final token = await _authService.getIdToken();
    
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    return _handleResponse(response);
  }

  // Make authenticated POST request
  Future<http.Response> post(String endpoint, {Map<String, dynamic>? body}) async {
    final token = await _authService.getIdToken();
    
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: body != null ? json.encode(body) : null,
    );

    return _handleResponse(response);
  }

  // Make authenticated PUT request
  Future<http.Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    final token = await _authService.getIdToken();
    
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: body != null ? json.encode(body) : null,
    );

    return _handleResponse(response);
  }

  // Make authenticated DELETE request
  Future<http.Response> delete(String endpoint) async {
    final token = await _authService.getIdToken();
    
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    return _handleResponse(response);
  }

  // Test API connection
  Future<Map<String, dynamic>> testConnection() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return {
        'success': true,
        'data': json.decode(response.body),
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // Test authenticated endpoint
  Future<Map<String, dynamic>> testAuthenticatedEndpoint() async {
    try {
      final response = await get('/api/user/profile');
      return {
        'success': true,
        'data': json.decode(response.body),
      };
    } catch (e) {
      return {
        'success': false,
        'error': e.toString(),
      };
    }
  }

  // Handle HTTP response
  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw HttpException(
        'HTTP ${response.statusCode}: ${response.body}',
        response.statusCode,
      );
    }
  }
}

class HttpException implements Exception {
  final String message;
  final int statusCode;

  HttpException(this.message, this.statusCode);

  @override
  String toString() => message;
}