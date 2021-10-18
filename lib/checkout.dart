import 'package:flutter/material.dart';
import 'package:foodieapp/cart.dart';
import 'package:foodieapp/provider/my_provider.dart';
import 'package:foodieapp/widgets/mybutton.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({ Key? key }) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}


class _CheckoutState extends State<Checkout> {
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
            // margin:EdgeInsets.only(top:15),
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
                     Text('yumm drink flavour',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
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
    double discount = 5;
    int shipping = 10;

    double discountValue = (total * discount) / 100;

    double value = total - discountValue;

    double totalPrice = value += shipping;
    return Scaffold(
             backgroundColor: Colors.white,
      /*bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20,left:20,right: 20),
      //  padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red[900],
          borderRadius: BorderRadius.circular(10),
    
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
    
          children: [
            // Text('\$ $total',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                Text("Pay",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
          ],
        ),
    
    
      ),*/
      appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30,
      
       onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>CartPage()
           ),
         );
        },
        ),

       
         centerTitle: true,
        backgroundColor: Colors.red[900],
        //Theme.of(context).redcolor,
        title: Text("Pay",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
       
     ),
    
     body:  Column(
        children: [
          Expanded(child:
     ListView.builder(
        physics: BouncingScrollPhysics(),
       itemCount: provider.cartList.length,
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
          ),
          //check
          Expanded(
            child: Column(
              
              children: [
                ListTile(
                  leading: Text("Sub Total"),
                  trailing: Text("\$ $total"),
                ),
                ListTile(
                  leading: Text("Discount"),
                  trailing: Text("%5"),
                ),
                ListTile(
                  leading: Text("Shiping"),
                  trailing: Text("\$10"),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  leading: Text("Total"),
                  trailing: Text("\$ $totalPrice"),
                ),
                MyButton(
                        onPressed: () {
                          
                        },
                        text: "Buy",
                      ),
               
               //RaisedButton(onPressed: onPressed)
              /* Container(
                  height:55,
                  width: double.infinity,
                 child: RaisedButton(
               
                       splashColor: Colors.red,
                     elevation: 7,
                       color: Colors.red[900],
                       shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              //side: BorderSide(color: Colors.red,width: 2),
                              
                              ),
                       
                       
                       
                       onPressed: (){},child: Text("Pay",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight:FontWeight.bold,shadows: [
                             Shadow(
                  blurRadius: 13.0,
                  color: Colors.grey,
                  offset: Offset(5.0, 5.0),
                  ),
                   ]),),),
               )*/
                
              ],
            ),
          )
          //end
       
        ]
     )
    );
  }
}