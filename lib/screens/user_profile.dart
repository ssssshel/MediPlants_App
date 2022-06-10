import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: ListView(children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.grey,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Text(
                "Nombre de usuario",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text("Editar Datos"),
                color: Colors.lightGreen[100],
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Cerrar Sesión"),
                color: Colors.lightGreen,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mis ordenes:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              _orderCard(context),
              _orderCard(context),
              _orderCard(context),
              _orderCard(context),
              _orderCard(context),
              _orderCard(context),
              _orderCard(context),
            ],
          )
        ]),
      ),
    );
  }
}

@override
Card _orderCard(BuildContext context) {
  return Card(
      child: Container(
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    child: Row(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Código de orden: DAV415"),
              Text(
                "Estado: Recibido",
              ),
              Text("Fecha de pedido: 17/02/2022"),
              Text("Cantidad de productos: 2")
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Monto total: S/. 25"),
              MaterialButton(
                onPressed: () => _showOrderDetails(context),
                child: Text("Ver detalles"),
                color: Colors.lightGreen,
                height: 25,
              )
            ],
          ),
        ))
      ],
    ),
  ));
}

void _showOrderDetails(BuildContext context) {
  Navigator.of(context).pushNamed("/orderdetails");
}
