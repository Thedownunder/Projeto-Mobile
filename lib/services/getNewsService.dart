import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String categoria;
  final String conteudo;
  final Timestamp data;
  final String image;
  final String titulo;

  News({
    required this.categoria,
    required this.conteudo,
    required this.data,
    required this.image,
    required this.titulo,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      categoria: map['categoria'],
      conteudo: map['conteudo'],
      data: map['data'],
      image: map['image'],
      titulo: map['titulo'],
    );
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> getNews() {
  final teste = FirebaseFirestore.instance.collection('news').snapshots();
  print("Aqui o teste");
  print(teste);
  return FirebaseFirestore.instance.collection('news').snapshots();
}
// Future<List<News>> getNews() async {
//   List<News> newsList = [];

//   try {
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection('news').get();
//     for (var doc in querySnapshot.docs) {
//       newsList.add(News.fromMap(doc.data() as Map<String, dynamic>));
//     }
//   } catch (e) {
//     print("Erro ao buscar notícias: $e");
//   }

//   return newsList;
// }
