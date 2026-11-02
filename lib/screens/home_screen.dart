import 'package:flutter/material.dart';
import '../data/movies.dart';
import '../models/movie.dart';
import '../theme/app_theme.dart';
import '../widgets/hero_slider.dart';
import '../widgets/movie_row.dart';
import '../widgets/recommendation_swiper.dart';
import '../widgets/movie_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  String filter = 'Semua';

  @override
  Widget build(BuildContext context) {
    final visible = tab == 1
        ? movies.where((m) => m.category == 'Film').toList()
        : tab == 2
            ? movies.where((m) => m.category == 'Serial TV').toList()
            : movies;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'F2LIX',
          style: TextStyle(
            color: Color(0xFF6EA3FF),
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearch(),
            ),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              showDragHandle: true,
              builder: (_) => const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(28),
                  child: Text(
                    'F2LIX • Aplikasi streaming demo',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: tab == 3
          ? const Center(
              child: Text(
                'Daftar favorit',
              ),
            )
          : tab == 4
              ? const Center(child: Text('Menu pengaturan'))
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: HeroSlider(items: movies.take(3).toList()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 30, 18, 6),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            for (final s in ['Semua', 'Film', 'Serial TV'])
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: ChoiceChip(
                                  label: Text(
                                    s,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  selected: filter == s,
                                  onSelected: (_) => setState(() => filter = s),
                                  selectedColor: AppTheme.blue,
                                  visualDensity: VisualDensity.compact,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 255,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          itemCount: movies
                              .where((m) => filter == 'Semua' || m.category == filter)
                              .length,
                          separatorBuilder: (_, __) => const SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (_, i) => MovieCard(
                            movie: movies
                                .where((m) => filter == 'Semua' || m.category == filter)
                                .toList()[i],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: MovieRow(
                        title: 'Film Terbaru',
                        items: visible
                            .where((m) => m.category == 'Film')
                            .toList(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: MovieRow(
                        title: 'Series Terbaru',
                        items: visible
                            .where((m) => m.category == 'Serial TV')
                            .toList(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: MovieRow(
                        title: 'Anime',
                        items: visible
                            .where((m) => m.category == 'Anime')
                            .toList(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: RecommendationSwiper(items: movies),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  ],
                ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) => setState(() => tab = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            label: 'Film',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_outlined),
            label: 'Serial TV',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }
}

class MovieSearch extends SearchDelegate<Movie?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _results();

  @override
  Widget buildSuggestions(BuildContext context) => _results();

  Widget _results() {
    final result = movies
        .where((m) => m.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, i) {
        final m = result[i];
        return ListTile(
          leading: const Icon(Icons.movie),
          title: Text(m.title),
          subtitle: Text(m.genre),
          onTap: () {
            close(context, m);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(movie: m),
              ),
            );
          },
        );
      },
    );
  }
}
