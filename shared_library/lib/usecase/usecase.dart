import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/equatable/equatable.dart';
import 'package:shared_library/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
