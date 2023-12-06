import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../provider/firebase_auth.dart';
import '../model/user_model.dart';
//import '../provider/firebase_firestore.dart';

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
      }
    });

    // on<RegisterUser>((event, emit) async {
    //   try {
    //     await _authenticationService.createUserWithEmailAndPassword(
    //         event.username, event.password);
    //
    //   } catch (e) {
    //     emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
    //   }
    // });

    on<RegisterUser>((event, emit) async {
      try {
        // Registra o usuário no serviço de autenticação
        await _authenticationService.createUserWithEmailAndPassword(
            event.username, event.password);

        // Cria um usuário no Firestore com os dados fornecidos
        await firestore.collection('users').doc(uid).set({
          'firstname': event.firstname,
          'lastname': event.lastname,
          'birthdate': event.birthdate,
          'username': event.username,
          //'password': event.password,
          // Adicione outros campos conforme necessário
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

    // on<RetrieveUserInfo>((event, emit) async {
    //   try {
    //     // Verifique se o usuário está autenticado
    //     if (uid != 'default_user') {
    //       // Consulte o Firestore para obter as informações do usuário
    //       DocumentSnapshot userSnapshot =
    //       await firestore.collection('users').doc(uid).get();
    //
    //       // Verifique se o documento existe antes de acessar os dados
    //       if (userSnapshot.exists) {
    //         // Crie um objeto UserModel com base nos dados recuperados
    //         UserModel userModel = UserModel(
    //           uid: uid,
    //           firstname: userSnapshot['firstname'],
    //           lastname: userSnapshot['lastname'],
    //           birthdate: userSnapshot['birthdate'],
    //           // Adicione outros campos conforme necessário
    //         );
    //
    //         // Emita o estado UserInfoRetrieved com as informações do usuário
    //         emit(UserInfoRetrieved(userModel: userModel));
    //       } else {
    //         // Se o documento não existir, emita um estado de erro ou faça o tratamento adequado
    //         emit(AuthError(message: "Usuário não encontrado no banco de dados."));
    //       }
    //     } else {
    //       // Se o usuário não estiver autenticado, emita um estado de erro ou faça o tratamento adequado
    //       emit(AuthError(message: "Usuário não autenticado."));
    //     }
    //   } catch (e) {
    //     // Se ocorrer algum erro durante a recuperação, emita um estado de erro
    //     emit(AuthError(message: "Erro ao recuperar informações do usuário: ${e.toString()}"));
    //   }
    // });

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
