

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/movie_data.dart';
import 'package:stacked/stacked.dart';

import 'movies_listing_viewmodel.dart';

class MoviesListingView extends StackedView<MovieListingViewModel>{

  const MoviesListingView({super.key});


  @override
  Widget builder(
    BuildContext context, 
    MovieListingViewModel viewModel,
    Widget? child
  ) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('app bar'),
        title: const Text("Movies"),
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(MovieListingViewModel viewModel){
    if (viewModel.isBusy){
      return const Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError){
      return Center(child: Text(viewModel.errorMsg));
    } else{
      return Scaffold(
        body: ListView.builder(
          itemCount: viewModel.movies.length,
          itemBuilder: (context, index) => _buildListViewItem(
            context,
            viewModel,
            viewModel.movies[index],
          ),
        )
      );
    }
  }
  
  Widget _buildListViewItem(
    BuildContext context,
    MovieListingViewModel viewModel,
    MovieModel model,
  ){
    var imagePathPrefix = "https://image.tmdb.org/t/p/w500/";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(
                        imagePathPrefix + model.posterPath,
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: Offset(1.0, 3.0),
                      ),
                    ],
                  ),
                ),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.overview,
            ),
          ),
          Divider(color: Colors.grey.shade500),
        ],
      ),
    );
  }

  @override
  MovieListingViewModel viewModelBuilder(BuildContext context) {
    
    return MovieListingViewModel()..fetchMovies();
  }
  

}