import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/screens/home/detail/components/body.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: DetailBody(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_outlined),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        SizedBox(
          width: kDefaultPaddin / 2,
        )
      ],
    );
  }
}
