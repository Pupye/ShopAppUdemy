import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final id;
  final productId; 
  final double price;
  final int quantity;
  final String title;

  const CartItem({Key key, this.id, this.title, this.price, this.quantity, this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.only(right: 15),
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text('\$ $price'),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$ ${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
          padding: EdgeInsets.all(8),
        ),
      ),
    );
  }
}
