import 'package:cattel_feed/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  ApiStatus? status;
  ApiResponse({this.message, this.data, this.status});
  ApiResponse.set() : status = ApiStatus.notstart;
  ApiResponse.complete(this.data) : status = ApiStatus.complete;
  ApiResponse.error(this.message) : status = ApiStatus.error;
  ApiResponse.loading() : status = ApiStatus.loading;
}
