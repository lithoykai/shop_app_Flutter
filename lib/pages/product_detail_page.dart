import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/badge.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductDetailPage extends StatelessWidget {
  //
  ProductDetailPage({
    Key? key,
    // required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(title: Text(product.name), actions: [
        Consumer<Cart>(
          builder: (ctx, cart, child) => Badge(
            value: cart.itemsCount.toString(),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              product.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: double.infinity,
            child: Text(
              'R\$ ${product.price}',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            width: double.infinity,
            child: Text(
              'Descrição: ',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            width: double.infinity,
            child: Text(product.description,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black87)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: TextButton(
              onPressed: () {
                cart.addItem(product);
              },
              child: Text('ADICIONAR AO CARRINHO'),
            ),
          ),
        ]),
      ),
    );
  }
}
