import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/firebase_auth.dart';
import '../model/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static String uid = 'default_user';

  final FirebaseAuthenticationService _authenticationService =
  FirebaseAuthenticationService();

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      print("asdf");
      add(AuthServerEvent(event));
    });

    on<AuthServerEvent>((event, emit) {
      if (event.userModel == null) {
        uid = 'default_user';
        emit(Unauthenticated());
      } else {
        print("emitindo");
        uid = event.userModel!.uid;
        emit(Authenticated(userModel: event.userModel!));
        add(RetrieveUserInfoEvent());
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(
            event.username, event.password);

        await firestore.collection('users').doc(uid).set({
          'firstname': event.firstname,
          'lastname': event.lastname,
          'birthdate': event.birthdate,
          'username': event.username,
        });
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });


    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } catch (e) {
        emit(AuthError(
            message:
            "Impossível Logar com ${event.username}: ${e.toString()}"));
      }
    });

    on<RetrieveUserInfoEvent>((event, emit) async {
      try {
        DocumentSnapshot userDoc =
        await firestore.collection('users').doc(uid).get();
        if (userDoc.exists) {
          UserModel userInfo = UserModel(
            uid,
            userDoc['firstname'],
            userDoc['lastname'],
            userDoc['birthdate'],
          );
          emit(UserInfoRetrieved(userModel: userInfo));
        }
      } catch (e) {
        // Handle error
        print("Error retrieving user information: $e");
      }
    });



    on<LoginAnonymousUser>((event, emit) async {
      try {
        await _authenticationService.signInAnonimo();
      } catch (e) {
        emit(AuthError(
            message: "Impossível Acessar Anonimamente: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(AuthError(message: "Impossível Efetuar Logout: ${e.toString()}"));
      }
    });
  }
}

/*
   Eventos
*/
abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
  String firstname;
  String lastname;
  String birthdate;

  RegisterUser({required this.username, required this.password, required this.firstname, required this.lastname, required this.birthdate });

}

class LoginUser extends AuthEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class LoginAnonymousUser extends AuthEvent {}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}

class UserInfoRetrieved extends AuthState {
  UserModel userModel;

  UserInfoRetrieved({required this.userModel});
}

class RetrieveUserInfoEvent extends AuthEvent {}


/*
Estados
*/

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  UserModel userModel;
  Authenticated({required this.userModel});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

}

class RetrieveUserInfo extends AuthEvent {}
