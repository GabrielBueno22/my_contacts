part of 'sign_up_bloc.dart';

class SignUpEvent extends Equatable {
  final User user;
  const SignUpEvent({required this.user});

  @override
  List<Object> get props => [user];
}
