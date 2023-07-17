import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/movie_data.dart';
import '../../../repositories/movies_repository.dart';


class MovieListingViewModel extends BaseViewModel {
  
  final _repository = locator<MovieRepository>();

  //final MovieRepository _repository;
  //MovieListingViewModel() : _repository= MovieRepository();
  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  String _errorMsg = '';
  String get errorMsg => _errorMsg;

  Future<void> fetchMovies() async {
    setBusy(true);
    try {
      _movies = await _repository.getMovies();
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
    setBusy(false);
  }
  
  
}