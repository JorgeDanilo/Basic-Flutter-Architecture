class ApiResponse<T> {
  bool isOk;
  String msg;
  T result;

  ApiResponse.isOk(this.result) {
    this.isOk = true;
  }

  ApiResponse.isError(this.msg) {
    this.isOk = false;
  }
}