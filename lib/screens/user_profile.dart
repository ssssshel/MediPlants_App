// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mediplants_app/models/user.dart';
import 'package:mediplants_app/services/auth.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

const double defaultPadding = 30.0;
const kPrimaryColor = Color.fromARGB(255,203,227,100);
const kPrimaryLightColor = Color.fromARGB(90,228,236,171);
const kTextColor = Color(0xFF202E2E);
const kTextLigntColor = Color(0xFF7286A5);
    
class _UserProfileState extends State<UserProfile> {
  AuthService authService = AuthService.instance();
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/pic.png",
            name: "Jhon Doe",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: 20), //20
          ProfileMenuItem(
            iconSrc: "assets/back_arrow.png",
            title: "Saved Recipes",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/back_arrow.png",
            title: "Super Plan",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/back_arrow.png",
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/back_arrow.png",
            title: "Help",
            press: () {},
          ),
        ],
      ),
    ),  
    );
  }
}

void _showOrderDetails(BuildContext context) {
  Navigator.of(context).pushNamed("/orderdetails");
}

class Info extends StatelessWidget {
  const Info({
    Key? key,
    required this.name,
    required this.email,
    required this.image,
  }) : super(key: key);
  final String name, email, image;

  @override
  Widget build(BuildContext context) {
    double defaultSize = 10;
    return SizedBox(
      height: 240, // 240
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 15, //150
              color: kPrimaryColor,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container( //10
                  height: defaultSize * 14, //140
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * 0.7, //8
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
                  Positioned(
                  right: -16,
                  bottom: 0,
                  child: SizedBox(
                    height: 52,
                    width: 52,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        primary: Colors.white,
                        backgroundColor: Color(0xFFF5F6F9),
                      ),
                      onPressed: () {},
                      child: Icon(
                      Icons.edit,
                      color: kTextLigntColor,
                    ),
                    ),
                  ),
                ),
                SizedBox(height: defaultSize / 2), //5
                Text(
                  email,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8492A2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String iconSrc, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = 10;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kTextColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: () => {},
        child: Row(
            children: <Widget>[
              Icon(
                Icons.shopping_bag_sharp,
                size: defaultSize * 2,
                color: kTextLigntColor,
              ),
              SizedBox(width: defaultSize * 2),
              Column(
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
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kTextLigntColor,
              )
            ],
          ),
        ),
    );
  }
}