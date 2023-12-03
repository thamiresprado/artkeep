//campos obrigatorios retirados da api para
// criar o produto

class ArtModel {
  final bool isHighlight;
  final String primaryImage;
  final List<String> additionalImages;
  final String department;
  final String objectName; //(se é pintura,fotografia, etc)
  final String title;
  final String artistDisplayName;
  final String objectDate;
  final String geographyType;

  ArtModel({
    required this.isHighlight,
    required this.primaryImage,
    required this.additionalImages,
    required this.department,
    required this.objectName,
    required this.title,
    required this.artistDisplayName,
    required this.objectDate,
    required this.geographyType,
  });

  //construtor para sair do formato json
//e ir para formato que o dart entende
  factory ArtModel.fromMap(
      Map<String, dynamic> map) {
    return ArtModel(
      isHighlight: map['isHighlight'],
      primaryImage: map['primaryImage'],
      additionalImages: List<String>.from(
          (map['additionalImages'] as List)),
      department: map['department'],
      objectName: map['objectName'],
      title: map['title'],
      artistDisplayName: map['artistDisplayName'],
      objectDate: map['objectDate'],
      geographyType: map['geographyType'],
    );
  }
}