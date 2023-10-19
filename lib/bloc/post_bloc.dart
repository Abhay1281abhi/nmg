import 'package:nmg/api/network/repository/base/auth/auth_repo.dart';
import 'package:nmg/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostEvent {}

class PostRefreshEvent extends PostEvent {
  PostRefreshEvent();
}

class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostSuccessState extends PostState {

  List<PostListModel> response;

  PostSuccessState(this.response);
}

class PostErrorState extends PostState {
  String errorMsg;
  PostErrorState(this.errorMsg);
}

class PostBloc extends Bloc<PostEvent, PostState> {
  AuthRepository authRepository = AuthRepository();

  PostBloc(this.authRepository) : super(PostInitialState());

  Stream<PostState> mapEventToState(PostEvent event) async* {
    if(event is PostRefreshEvent ){
      try {
        yield PostLoadingState();

        var res = await authRepository.getPost();

        yield PostSuccessState(res.data);

      } catch (e){
        print(e.toString());
      }

    }
  }
}








