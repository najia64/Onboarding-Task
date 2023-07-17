import 'package:flutter_application_1/repositories/movies_repository.dart';
import 'package:flutter_application_1/views/movies_listing/movie_listing_view.dart';
import 'package:flutter_application_1/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
@StackedApp(
  routes: [
    StackedRoute(page: StartupView, initial: true),
    StackedRoute(page: MoviesListingView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: MovieRepository)
  ]
)

class AppSetup{

}