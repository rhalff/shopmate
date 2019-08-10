part of catalog.pages;

class ProductReviewFormData {
  String name;
  String review;
  int rating;
}

class ProductReviewForm extends StatefulWidget {
  final int productId;
  ProductReviewForm({
    @required this.productId,
  }) : assert(productId != null);
  @override
  _ProductReviewFormState createState() => _ProductReviewFormState();
}

class _ProductReviewFormState extends State<ProductReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nickNameFocus = new FocusNode();
  final FocusNode _reviewFocus = new FocusNode();

  ProductReviewFormData _formData = ProductReviewFormData();

  ReviewsBloc _reviewsBloc;
  CustomerBloc _customerBloc;

  @override
  void initState() {
    _reviewsBloc = BlocProvider.of<ReviewsBloc>(context);
    _customerBloc = BlocProvider.of<CustomerBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _customerBloc,
      builder: (BuildContext context, CustomerState state) {
        if (state is CustomerLoaded) {
          return _buildReviewForm(customer: state.customer);
        }

        return _pleaseLogin();
      },
    );
  }

  Widget _pleaseLogin() {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        child: NavLink(
          LinkItem(
            title: 'Please login first',
            route: SignInScreen.route,
            replace: true,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewForm({
    Customer customer,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Add a review',
            style: theme.textTheme.display2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(widget.productId.toString()),
                ProductReviewFormField(
                    enabled: false,
                    label: 'Name',
                    value: customer.name,
                    validator: _validateNickname,
                    maxLength: 48,
                    focusNode: _nickNameFocus,
                    inputFormatters: [
                      BlacklistingTextInputFormatter(RegExp('\s\s+')),
                    ],
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _nickNameFocus, _reviewFocus);
                    },
                    onSaved: (String value) {
                      _formData.name = value;
                    }),
                ProductReviewFormField(
                    label: 'Your review',
                    validator: _validateReview,
                    maxLength: 255,
                    maxLines: 5,
                    focusNode: _reviewFocus,
                    onSaved: (String value) {
                      _formData.review = value;
                    }),
                ProductReviewFormField(
                  label: 'Overall rating',
                  child: Ratings(
                    rating: _formData.rating?.toDouble() ?? 0,
                    onTap: _setRating,
                  ),
                ),
                ProductReviewFormField(
                  label: '',
                  child: RoundedButton(
                    text: 'Submit',
                    onPressed: _submitReview,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _setRating(int rating) {
    setState(() {
      _formData.rating = rating;
    });
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  String _validateNickname(String value) {
    if (value.isEmpty) {
      return 'Nickname cannot be empty';
    }

    return null;
  }

  String _validateReview(String value) {
    if (value.isEmpty) {
      return 'Review cannot be empty';
    }

    return null;
  }

  void _submitReview() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      _reviewsBloc.dispatch(
        AddReview(
          productId: widget.productId,
          name: _formData.name,
          review: _formData.review,
          rating: _formData.rating,
        ),
      );
    }
  }
}
