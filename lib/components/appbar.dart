import 'package:flutter/material.dart';
const kPrimaryColor = Color.fromARGB(255,203,227,100);

@override
AppBar MyAppBar(context,
    {bool isPrincipal = true,
    String secondaryTitle = "",
    bool isNotOrderResume = true}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    leading: (!isPrincipal) ? _leadingBack(context) : null,
    actions: [
      (isNotOrderResume)
          ? Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.shopping_bag),
                color: Colors.white,
              );
            })
          : SizedBox(
              height: 1,
            )
      // Builder(builder: builder)
      // _shoppingBag(context)
    ],
  );
}

@override
IconButton _shoppingBag(BuildContext context) {
  return IconButton(
    onPressed: () => Scaffold.of(context).openEndDrawer(),
    icon: const Icon(Icons.shopping_bag),
  );
  ;
}

@override
IconButton _leadingBack(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () =>
          Navigator.of(context).pushNamed("/", arguments: {"unitProduct"}));
}
