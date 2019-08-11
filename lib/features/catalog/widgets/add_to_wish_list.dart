part of catalog.widgets;

class AddToWishList extends StatefulWidget {
  final int productId;
  AddToWishList({
    @required this.productId,
  }) : assert(productId != null);
  @override
  _AddToWishListState createState() => _AddToWishListState();
}

class _AddToWishListState extends State<AddToWishList> {
  FavoritesBloc _favoritesBloc;
  @override
  void initState() {
    super.initState();

    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder(
        bloc: _favoritesBloc,
        builder: (BuildContext context, FavoritesState state) {
          if (state is FavoritesLoaded) {
            VoidCallback onPressed;
            final isFavorite = state.isFavorite(widget.productId);

            if (isFavorite) {
              onPressed = () => _favoritesBloc
                  .dispatch(RemoveFromFavorites(widget.productId));
            } else {
              onPressed = () =>
                  _favoritesBloc.dispatch(AddToFavorites(widget.productId));
            }

            return Row(
              children: <Widget>[
                IconButton(
                  onPressed: onPressed,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'Add to Wish List',
                  style: theme.textTheme.body2,
                ),
              ],
            );
          }

          return const LinearProgressIndicator();
        });
  }
}
