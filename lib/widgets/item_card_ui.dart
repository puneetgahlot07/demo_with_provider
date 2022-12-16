import 'package:demo_with_provider/providers/item_provider.dart';
import 'package:demo_with_provider/utils/helper.dart';
import 'package:flutter/material.dart';

class ItemCardUI extends StatefulWidget {
  Map data;
  ItemCardUI({required this.data});

  @override
  State<ItemCardUI> createState() => _ItemCardUIState();
}

class _ItemCardUIState extends State<ItemCardUI> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: UiHelper.getSize(context).width * 2,
            height: UiHelper.getSize(context).height / 6.5,
            child: Image.network(
              widget.data['img'],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.data['name'],
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Rs ${widget.data['rate']}.00 /-",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: GestureDetector(
              onTap: () {
                ItemProvider().AddToCart(widget.data);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(5)),
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
