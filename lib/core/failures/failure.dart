class AppFailure {
  final String message;

  AppFailure({this.message = "An unexpected error occured!"});
}

final class ServerFailure extends AppFailure {
  final int statusCode;

  ServerFailure({this.statusCode = 500, super.message});
}
