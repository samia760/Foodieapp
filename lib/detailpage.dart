import 'package:flutter/material.dart';
import 'package:foodieapp/provider/my_provider.dart';
import 'package:foodieapp/screen1.dart';
import 'package:provider/provider.dart';
import 'package:foodieapp/cart.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final int price;
   DetailPage({ required this.name, required this.image, required this.price});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity=0;
  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30, onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Screen1(title: 'FOODIE'),
           ),
         );
        },
        ),
        backgroundColor: Colors.red[900],
   ),
   body: Column(
     children : [
         Expanded(child: Container(
           
          /* child: CircleAvatar(
             backgroundImage: NetworkImage(""),
           ),*/
           decoration: 
         BoxDecoration(
             image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                        )),
         )),
         Expanded(
           flex:2,
           child: Container(
             padding:EdgeInsets.symmetric(horizontal: 20),
             width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,style: TextStyle(fontSize: 40,color: Colors.black),),
                Text("Sirarcha yummy delicious",style: TextStyle(fontSize: 15,color: Colors.black),),
                Row(
                  children: [

                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                             if (quantity > 0)  quantity--;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                        
                            ),
                            child: Icon(Icons.remove,color: Colors.white,),
                        
                          ),
                        ),
                        SizedBox(width:10),
                        Text("$quantity",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight:FontWeight.bold,),),
                        SizedBox(width:10),
                         GestureDetector(
                           onTap: (){
                             setState(() {
                               quantity++;
                             });
                           },
                           child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              
                              borderRadius: BorderRadius.circular(10),
                         
                            ),
                            child: Icon(Icons.add,color: Colors.white),
                            
                                                 ),
                         )
                      ],
                    ),
                    SizedBox(width: 130,),
                   Text("\$ ${widget.price}",style: TextStyle(fontSize: 30,color: Colors.black),),
                  ],
                ),
                Text("Description",style: TextStyle(fontSize: 25,color: Colors.black),),
                Text("The Queen (Pizza Margherita). San Marzano tomato sauce, fresh mozzarella fior di latte, fresh organic basil. Marky (Pepperoni Americana).",style: TextStyle(color: Colors.black),),
                  Container(
                    height:55,
                    width: double.infinity,
                   /* decoration: BoxDecoration(
                       border: Border.all(
                    color: Colors.black,
                    width: 3)
                    ),*/
                    
                    child: RaisedButton(onPressed: (){
                      provider.addToCart(image:widget.image, name:widget.name, price:widget.price,quantity: quantity);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                    
                    //color: Colors.black87,
                    color: Colors.red[900],
                     elevation: 7,
                      
                    shape: RoundedRectangleBorder(
                    //side: BorderSide(color: Colors.red,width: 2),
                      borderRadius:BorderRadius.circular(10),
                       
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart,color: Colors.white,),
                        SizedBox(width: 10,),
                        Text("Add to Cart",style: TextStyle(fontSize: 25,color: Colors.white),),
                      ],
                    ),
                    
                    ),
                  )
              ],
            ),
         ))
     ]
   ),
    );
  }
}