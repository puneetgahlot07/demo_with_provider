import 'package:demo_with_provider/widgets/item_card_ui.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final List listData;
  // final List<Map<String, String>> listData;

  ItemList({required this.listData});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 3
                  : 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: (1 / 1.1),
        ),
        itemBuilder: (
          context,
          index,
        ) {
          return ItemCardUI(data: widget.listData[index]);
        });
  }
}
