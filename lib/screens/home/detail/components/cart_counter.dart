import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';

class CounterAndFavBtn extends StatelessWidget {
  const CounterAndFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CartCounter(),
      Container(
        padding: EdgeInsets.all(4),
        height: 32,
        width: 32,
        decoration:
            BoxDecoration(color: Color(0xffff6464), shape: BoxShape.circle),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      )
    ]);
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int _numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(Icons.remove, () {
          if (_numOfItems > 1) {
            setState(() {
              _numOfItems--;
            });
          }
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if number of items < 10 add 0 to the number eg: 01, 02
            "${_numOfItems.toString().padLeft(2, "0")}",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinedButton(Icons.add, () {
          setState(() {
            _numOfItems += 1;
          });
        }),
      ],
    );
  }

  SizedBox buildOutlinedButton(IconData icon, Function clicked) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)))),
        onPressed: () {
          clicked();
        },
        child: Icon(icon),
      ),
    );
  }
}
