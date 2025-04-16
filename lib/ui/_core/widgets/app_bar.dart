import 'package:flutter/material.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({required BuildContext context, String? title}) {
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  return AppBar(
    title: Text(title ?? ''),
    centerTitle: true,
    elevation: 0.1,
    actionsPadding: EdgeInsets.all(10),
    toolbarHeight: 60,
    actions: [
      badges.Badge(
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 10),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutScreen()),
            );
          },
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
