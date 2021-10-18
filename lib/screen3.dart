import 'package:flutter/material.dart';
import 'package:foodieapp/cart.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: CartPage(),
    //Container(
     // child: Center(child: Text("Screen 3")),
    /* body: ListView.builder(itemCount: provider.cartList.length,
         itemBuilder: (ctx,index){
           provider.getDeleteIndex(index);
           return cartItem(   
                   name:provider.cartList[index].name,
             image:provider.cartList[index].image,
             price:provider.cartList[index].price,
             quantity:provider.cartList[index].quantity, onTap: () { provider.delete(); },
            );
         },
   ),*/
    );
  }
}
