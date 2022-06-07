import 'package:catapp_pragma/models/cat_model.dart';
import 'package:catapp_pragma/pages/home_page.dart';
import 'package:catapp_pragma/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget homeBuilder(BuildContext context, GoRouterState state) {
  return HomePage();
}

Widget itemBuilder(BuildContext context, GoRouterState state) {
  return ItemPage(
    catInfo: state.extra! as Cat,
  );
}

Widget notFoundPage(BuildContext context, GoRouterState state) {
  return Container();
}
