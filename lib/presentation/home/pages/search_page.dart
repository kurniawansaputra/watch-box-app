import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies_section.dart';
import 'package:movie_app/presentation/home/widgets/result_movies_section.dart';

import '../bloc/get_now_playing_movies/get_now_playing_movies_bloc.dart';
import '../bloc/search_movie/search_movie_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();

    final nowPlayingMoviesBloc = context.read<GetNowPlayingMoviesBloc>();

    nowPlayingMoviesBloc
        .add(const GetNowPlayingMoviesEvent.getNowPlayingMovies());
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _isSearching = true;
      });
      context.read<SearchMovieBloc>().add(
            SearchMovieEvent.search(query),
          );
    } else {
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
                bottom: 16.0,
              ),
              child: TextField(
                controller: _searchController,
                onSubmitted: (_) => _onSearch(),
                onChanged: (text) {
                  if (text.isEmpty) {
                    setState(() {
                      _isSearching = false;
                    });
                  }
                },
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                decoration: const InputDecoration(
                  hintText: 'Search movies',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: _isSearching
                  ? const ResultMoviesSection()
                  : const NowPlayingMoviesSection(),
            ),
          ],
        ),
      ),
    );
  }
}
