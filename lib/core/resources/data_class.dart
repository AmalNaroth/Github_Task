abstract class DataState<T> {
  const DataState({this.data, this.error});

  final T? data;
  final String? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(this.data) : super(data: data);

  final T data;
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(this.error) : super(error: error);

  final String error;
}
