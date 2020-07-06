import 'package:flutter/material.dart';
import 'package:flutter_app_shop/Componets/ListViews_Horizontals.dart';
import 'package:flutter_app_shop/Componets/cart_produits.dart';
import 'package:flutter_app_shop/Componets/products.dart';
import 'package:flutter_app_shop/pages/cart.dart';
import 'file:///C:/Users/msall/OneDrive/Bureau/flutter_app_shop/lib/views/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('E-commerce'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart_Produit()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //            header
            new UserAccountsDrawerHeader(
                accountName: Text('Amine faye'),
                accountEmail: Text('aminefye@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
                decoration: new BoxDecoration(
                  color: Colors.red,
                )),
//         body
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Accueil'),
                  leading: Icon(Icons.home,color: Colors.red,),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Mon Compte'),
                  leading: Icon(Icons.person,color: Colors.red,),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Mes Commandes'),
                  leading: Icon(Icons.shopping_basket,color: Colors.red,),
                )),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart_Produit()));
                },
                child: ListTile(
                  title: Text('Panier'),
                  leading: Icon(Icons.shopping_cart,color: Colors.red,),
                )),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.favorite,color: Colors.red,),
                )),
            Divider(),
            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(
                    Icons.settings,

                  ),
                )),

            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpView()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

            InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About'),
                  leading: Icon(
                    Icons.help,

                  ),
                )),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          image_carousel,
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Categories',
              ),
            ),
          ),
          //horizontale listview
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: new Text(
                'Produit Recent',
              ),
            ),
          ),
          // grid view
          Flexible(child: Products()),

        ],
      ),
    );
  }
}
