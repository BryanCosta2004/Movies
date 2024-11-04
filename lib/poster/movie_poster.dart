import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String posterPath; // Caminho do cartaz (nome do arquivo na pasta 'images')
  final double width;
  final double height;

  const MoviePoster({
    Key? key,
    required this.posterPath,
    this.width = 120.0,
    this.height = 180.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/$posterPath', // Carrega a imagem do cartaz da pasta 'images'
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Icon(
                Icons.broken_image,
                size: 48,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  final List<String> moviePosters = [
    'poster1.jpg',
    'poster2.jpg',
    'poster3.jpg',
  ]; // Nomes dos arquivos de imagem de cartazes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66, // Ajuste para cartazes verticais
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: moviePosters.length,
          itemBuilder: (context, index) {
            return MoviePoster(
              posterPath: moviePosters[index], // Nome do arquivo na pasta 'images'
            );
          },
        ),
      ),
    );
  }
}