import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://bookbox-kff6.onrender.com/api/v1';

class HttpService {
  static Future<http.Response> getRequest(String path,
      [void Function(Map<String, dynamic>, {String? type})? updateData]) async {
    final accessToken = await getAccessTokenFromLogin();
    if (accessToken == null) {
      throw Exception('Access token not found');
    }
    final url = Uri.parse('$baseUrl$path');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await http.get(url, headers: headers);
    printRequestInfo('GET', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> deleteRequest(String path, body) async {
    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);

    final accessToken = await getAccessTokenFromLogin();
    if (accessToken == null) {
      throw Exception('Access token not found');
    }
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response =
        await http.delete(url, headers: headers, body: encodedBody);
    printRequestInfo('DELETE', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> deleteRequestWithoutBody(String path) async {
    final url = Uri.parse('$baseUrl$path');

    final accessToken = await getAccessTokenFromLogin();
    if (accessToken == null) {
      throw Exception('Access token not found');
    }
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await http.delete(url, headers: headers);
    printRequestInfo('DELETE', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> getRequestNoAuth(String path) async {
    final url = Uri.parse('$baseUrl$path');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    printRequestInfo('GET', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> loginPostRequest(
      String path, dynamic body) async {
    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);
    final response = await http.post(url, body: encodedBody, headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  static Future<http.Response> postRequestNoAuth(
      String path, dynamic body) async {
    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);
    final response = await http.post(url, body: encodedBody, headers: {
      'Content-Type': 'application/json',
    });
    printRequestInfo('POST', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> postRequest(String path, dynamic body) async {
    print(body);

    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);

    final accessToken = await getAccessTokenFromLogin();
    if (accessToken == null) {
      throw Exception('Access token not found');
    }

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await http.post(url, body: encodedBody, headers: headers);
    printRequestInfo('POST', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> patchRequest(String path, dynamic body) async {
    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);

    final accessToken = await getAccessTokenFromLogin();
    if (accessToken == null) {
      throw Exception('Access token not found');
    }

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await http.patch(url, body: encodedBody, headers: headers);
    printRequestInfo('PATCH', url, response.statusCode, response.body);

    return response;
  }

  static Future<http.Response> registerPostRequest(
      String path, dynamic body) async {
    final url = Uri.parse('$baseUrl$path');
    final encodedBody = json.encode(body);
    final response = await http.post(url, body: encodedBody, headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  static Future<http.Response> putRequest(String path, dynamic body) async {
    final url = Uri.parse('$baseUrl$path');
    final response = await http.put(url, body: body);
    return response;
  }

  static Future<String?> getAccessTokenFromLogin() async {
    // Replace this with the actual method you use to get the access token after login.
    // For example, this could be a method that retrieves the token from a secure storage.
    // For now, return a placeholder token.
    return 'your_access_token_here';
  }

  static void printRequestInfo(
    String method,
    Uri url,
    int statusCode,
    String responseBody,
  ) {
    print('Request Info:');
    print('Method: $method');
    print('URL: $url');
    print('Status Code: $statusCode');
    print('Response Body: $responseBody');
  }
}
