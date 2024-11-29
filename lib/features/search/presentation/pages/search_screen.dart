import 'package:slashhub_app/core/common_widgets/loading_widget.dart';
import 'package:slashhub_app/core/imports/search_imports.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultSizedBox.vertical(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: SearchBarWidget(
                  labelText: AppStrings.searchTitle,
                  controller: searchController,
                  onChanged: (String value) {
                    context
                        .read<SearchCubit>()
                        .searchForMovie(searchedMovie: value);
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.7, // Adjust height for content
                child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoadingState) {
                      return const LoadingWidget();
                    } else if (state is SearchErrorState) {
                      return CustomErrorWidget(
                        errorMessage: state.failure.error,
                        onPressed: () {
                          context.read<SearchCubit>().searchForMovie(
                              searchedMovie: searchController.text);
                        },
                      );
                    } else if (state is SearchSuccessState) {
                      if (state.searchedMovies.isEmpty) {
                        return Center(
                          child: Text(
                            AppStrings.noMoviesFound,
                            style:
                                TextStyle(color: ColorManager.cardBackGround),
                          ),
                        );
                      }
                      return SearchSuccessWidget(
                        searchedMovies: state.searchedMovies,
                      );
                    }
                    return const StartSearchWidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
