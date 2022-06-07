import 'package:flutter/material.dart';
import 'package:catapp_pragma/services/cat_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/cat_model.dart';
import '../widgets/cat_card_home.dart';

class _HomePageController {
  setView(String value, BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: FutureBuilder(
        future: catService.searchCat(query: value),
        builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => CatCardHome(
                        size: size,
                        catInfo: snapshot.data![index],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

_HomePageController homePageController = _HomePageController();
