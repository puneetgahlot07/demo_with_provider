import 'package:badges/badges.dart';
import 'package:demo_with_provider/models/local_data.dart';
import 'package:demo_with_provider/providers/item_provider.dart';
import 'package:demo_with_provider/screens/cart_page.dart';
import 'package:demo_with_provider/utils/helper.dart';
import 'package:demo_with_provider/widgets/item_card_ui.dart';
import 'package:demo_with_provider/widgets/item_list_ui.dart';
import 'package:demo_with_provider/widgets/my_cart_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = false;
  // void didChangeDependencies() {
  //   // if(!)
  //   Provider.of<ItemProvider>(context).countListLen;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [MyCartBtn()],
      ),
      body: Container(
        width: UiHelper.getSize(context).width,
        height: UiHelper.getSize(context).height,
        // child: ItemList(listData: allItemData),
        child: GridView.builder(
            itemCount: allItemData.length,
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
              // return ItemCardUI(data: allItemData[index]);
              return Card(
                child: Column(
                  children: [
                    Container(
                      width: UiHelper.getSize(context).width * 2,
                      height: UiHelper.getSize(context).height / 6.5,
                      child: Image.network(
                        allItemData[index]['img'],
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
                            allItemData[index]['name'],
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
                            "Rs ${allItemData[index]['rate']}.00 /-",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<ItemProvider>(context, listen: false)
                              .AddToCart(allItemData[index]);
                          // ItemProvider().AddToCart(allItemData[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
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
            }),
      ),
    );
  }
}
