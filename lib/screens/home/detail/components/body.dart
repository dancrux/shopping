import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';

class DetailBody extends StatelessWidget {
  final Product product;
  const DetailBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Color"),
                              Row(
                                children: [
                                  ColoredDot(
                                    color: Color(0xff354c95),
                                    isSelected: true,
                                  ),
                                  ColoredDot(
                                    color: Color(0xfff8c878),
                                  ),
                                  ColoredDot(
                                    color: Color(0xffa29898),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColoredDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColoredDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: kDefaultPaddin / 4, right: kDefaultPaddin / 2),
      padding: EdgeInsets.all(2.5),
      height: 24.0,
      width: 24.0,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? color : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Price\n"),
                  TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ])),
              ),
              SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                  child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ))
            ],
          ),
        ],
      ),
    );
  }
}
