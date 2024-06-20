import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste2/news_details_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(
      onToggleTheme: () {},
      isDarkMode: false,
    ),
  ));
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
          labelStyle: TextStyle(color: Colors.amber),
          unselectedLabelColor: Colors.white,
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsScreen(
                        newsId: newsItem.id,
                        titulo: newsItem['titulo'] ?? 'Sem título',
                        conteudo: newsItem['conteudo'] ?? 'Sem conteúdo',
                        imagemUrl: newsItem['image'] ?? '',
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        newsItem['image'] ?? '',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsItem['titulo'] ?? 'Sem título',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              newsItem['conteudo'] ?? 'Sem conteúdo',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
