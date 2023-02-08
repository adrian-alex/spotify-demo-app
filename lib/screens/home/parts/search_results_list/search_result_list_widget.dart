import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_demo_app/screens/home/bloc/home_page_bloc.dart';
import 'package:spotify_demo_app/screens/home/bloc/parts/home_page_view_state.dart';
import 'package:spotify_demo_app/screens/home/parts/search_result_item/search_result_item_album_widget.dart';
import 'package:spotify_demo_app/screens/home/parts/search_result_item/search_result_item_artist_widget.dart';

///
/// The search results widget.
/// Will display a grid of [Artist] or [Album] based on user selection.
///
class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  final String _chipAlbumLabel = "Albums";
  final String _chipArtistLabel = "Artists";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageBlocState>(
      buildWhen: (previous, current) =>
          current is HomePageBlocStateLoading ||
          current is HomePageBlocStateResultsAvailable ||
          current is HomePageBlocStateDefault,
      builder: (context, state) {
        if (state is HomePageBlocStateLoading) {
          return _loadingWidget();
        } else if (state is HomePageBlocStateResultsAvailable) {
          return _chipsAndResults(context: context, resultsType: state.type);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  /// Will display a filter (chips) and a grid of results (if available).
  Widget _chipsAndResults({
    required BuildContext context,
    required HomePageViewStateResultsType resultsType,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _filterWidget(context: context, resultsType: resultsType),
          Expanded(
            child: _resultsBasedOnType(
              context: context,
              resultsType: resultsType,
            ),
          ),
        ],
      ),
    );
  }

  /// Display
  Widget _resultsBasedOnType({
    required BuildContext context,
    required HomePageViewStateResultsType resultsType,
  }) {
    switch (resultsType) {
      case HomePageViewStateResultsType.albums:
        return _albumResults(context: context);
      case HomePageViewStateResultsType.artists:
        return _artistsResults(context: context);
    }
  }

  /// The grid displaying [Album] results.
  Widget _albumResults({required BuildContext context}) => GridView.builder(
        itemCount: context.read<HomePageBloc>().viewState.albums.length,
        gridDelegate: _gridDelegate,
        itemBuilder: (context, index) {
          return SearchResultItemAlbumWidget(context.read<HomePageBloc>().viewState.albums[index]);
        },
      );

  /// The grid displaying [Album] results.
  Widget _artistsResults({required BuildContext context}) => ListView.builder(
        itemCount: context.read<HomePageBloc>().viewState.artists.length,
        itemBuilder: (context, index) {
          return SearchResultItemArtistWidget(context.read<HomePageBloc>().viewState.artists[index]);
        },
      );

  /// The progress indicator widget, displayed while results are loading
  Widget _loadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );

  /// The chips allowing to filter results
  Widget _filterWidget({required BuildContext context, required HomePageViewStateResultsType resultsType}) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Wrap(
          children: [
            _chip(
              isSelected: resultsType == HomePageViewStateResultsType.albums,
              name: _chipAlbumLabel,
              onTap: () => context.read<HomePageBloc>().add(HomePageBlocEventOnFilter(HomePageViewStateResultsType.albums)),
            ),
            _chip(
              isSelected: resultsType == HomePageViewStateResultsType.artists,
              name: _chipArtistLabel,
              onTap: () => context.read<HomePageBloc>().add(HomePageBlocEventOnFilter(HomePageViewStateResultsType.artists)),
            )
          ],
        ),
      );

  /// The actual chip widget
  Widget _chip({required String name, required isSelected, required VoidCallback onTap}) => InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: isSelected ? null : Border.all(width: 1, color: Colors.white)),
          child: Text(name),
        ),
      );

  final SliverGridDelegate _gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 10,
    childAspectRatio: 0.8,
  );
}
