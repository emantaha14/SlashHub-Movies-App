import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:slashhub_app/core/helpers/network/network_info.dart';
import 'package:slashhub_app/features/get_all_movies/data/data_sources/movies_data_source.dart';
import 'package:slashhub_app/features/get_all_movies/data/repositories/movies_repo_impl.dart';
import 'package:slashhub_app/features/get_all_movies/domain/repositories/movies_repo.dart';
import 'package:slashhub_app/features/get_all_movies/domain/use_cases/movies_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MoviesUseCase(moviesRepo: sl()));
  sl.registerLazySingleton<MoviesRepo>(
      () => MoviesRepoImpl(moviesDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<MoviesDataSource>(() => MoviesDataSourceImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
