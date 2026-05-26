abstract interface class UseCase<Result, Params> {
  Result call(Params params);
}

final class NoParams {
  const NoParams();
}
