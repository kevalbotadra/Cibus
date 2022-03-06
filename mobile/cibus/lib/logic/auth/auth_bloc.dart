import 'package:bloc/bloc.dart';
import 'package:cibus/data/providers/auth_provider.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/logic/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider _authProvider;

  AuthBloc(AuthProvider authProvider)
      : _authProvider = authProvider,
        super(InitialAuthenticationState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      final User? user = await _authProvider.getCurrentUser();
      if (user != null) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield Authenticated();
    }

    if (event is LoggedOut) {
      await _authProvider.logout();
      yield Unauthenticated();
    }

    if (event is SubmitSignUp) {
      await _authProvider.registerUserFully(
          name: event.name, orgName: event.orgName, orgType: event.orgType);

      yield Authenticated();
    }
  }
}
