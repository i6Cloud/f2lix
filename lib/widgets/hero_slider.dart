import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/detail_screen.dart';
import '../theme/app_theme.dart';

class HeroSlider extends StatefulWidget {
  final List<Movie> items;

  const HeroSlider({
    super.key,
    required this.items,
  });

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.items.length,
          options: CarouselOptions(
            height: 410,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (i, _) => setState(() => current = i),
          ),
          itemBuilder: (context, i, _) {
            final m = widget.items[i];
            return Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  m.backdrop,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const ColoredBox(
                    color: Color(0xFF172B4D),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        AppTheme.bg.withValues(alpha: .7),
                        AppTheme.bg,
                      ],
                      stops: const [.25, .75, 1],
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  right: 22,
                  bottom: 18,
                  child: Column(
                    children: [
                      Text(
                        m.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '⭐ ${m.rating}   ${m.year} • ${m.genre}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppTheme.blue,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(movie: m),
                            ),
                          ),
                          icon: const Icon(Icons.play_arrow),
                          label: const Text(
                            'Tonton',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.items.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 7,
              width: i == current ? 26 : 7,
              decoration: BoxDecoration(
                color: i == current ? AppTheme.blue : Colors.grey.shade700,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
