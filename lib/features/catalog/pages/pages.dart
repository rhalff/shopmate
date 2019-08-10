/// {@category Catalog}
library catalog.pages;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopmate/common/animations/fade_in.dart';
import 'package:shopmate/common/common.dart';
import 'package:shopmate/controls/controls.dart';
import 'package:shopmate/features/catalog/blocs/blocs.dart';
import 'package:shopmate/features/catalog/models/models.dart';
import 'package:shopmate/features/catalog/screens/screens.dart';
import 'package:shopmate/features/catalog/widgets/widgets.dart';
import 'package:shopmate/features/customer/blocs/blocs.dart';
import 'package:shopmate/features/customer/models/models.dart';
import 'package:shopmate/features/customer/screens/screens.dart';
import 'package:shopmate/mixins/device_info.dart';
import 'package:shopmate/themes/light.dart';
import 'package:shopmate/widgets/widgets.dart'
    show CachedImage, LinkItem, NavLink;
import 'package:timeago/timeago.dart' as timeago;

part 'catalog/catalog_overview.dart';
part 'catalog/product_actions.dart';
part 'catalog/product_grid.dart';
part 'catalog/product_list.dart';
part 'catalog/product_row.dart';
part 'product/product_details.dart';
part 'product/product_image_viewer.dart';
part 'product/product_info.dart';
part 'product/review/product_review.dart';
part 'product/review/product_review_form.dart';
part 'product/review/product_review_form_field.dart';
part 'product/review/product_reviews.dart';
