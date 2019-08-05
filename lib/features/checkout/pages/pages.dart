/// {@category Checkout}
library checkout.pages;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopmate/assets/vector.dart';
import 'package:shopmate/assets/vectors.dart';
import 'package:shopmate/common/common.dart';
import 'package:shopmate/controls/controls.dart';
import 'package:shopmate/features/cart/blocs/blocs.dart';
import 'package:shopmate/features/cart/models/models.dart';
import 'package:shopmate/features/checkout/widgets/widgets.dart';
import 'package:shopmate/utils.dart';
import 'package:shopmate/widgets/widgets.dart';
import 'package:validations/validations.dart';

part 'confirmation/checkout_confirmation_page.dart';
part 'confirmation/delivery_address.dart';
part 'confirmation/delivery_info.dart';
part 'confirmation/delivery_options.dart';
part 'confirmation/order_summary.dart';
part 'delivery/checkout_delivery_form.dart';
part 'delivery/checkout_delivery_page.dart';
part 'delivery/delivery_form_data.dart';
part 'delivery/delivery_options.dart';
part 'finish/checkout_finish_page.dart';
part 'pages.g.dart';
part 'payment/checkout_payment_page.dart';
part 'payment/creditcard_form.dart';
part 'payment/payment_card.dart';
