import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final id;
  final double price;
  final int quantity;
  final String title;

  const CartItem({Key key, this.id, this.title, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child:Text('\$ $price'),
          ),),
          title: Text(title),
          subtitle: Text('Total: \$ ${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
