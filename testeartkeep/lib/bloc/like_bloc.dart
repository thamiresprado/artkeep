import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/art_model.dart';
import 'auth_bloc.dart';

class LikeBloc
    extends Bloc<LikeEvent, LikeState> {
  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  // Função para verificar se a obra já foi favoritada
  Future<bool> isAlreadyLiked(String artTitle) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(AuthBloc.uid)
        .collection('likes')
        .where('title', isEqualTo: artTitle)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  LikeBloc() : super(WithoutLikes()) {
    on<CreateLike>(
          (event, emit) async {
        try {
          // Verificar se a obra já foi favoritada
          bool alreadyLiked = await isAlreadyLiked(event.art.title);

          if (alreadyLiked) {
            // Emitir um estado indicando que a obra já foi favoritada
            emit(AlreadyLiked());
          } else {
            // Adicionar a obra à coleção de favoritos
            await firestore
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

            // Emitir um estado indicando que a obra foi favoritada com sucesso
            emit(LikeSuccess());
          }
        } catch (e) {
          emit(ErrorLikes(
              message:
              'Não foi possível cadastrar a postagem, tente novamente.'));
        }
      },
    );

    on<RetrieveLikes>(
      (event, emit) async {
        try {
          // Obter os documentos da coleção de likes
          QuerySnapshot querySnapshot =
              await firestore
                  .collection('users')
                  .doc(AuthBloc.uid)
                  .collection('likes')
                  .get();

          // Converter os documentos em instâncias de ArtModel
          List<ArtModel> likedArts =
              querySnapshot.docs.map((doc) {
            Map<String, dynamic> data = doc.data()
                as Map<String, dynamic>;
            return ArtModel(
              id: '',
              primaryImage: data['primaryImage'],
              title: data['title'],
              artistDisplayName:
                  data['artistDisplayName'],
              isHighlight: false,
              additionalImages: [],
              department: '',
              objectName: '',
              objectDate: '',
              city: '',
            );
          }).toList();

          // Emitir o estado com as obras curtidas
          emit(ObtainedArts(arts: likedArts));
        } catch (e) {
          emit(ErrorLikes(
              message:
                  'Não foi possível obter postagens, tente novamente.'));
        }
      },
    );

    on<DeleteLike>(
          (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('likes')
              .where('title', isEqualTo: event.artTitle)  // Use o título para encontrar o documento
              .get()
              .then((querySnapshot) {
            querySnapshot.docs.forEach((doc) {
              doc.reference.delete();
            });
          });
        } catch (e) {
          print('Erro ao excluir do Firestore: $e');
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

class AlreadyLiked extends LikeState {}

class LikeSuccess extends LikeState {}

class CheckIfArtIsLiked extends LikeEvent {
  ArtModel art;

  CheckIfArtIsLiked({required this.art});
}

class ArtIsLiked extends LikeState {
  bool isLiked;

  ArtIsLiked({required this.isLiked});
}

class RetrieveLikes extends LikeEvent {}

class DeleteLike extends LikeEvent {
  String artTitle;

  DeleteLike({required this.artTitle});
}
abstract class LikeState {}

class WithoutLikes extends LikeState {}

class ObtainedArts extends LikeState {
  List<ArtModel> arts;

  ObtainedArts({required this.arts});
}

class ErrorLikes extends LikeState {
  final String message;

  ErrorLikes({required this.message});
}
