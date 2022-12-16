import 'package:demo_with_provider/models/local_data.dart';
import 'package:demo_with_provider/providers/item_provider.dart';
import 'package:demo_with_provider/screens/homePage.dart';
import 'package:demo_with_provider/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart';
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemProvider>(context);
    return ChangeNotifierProvider<ItemProvider>(
      create: (context) => ItemProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text("Cart"),
        ),
        body: Container(
          width: UiHelper.getSize(context).width,
          height: UiHelper.getSize(context).height,
          child: Consumer<ItemProvider>(
            builder: (context, provider, child) {
              provider.cartItemPro;
              return ListView.builder(
                itemCount: provider.cartItemPro.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading:
                          Image.network(provider.cartItemPro[index]['img']),
                      title: Text(provider.cartItemPro[index]['name']),
                      subtitle:
                          Text("Rs ${provider.cartItemPro[index]['rate']} /-"),
                      trailing: IconButton(
                          onPressed: () {
                            provider.RemoveToCart(provider.cartItemPro[index]);
                            // Provider.of<ItemProvider>(context, listen: false)
                            //     .RemoveToCart(provider.cartItemPro[index]);
                            // provider.RemoveToCart(provider.cartItemPro[index]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
