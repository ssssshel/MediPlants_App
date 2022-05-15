import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrito compras',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black, 
          onPressed: () {  },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.house),
            color: Colors.black, 
            onPressed: () {  },
          ),
          IconButton(
            icon: Icon(Icons.shop_outlined),
            color: Colors.black, 
            onPressed: () {  },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Carrito", 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
             ),
             SizedBox(height: 18.0,),
             cardItem(),
             cardItem(),
             cardItem(),
             SizedBox(height: 21.0),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   "Total", 
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16.0
                   ),
                 ),
                 Text(
                   "S/. 60.00", 
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16.0
                   ),
                 ),
               ],
             ),
             SizedBox(height: 4.0),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   "Costo delivery", 
                   style: TextStyle(
                     fontSize: 14.0
                   ),
                 ),
                 Text(
                   "S/. 10.00", 
                   style: TextStyle(
                     fontSize: 14.0
                   ),
                 ),
               ],
             ),
             Divider(),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(
                   "Sub Total", 
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16.0
                   ),
                 ),
                 Text(
                   "S/. 70.00", 
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16.0
                   ),
                 ),
               ],
             ),
             Spacer(),
             MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text("Finalizar compra", style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 18.0,),
            MaterialButton(
              onPressed: () {},
              color: Colors.cyan,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text("Seguir comprando", style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

class cardItem extends StatelessWidget {
  const cardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.grey[100],
            child: Center(
              child: Container(
                 width: 70.0,
                 height: 70.0,
                 padding: EdgeInsets.all(4.0),
                 decoration: BoxDecoration(
                 color: Colors.grey[100],
                 image: DecorationImage(
                   image: NetworkImage(
                     "https://www.vistafarma.com/blog/wp-content/uploads/2019/03/Propiedades-de-la-u%C3%B1a-de-gato.jpg"
                   )
                 ),
                 borderRadius: BorderRadius.circular(20.0)
               ),
              )
             ),
          ),
           SizedBox(width: 12.0),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Container(
                   width: 100.0,
                   child: Text("Uña de gato",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                   ),
                   )
                 ),
                 SizedBox(height: 4.0),
                 Row(
                   children: [
                     Container(
                       width: 20.0,
                       height: 20.0,
                       decoration: BoxDecoration(
                         color: Colors.grey[300],
                         borderRadius: BorderRadius.circular(4.0)
                       ),
                       child: Icon(
                         Icons.add,
                         color: Colors.white,
                         size: 15.0,
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Text(
                         "1",
                         style: TextStyle(
                           fontSize: 16.0,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                     ),
                     Container(
                       width: 20.0,
                       height: 20.0,
                       decoration: BoxDecoration(
                         color: Colors.blue[300],
                         borderRadius: BorderRadius.circular(4.0)
                       ),
                       child: Icon(
                         Icons.add,
                         color: Colors.white,
                         size: 15.0,
                       ),
                     ),
                     Spacer(),
                     Text(
                         "S/. 20.00",
                         style: TextStyle(
                           fontWeight: FontWeight.bold
                         ),
                       ),
                   ],
                 ),
               ],
             ),
           )
        ],
      ),
    );
  }
}
