import 'package:casetest/feature/login/bloc/login_event.dart';
import 'package:casetest/feature/login/bloc/login_state.dart';
import 'package:domain/params/login_params.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(InitialLoginState()) {
    on<SubmittingLoginEvent>((event, emit) async {
      emit(LoadingLoginState());
      final result = await loginUseCase
          .call(LoginParams(email: event.email, password: event.password));

      print("Bloc -> ${result.isRight()}");
      result.fold((l) => emit(ErrorLoginState(l.message)),
          (r) => emit(SuccessLoginState()));
    });
  }
}
