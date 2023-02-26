import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/credits_response.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCarrousel extends StatelessWidget {
  const CastingCarrousel(this.movieId, {super.key});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.getMovieCasting(movieId),
        builder: (BuildContext _, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 300),
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: 200,
              child: const CupertinoActivityIndicator(),
            );
          }

          final List<Cast> castData = snapshot.data!;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) => _CastCard(castData[index])),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard(this.cast);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(cast.getProfilePath),
              placeholder: const AssetImage('assets/no-image.png'),
              height: 140,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
