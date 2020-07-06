import 'package:flutter/material.dart';

class Cart_Produit extends StatefulWidget {
  @override
  _Cart_ProduitState createState() => _Cart_ProduitState();
}

class _Cart_ProduitState extends State<Cart_Produit> {
  var Produits_dans_le_panier = [
    {
      "name": "Shoes",
      "photo": "images/products/skt1.jpeg",
      "prix": 850,
      "taille": "M",
      "couleur": "Red",
      "quantity": 3,
    },
    {
      "name": "Blazer1",
      "photo": "images/products/blazer1.jpeg",
      "prix": 85,
      "taille": "X",
      "couleur": "blue",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Produits_dans_le_panier.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_name: Produits_dans_le_panier[index]["name"],
            cart_photo: Produits_dans_le_panier[index]["photo"],
            cart_couleur: Produits_dans_le_panier[index]["couleur"],
            cart_price: Produits_dans_le_panier[index]["prix"],
            cart_quantity: Produits_dans_le_panier[index]["quantity"],
            cart_taille: Produits_dans_le_panier[index]["taille"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_name;
  final cart_photo;
  final cart_price;
  final String cart_taille;
  final String cart_couleur;
  final cart_quantity;

  Single_cart_product({
    this.cart_price,
    this.cart_photo,
    this.cart_taille,
    this.cart_couleur,
    this.cart_quantity,
    this.cart_name,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: new Image.asset(
          cart_photo,
          width: 60.0,
          height: 60.0,
        ),
        title: new Text(cart_name),
        subtitle: new Column(
          children: <Widget>[

            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_taille,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_couleur,
                    style: TextStyle(
                        color: Colors.red),
                  ),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
        trailing: new Column(
          children: <Widget>[
//            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
//            new Text("$cart_quantity"),
//            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
