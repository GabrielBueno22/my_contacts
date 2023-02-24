// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_contacts/models/User.dart';
import 'package:my_contacts/repositories/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  SignUpBloc({required this.userRepository}) : super(SignUpInitial()) {
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignUp(
      SignUpEvent event, Emitter<SignUpState> emitter) async {
    emitter(SignUpLoading());
    try {
      await userRepository.signUp(event.user);
      emitter(SignUpSuccess());
    } catch (e) {
      emitter(SignUpFail());
    }
  }
}
