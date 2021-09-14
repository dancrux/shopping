import 'package:flutter/material.dart';

import 'package:shopping/constants.dart';
import 'package:shopping/models/product.dart';
import 'package:shopping/screens/home/components/categories.dart';
import 'package:shopping/screens/home/components/item_card.dart';
import 'package:shopping/screens/home/detail/components/detail_screen.dart';

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
            itemBuilder: (context, index) => ItemCard(
                product: products[index],
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(product: products[index])));
                }
                /*  =>
                  // SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Navigator.of(context)
                      .push(DetailScreen(product: products[index])), */
                // })
                ),
          ),
        ))
      ],
    );
  }
}
