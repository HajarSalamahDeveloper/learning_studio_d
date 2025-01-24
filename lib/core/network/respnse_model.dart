/// A generic model representing a standard response structure with result, message, and success indicators.
/// [note] this class may change based on backend structure
class ResponseModel<T> {
  /// The result data of type T.
  T? result;

  /// A message associated with the response.
  String? message;

  /// Indicates the success status of the response.
  bool? success;

  /// Default constructor for creating a [ResponseModel] instance.
  ResponseModel({this.result, this.message, this.success});

  /// Constructor to create a [ResponseModel] instance from JSON data.
  ResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] as T?;
    message = json['message'] as String?;
    success = json['success'] as bool?;
  }
}
