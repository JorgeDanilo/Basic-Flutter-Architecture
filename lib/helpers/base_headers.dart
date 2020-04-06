Future<Map<String, String>> resolveHeaders() async {
  var headers = await _applyAutorization();
  return headers;
}

_applyAutorization() {
  var token = "xxxx";
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${token}"
  };
  return headers;
}