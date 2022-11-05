import 'package:equatable/equatable.dart';
import 'package:news_app/core/error/failure.dart';
import 'package:news_app/core/utils/import_files.dart';

abstract class UseCase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}