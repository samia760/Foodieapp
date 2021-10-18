import 'package:flutter/material.dart';
import 'package:foodieapp/checkout.dart';
import 'package:foodieapp/detailpage.dart';
import 'package:foodieapp/provider/my_provider.dart';
import 'package:foodieapp/screen1.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
 Widget cartItem({ required String image,
    required String name,
    required int price,
    required Function() onTap,
    required int quantity,}){
    return Column(
     children: [
       Row(
         children: [
           Container(
           //  margin:EdgeInsets.only(top:15),
             height: 170,
             width: 170,
             decoration: BoxDecoration(
              // decoratimage:NetworkImage(image),fit:BoxFit.cover)
             color: Colors.white, 
             image:DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
              boxShadow: [
              //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
             ),
                  
                  ),
               //   SizedBox(width: 4,),
             Expanded(
               child:Stack(
                 alignment: Alignment.topRight,
                 children: [
                    Container(
               height: 169,
               
                // margin:EdgeInsets.only(top:15),
               decoration:BoxDecoration(
                 boxShadow: [
              //background color of box
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Colors.white,
                                
               ),
              
               child: Padding(
                 padding: const EdgeInsets.only(left: 5),
                 child: Column(
                  
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   
                   children: [
                     
                     Text(name,style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),),
                     Text('yumm drink flavour',style: TextStyle(fontSize: 19,color: Colors.black45,fontWeight: FontWeight.bold),),
                     Text( "\$ $price",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      
                      
                     Row(
                       children: [
                        
                          Text("$quantity",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        
                       ],
                     )
                   ],
                 ),
               ),
             ),
              IconButton(icon: Icon(Icons.close,color: Colors.black,size:25),onPressed:onTap,),
                 ],
               )
               )
         ],
       )
     ],
   );
 }

  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    int total=provider.totalprice();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar :
      GestureDetector(
        onTap: (){Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Checkout()));},
        child: Container(
          margin: EdgeInsets.only(bottom: 20,left:20,right: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 65,
          decoration: BoxDecoration(
            color: Colors.red[900],
            borderRadius: BorderRadius.circular(10),
        
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text('\$ $total',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text("Check Out",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
        
        
        ),
      ),
      
      appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=> Screen1(title: 'FOODIE'),  //DetailPage(name: e.name, image:image., price: price),
           ),
         );
        },
        ),
         centerTitle: true,
        backgroundColor: Colors.red[900],
        //Theme.of(context).redcolor,
        title: Text("Your Cart",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
       
   ),
   body: ListView.builder(itemCount: provider.cartList.length,
         itemBuilder: (ctx,index){
           provider.getDeleteIndex(index);
           return cartItem(   
                   name:provider.cartList[index].name,
             image:provider.cartList[index].image,
             price:provider.cartList[index].price,
             quantity:provider.cartList[index].quantity, onTap: () { provider.delete(); },
            );
         },
   ),
    );
  }
}