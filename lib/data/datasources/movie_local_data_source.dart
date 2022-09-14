import 'package:material_widget/data/models/movie_model.dart';

abstract class MovieLocalDataSource {
  List<MovieModel> getWatchListMovies();
  List<MovieModel> getBannerListMovies();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  @override
  List<MovieModel> getBannerListMovies() {
    final List<MovieModel> result = <MovieModel>[
      MovieModel(
          title: "John Wick 4",
          genre: "Action, Crime",
          image:
              "https://www.nusabali.com/article_images/52678/john-wick-4-bakal-rilis-mei-2021-2019-05-22-141000_0.jpg",
          rating: 5.0),
      MovieModel(
          title: "The Dark Tower",
          genre: "Action",
          image:
              "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/19680b0738e72567bef75752893f5788b888c83301a1616c3c3f23a69af72a5b._RI_V_TTW_.jpg",
          rating: 4.0),
      MovieModel(
          title: "The Dark Knight",
          genre: "Heroes",
          image:
              "https://images.tokopedia.net/img/cache/700/hDjmkQ/2022/2/1/2926c674-92d5-4eaa-b5d2-5644d6521cdc.jpg",
          rating: 5.0),
    ];
    return result;
  }

  @override
  List<MovieModel> getWatchListMovies() {
    final List<MovieModel> result = <MovieModel>[
      MovieModel(
          title: "Mulan Session",
          genre: "History, War",
          image: "https://pics.filmaffinity.com/Mulan-807158695-large.jpg",
          rating: 3.0),
      MovieModel(
          title: "Beauty & The Beast",
          genre: "Sci-Fiction",
          image:
              "https://upload.wikimedia.org/wikipedia/id/2/2a/Beauty_and_The_Beast_Poster.jpg",
          rating: 5.0),
    ];
    return result;
  }
}
