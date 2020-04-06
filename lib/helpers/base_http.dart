import 'package:http/http.dart' as http;
import 'package:meu_bolso_seguro_mobile/helpers/base_headers.dart';

Future<http.Response> get(String url) async {
  final headers = await resolveHeaders();
  var response = await http.get(url, headers: headers);
  return response;
}

Future<http.Response> post(String url, {body}) async {
  final headers = await resolveHeaders();
  var response = await http.post(url, body: body, headers: headers);
  return response;
}

Future<http.Response> put(String url, {body}) async {
  final headers = await resolveHeaders();
  var response = await http.put(url, body: body, headers: headers);
  return response;
}

Future<http.Response> delete(String url) async {
  final headers = await resolveHeaders();
  var response = await http.delete(url, headers: headers);
  return response;
}