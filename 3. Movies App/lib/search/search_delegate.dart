import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar una película";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  Widget _noMoviesContainer(context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.chevron_left),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return _noMoviesContainer(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This run each time the user input in the search textfield

    if (query.isEmpty) {
      return const Center(
        child: Icon(Icons.movie, size: 200),
      );
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getResultsByQuery(query);

    return StreamBuilder(
      stream: moviesProvider.resultsStream,
      builder: (BuildContext _, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _noMoviesContainer(context);

        final List<Movie> moviesData = snapshot.data!;

        return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: moviesData.length,
            itemBuilder: (BuildContext _, index) {
              final Movie movie = moviesData[index];
              return _MovieItem(movie);
            });
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    movie.heroId = '${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: FadeInImage(
            fit: BoxFit.contain,
            placeholder: const AssetImage('assets/no-image.png'),
            image: NetworkImage(movie.getPosterPath),
          ),
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle,
          style: const TextStyle(
            fontSize: 10,
          )),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}
