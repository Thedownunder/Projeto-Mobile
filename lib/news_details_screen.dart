import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String newsId;
  final String titulo;
  final String conteudo;
  final String imagemUrl;

  NewsDetailsScreen({
    required this.newsId,
    required this.titulo,
    required this.conteudo,
    required this.imagemUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Notícia'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imagemUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              titulo,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              conteudo,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  HomePage({required this.onToggleTheme, required this.isDarkMode});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 5 tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portal de Notícias'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: widget.onToggleTheme,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Saúde'),
            Tab(text: 'Tecnologia'),
            Tab(text: 'Esportes'),
            Tab(text: 'Negócios'),
            Tab(text: 'Entretenimento'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewsList('Saúde'),
          _buildNewsList('Tecnologia'),
          _buildNewsList('Esportes'),
          _buildNewsList('Negócios'),
          _buildNewsList('Entretenimento'),
        ],
      ),
    );
  }

  Widget _buildNewsList(String category) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('news')
          .where('categoria', isEqualTo: category)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar notícias'));
        } else {
          final news = snapshot.data!.docs;
          if (news.isEmpty) {
            return Center(child: Text('Não há notícias nesta categoria'));
          }
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final newsItem = news[index];
              return ListTile(
                title: Text(newsItem['titulo'] ?? 'Sem título'),
                subtitle: Text(newsItem['conteudo'] ?? 'Sem conteúdo'),
                leading: Image.network(
                  newsItem['imagem'] ??
                      '', // Supondo que a chave do campo de imagem seja 'imagem'
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        newsId: newsItem.id,
                        titulo: newsItem['titulo'] ?? 'Sem título',
                        conteudo: newsItem['conteudo'] ?? 'Sem conteúdo',
                        imagemUrl: newsItem['imagem'] ?? '',
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
