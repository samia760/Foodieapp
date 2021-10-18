import 'package:flutter/material.dart';
import 'package:foodieapp/Singledeliveryitem.dart';
import 'package:foodieapp/checkout.dart';

class HomeAdress extends StatelessWidget {
  const HomeAdress({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,iconSize: 30,
      
       onPressed: () {
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Checkout()
           ),
         );
        },
        ),

       
         centerTitle: true,
        backgroundColor: Colors.red[900],
        //Theme.of(context).redcolor,
        title: Text("Delivery Details",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
       
     ),
         floatingActionButton: FloatingActionButton(
           backgroundColor: Colors.red[900]
           ,
           child: Icon(Icons.add,color: Colors.white,), 
           onPressed: () {  },
         ),
         bottomNavigationBar: Container(
           height: 48,
           margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
           child: MaterialButton(
             child:Text("Add new Address",style: TextStyle(color: Colors.white),),
             onPressed: (){},
             color: Colors.red[900],
             shape:RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30),
             )
             ),
         ),
         body: ListView(
           children: [
             ListTile(
               title: Text('Deliver To'),
               leading: Icon(Icons.location_on,color: Colors.black,size: 30,),
             ),
             Divider(
               height:1
             ),
             Column(
               children: [
                SingleDeliveryItem(title:"address", address:"area,karachi/pakistan,Mlir,R-286", addresstype:"home", number:"08725538634"),
               ],
              
             )
           ],
         ),
    );
  }
}