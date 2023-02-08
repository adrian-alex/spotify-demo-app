part of 'home_page_widget.dart';

/// FIXME Move text to translation file
String _searchFieldHint = "Search for artists or albums";
String _titleLabel = "Search";

final TextEditingController _searchController = TextEditingController();
final FocusNode _searchTextNode = FocusNode();

///
/// The page body widget.
/// Will display a white frame on web to make it look like an app!
/// On mobile it will just render the [_layoutWidget]
///
Widget _bodyWidget(BuildContext context) => isMobile(context)
    ? ColorAnimatedBackground(
        _layoutWidget(context),
      )
    : WhiteCard(
        child: ColorAnimatedBackground(
          _layoutWidget(context),
        ),
      );

/// The actual layout once is loading
Widget _layoutWidget(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titleWidget,
          _inputFieldWidget(
            context: context,
          ),
          const SearchResultsWidget(),
        ],
      ),
    );

/// The page title widget
Widget get _titleWidget => Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 40),
      child: Text(
        _titleLabel,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 38),
        textAlign: TextAlign.start,
      ),
    );

/// The search input field
Widget _inputFieldWidget({required BuildContext context}) => RawKeyboardListener(
      focusNode: _searchTextNode,
      onKey: (key) {
        context.read<HomePageBloc>().add(
              HomePageBlocEventOnKeyPress(
                _searchController.text,
              ),
            );
      },
      child: TextField(
        controller: _searchController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
          ),
          hintText: _searchFieldHint,
        ),
      ),
    );
