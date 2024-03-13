import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lalilo/services/auth/auth_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _authService = AuthService();
  HomeBloc() : super(const HomeInitial()) {
    on<LoginEvent>((event, emit) async{
      final user = await _authService.authenticateUser(event.username, event.password);
      if(user != null){
        emit(SuccessfulLoginState(user));
      }
    });
  }
}
