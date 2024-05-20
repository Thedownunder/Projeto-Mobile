import 'package:flutter/material.dart';

void main() {
  runApp(MeuPortalDeNoticias());
}

class MeuPortalDeNoticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal de Notícias',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NoticiasWidget(),
    Text('Índice 1: Favoritos'),
    Text('Índice 2: Configurações'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portal de Notícias'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implemente a ação de pesquisa
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Notícias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NoticiasWidget extends StatelessWidget {
  final List<Noticia> noticias = [
    Noticia(titulo: 'Notícia 1', descricao: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    Noticia(titulo: 'Notícia 2', descricao: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
    Noticia(titulo: 'Notícia 3', descricao: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
    Noticia(titulo: 'Notícia 4', descricao: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    Noticia(titulo: 'Notícia 5', descricao: 'Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra.'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(noticias[index].titulo),
          subtitle: Text(noticias[index].descricao),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhesNoticia(noticia: noticias[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class DetalhesNoticia extends StatelessWidget {
  final Noticia noticia;

  DetalhesNoticia({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(noticia.descricao),
      ),
    );
  }
}

class Noticia {
  final String titulo;
  final String descricao;

  Noticia({required this.titulo, required this.descricao});
}

}
