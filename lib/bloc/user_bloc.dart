import 'package:nmg/api/network/repository/base/auth/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_model.dart';


class UserEvent {}

class UserRefreshEvent extends UserEvent {
  UserRefreshEvent();
}

class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  List<UserData> response;

  UserSuccessState(this.response);
}

class UserErrorState extends UserState {
  String errorMsg;
  UserErrorState(this.errorMsg);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  AuthRepository authRepository = AuthRepository();

  UserBloc(this.authRepository) : super(UserInitialState());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is UserRefreshEvent ){
      try {
        yield UserLoadingState();

        var res = await authRepository.getUser();

        yield UserSuccessState(res.data);

      } catch (e){
        print(e.toString());
      }

    }
  }
}








