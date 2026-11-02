import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';
import 'player_screen.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Film'),
      ),
      body: ListView(
        children: [
          Image.network(
            movie.backdrop,
            height: 245,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox(
              height: 245,
              child: Icon(
                Icons.movie,
                size: 70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '⭐ ${movie.rating}   •   ${movie.year}   •   ${movie.genre}',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppTheme.blue,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlayerScreen(title: movie.title),
                      ),
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Tonton Sekarang'),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Sinopsis',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.description,
                  style: const TextStyle(
                    height: 1.6,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Poster dan video bukan konten film sebenarnya.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
