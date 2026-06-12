final class ResponseModel<T> {
  const ResponseModel({required this.data, this.message});

  final T data;
  final String? message;
}
