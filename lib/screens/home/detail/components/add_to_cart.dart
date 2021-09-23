import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: product.color)),
            child: IconButton(
                onPressed: () {},
                color: product.color,
                icon: Icon(Icons.shopping_cart_outlined)),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.resolveWith((states) =>
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => product.color)),
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
          ),
        ],
      ),
    );
  }
}
