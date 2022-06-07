import 'package:flutter/material.dart';

import '../controllers/home_page_controller.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    bool searching = false;

    return Column(
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
                    print('Hola mundo');
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
    );
  }
}
