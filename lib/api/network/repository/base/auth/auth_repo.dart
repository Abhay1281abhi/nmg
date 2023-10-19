import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import '../../../../../model/post_model.dart';
import '../../../../../model/user_model.dart';
import '../../../result.dart';
import '../../../../service/auth_service.dart';
import '../../base_repo.dart';

@lazySingleton
class AuthRepository extends BaseRepository {

  Future<Result<List<PostListModel>>> getPost() async =>
      safeCall(AuthService(await dio).posts(
      ));

  Future<Result<List<UserData>>> getUser() async =>
      safeCall(AuthService(await dio).users(
      ));
}
