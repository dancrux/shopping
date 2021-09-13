import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/screens/home/components/categories.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.71,
                mainAxisSpacing: MediaQuery.of(context).size.width * 0.03,
                /* kDefaultPaddin */
                crossAxisSpacing: MediaQuery.of(context).size.height *
                    0.03 /* kDefaultPaddin) */),
            itemBuilder: (context, index) => ItemCard(),
          ),
        ))
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function? press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(kDefaultPaddin),
          // height: 160.0 /* MediaQuery.of(context).size.height * 0.2 */,
          // width: 140.0 /*  MediaQuery.of(context).size.width * 0.32 */,
          decoration: BoxDecoration(
              color: products[0].color,
              borderRadius: BorderRadius.circular(16.0)),
          child: Image.asset(
            products[0].image,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            products[0].title,
            style: TextStyle(
              color: kTextLightColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            "\$234",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
