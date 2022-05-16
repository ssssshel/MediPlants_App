import 'package:flutter/material.dart';

@override
AppBar MyAppBar(context,
    {bool isPrincipal = true,
    String secondaryTitle = "",
    isNotOrderResume = true}) {
  return AppBar(
    title: Text((!isPrincipal) ? "MediPlants > $secondaryTitle" : "MediPlants"),
    leading: (!isPrincipal) ? _leadingBack(context) : null,
    actions: [
      Builder(builder: (context) {
        return IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          icon: const Icon(Icons.shopping_bag),
        );
      })
    ],
  );
}

@override
IconButton _leadingBack(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () =>
          Navigator.of(context).pushNamed("/", arguments: {"unitProduct"}));
}
