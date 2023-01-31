// ignore_for_file: avoid_print, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  static get(String url) async {
    var response = await http.get(Uri.parse(url));

    print('Get response ${response.body}');

    return jsonDecode(response.body);
  }

  static Future post(String url, data) async {
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: data);
    print('res >> post ${response.body}');

    // if (response.body.isNotEmpty) {
    return jsonDecode(response.body);
    // }
  }

  static put(String url, Map data) async {
    var response = await http.put(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );

    print('put response ${response.body}');

    // return jsonDecode(response.body);
  }

  static postFormData(String url, Map<String, String> data, List files) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(data);
    for (var file in files) {
      if (file.filePath != null) {
        var fileToAdd =
            await http.MultipartFile.fromPath(file.fieldName, file.filePath!);
        request.files.add(fileToAdd);
      }
    }
    var streamedResponse = await request.send();

    print('response upload ${streamedResponse.statusCode}');
  }

  static putFormData(String url, Map<String, String> data, List files) async {
    var request = http.MultipartRequest('PUT', Uri.parse(url));

    if (data.isNotEmpty) {
      request.fields.addAll(data);
    }

    for (var file in files) {
      if (file.filePath != null) {
        var fileToAdd =
            await http.MultipartFile.fromPath(file.fieldName, file.filePath!);
        request.files.add(fileToAdd);
      }
    }

    print('${request.fields}');

    print('${request.files}');

    var streamedResponse = await request.send();

    print('response upload ${streamedResponse.statusCode}');
  }

  static delete(String url) async {
    var response = await http.put(
      Uri.parse(url),
    );

    print('print response ${response.body}');
    return jsonDecode(response.body);
  }
}
