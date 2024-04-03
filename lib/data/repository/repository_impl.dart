import 'package:dartz/dartz.dart';
import 'package:my_gallery/data/mapper/mapper.dart';
import 'package:my_gallery/data/network/failure.dart';

import 'package:my_gallery/data/network/requests.dart';
import 'package:my_gallery/domain/model/authentication_model.dart';

import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthenticationModel>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);

      // success
      // return either right
      // return data
      return Right(response.toDomain());
    } catch (error) {
      return Left(Failure(404, error.toString()));
    }
  }
}
