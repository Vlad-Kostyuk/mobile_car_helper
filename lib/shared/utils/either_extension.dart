import '../base_domain/either.dart';
import '../base_domain/failure.dart';

extension EitherFailureX<R> on Either<Failure, R> {
  R? get rightOrNull => isRight ? (this as Right<Failure, R>).value : null;
  Failure? get leftOrNull => isLeft ? (this as Left<Failure, R>).value : null;
}
