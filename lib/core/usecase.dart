abstract class UseCase<Params, Result> {
  Result call(Params params);
}

abstract class UseCaseNoParams<Result> {
  Result call();
}
