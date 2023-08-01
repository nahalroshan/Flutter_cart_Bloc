import 'package:blocproject/data/cart_items.dart';
import 'package:blocproject/data/cart_items.dart';
import 'package:blocproject/data/cart_items.dart';
import 'package:blocproject/features/cart/bloc/cart_bloc.dart';
import 'package:blocproject/features/cart/ui/cart_tile_widget.dart';
import 'package:blocproject/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Items'),backgroundColor: Colors.teal,),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      ProductDataModel: successState.cartItems[index],
                      cartBloc: cartBloc,
                    );
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
