import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../common/constant/app_config.dart';
import '../../model/post_model.dart';
import '../../model/user_model.dart';
part 'auth_service.g.dart';


@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET(AppConfig.posts)
  Future<List<PostListModel>> posts();

  @GET(AppConfig.users)
  Future<List<UserData>>users();

}