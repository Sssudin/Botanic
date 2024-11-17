import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/earlyplants.dart';

class CartPage extends StatefulWidget {
  final List<EarlyPlant> addedToCartPlants;
  final Function(List<EarlyPlant>) updateCart;

  const CartPage({Key? key, required this.addedToCartPlants, required this.updateCart}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: BackButton(
          color: Constants.blackColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: widget.addedToCartPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/add-cart.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.addedToCartPlants.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        final earlyPlant = widget.addedToCartPlants[index];
                        return ListTile(
                          title: Text(earlyPlant.plantName),
                          subtitle: Text(earlyPlant.decription),
                          trailing: Text('\$${earlyPlant.price.toStringAsFixed(2)}'),
                        );
                      },
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Totals',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            '\$${calculateTotal(widget.addedToCartPlants).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  double calculateTotal(List<EarlyPlant> addedToCartPlants) {
    double total = 0;
    for (var plant in addedToCartPlants) {
      total += plant.price;
    }
    return total;
  }
}
