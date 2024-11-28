import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slashhub_app/features/get_all_movies/data/data_sources/movies_data_source.dart';

import 'core/app/app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  MoviesDataSource moviesDataSource = MoviesDataSourceImpl();
  moviesDataSource.getAllMovies();
  runApp(MyApp());
}
