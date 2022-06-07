import 'package:catapp_pragma/controllers/home_page_controller.dart';
import 'package:catapp_pragma/models/cat_model.dart';
import 'package:catapp_pragma/services/cat_service.dart';
import 'package:flutter/material.dart';

import '../widgets/cat_card_home.dart';
import '../widgets/header_widget.dart';
import '../widgets/loading_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final searchController = TextEditingController();
    bool searching = false;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width,
                    child: Center(
                      child: Text(
                        'Catbreeds',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: TextFormField(
                      autocorrect: false,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      // focusNode: homePageController.searchNode,
                      onChanged: (value) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (_) {
                            if (value.isNotEmpty) {
                              searching = true;
                              print(value);
                              print(searching);
                            } else {
                              searching = false;
                              print('Hola mundo2');
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              searching
                  ? homePageController.setView(searchController.text, context)
                  : FutureBuilder(
                      future: catService.getCats(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Cat>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Expanded(
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
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
