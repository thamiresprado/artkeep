import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/art_model.dart';
import 'auth_bloc.dart';

class LikeBloc extends Bloc<LikeEvent,
    LikeState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  LikeBloc() : super(WithoutLikes()) {
    on<CreateLike>(
          (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('likes')
              .add(
            {
              'primaryImage': event.art.primaryImage,
              'title': event.art.title,
              'artistDisplayName': event.art.artistDisplayName,
            },
          );
        } catch (e) {
          emit(ErrorLikes(
              message:
              'Não foi possível cadastrar a postagem, tente novamente.'));
        }
      },
    );

    on<RetrieveLikes>(
          (event, emit) {
        try {
          firestore.doc(AuthBloc.uid).collection('likes').get();
        } catch (e) {
          emit(ErrorLikes(
              message: 'Não foi possível obter postagens, tente novamente.'));
        }
      },
    );


    on<DeleteLike>(
          (event, emit) {
        try {
          firestore
              .doc(AuthBloc.uid)
              .collection('likes')
              .doc(event.artId)
              .delete();
        } catch (e) {
          emit(ErrorLikes(
              message:
              'Não foi possível remover a postagem, tente novamente.'));
        }
      },
    );
  }
}

abstract class LikeEvent {}

class CreateLike extends LikeEvent {
  ArtModel art;

  CreateLike({required this.art});
}

class RetrieveLikes extends LikeEvent {}



class DeleteLike extends LikeEvent {
  String artId;

  DeleteLike({required this.artId});
}

abstract class LikeState {}

class WithoutLikes extends LikeState {}

class ObtainedArts extends LikeState {
  ArtModel art;

  ObtainedArts({required this.art});
}

class ErrorLikes extends LikeState {
  final String message;

  ErrorLikes({required this.message});
}