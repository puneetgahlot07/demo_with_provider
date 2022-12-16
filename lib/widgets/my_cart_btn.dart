import 'package:badges/badges.dart';
import 'package:demo_with_provider/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/item_provider.dart';

class MyCartBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context);
    return Badge(
      position: BadgePosition.topEnd(top: 3, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeColor: Colors.red,
      toAnimate: true,
      showBadge: provider.countListLen > 0 ? true : false,
      badgeContent: provider.countListLen == 0
          ? Container()
          : Text(
              '${provider.countListLen}',
              style: TextStyle(color: Colors.white),
            ),
      child: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, CartPage.routeName, (route) => false);
            // Navigator.pushReplacement(context, CartPage.routeName);
          },
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          )),
    );
  }
}
    // return ChangeNotifierProvider(
    //   create: (context) => ItemProvider(),
    //   child: Consumer<ItemProvider>(
    //     builder:(context, value, child) {
    //       if (ItemProvider().countListLen == 0) {
    //   return IconButton(
    //       onPressed: () {
    //         Navigator.pushNamedAndRemoveUntil(
    //             context, CartPage.routeName, (route) => true);
    //         // Navigator.pushReplacement(context, CartPage.routeName);
    //       },
    //       icon: Icon(
    //         Icons.shopping_cart,
    //         color: Colors.white,
    //       ));
    // } else
    //   return Badge(
    //     position: BadgePosition.topEnd(top: 3, end: 3),
    //     animationDuration: Duration(milliseconds: 300),
    //     animationType: BadgeAnimationType.slide,
    //     badgeColor: Colors.red,
    //     toAnimate: true,
    //     badgeContent: Consumer<ItemProvider>(
    //       builder: (context, value, child) {
    //         return Text(
    //           value.countListLen.toString(),
    //           style: TextStyle(
    //               fontSize: 10,
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold),
    //         );
    //       },
    //     ),
    //     child: IconButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, CartPage.routeName, (route) => true);
    //           // Navigator.pushReplacement(context, CartPage.routeName);
    //         },
    //         icon: Icon(
    //           Icons.shopping_cart,
    //           color: Colors.white,
    //         )),
    //   );
    //     }, ),
    // );
    // if (ItemProvider().countListLen == 0) {
    //   return IconButton(
    //       onPressed: () {
    //         Navigator.pushNamedAndRemoveUntil(
    //             context, CartPage.routeName, (route) => true);
    //         // Navigator.pushReplacement(context, CartPage.routeName);
    //       },
    //       icon: Icon(
    //         Icons.shopping_cart,
    //         color: Colors.white,
    //       ));
    // } else
    //   return Badge(
    //     position: BadgePosition.topEnd(top: 3, end: 3),
    //     animationDuration: Duration(milliseconds: 300),
    //     animationType: BadgeAnimationType.slide,
    //     badgeColor: Colors.red,
    //     toAnimate: true,
    //     badgeContent: Consumer<ItemProvider>(
    //       builder: (context, value, child) {
    //         return Text(
    //           value.countListLen.toString(),
    //           style: TextStyle(
    //               fontSize: 10,
    //               color: Colors.white,
    //               fontWeight: FontWeight.bold),
    //         );
    //       },
    //     ),
    //     child: IconButton(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(
    //               context, CartPage.routeName, (route) => true);
    //           // Navigator.pushReplacement(context, CartPage.routeName);
    //         },
    //         icon: Icon(
    //           Icons.shopping_cart,
    //           color: Colors.white,
    //         )),
    //   );
 
