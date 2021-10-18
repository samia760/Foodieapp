import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final Function() onTap;
  BottomContainer({required this.onTap,required this.name, required this.image, required this.price});

  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  bool isFavourite=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
      height: 100,
      width: 80,
      //margin: EdgeInsets.only(top: 10,left: 5,right:5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
       color:Colors.white,
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
      borderRadius: BorderRadius.circular(20),
      ),
      child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          alignment:Alignment.topRight,
         // radius:64,
          width: 160,
          height: 138,
          decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image:NetworkImage(widget.image),fit:BoxFit.cover),
          ),
         // backgroundImage: AssetImage(image),
         child: IconButton(onPressed: (){setState(() {
           isFavourite=!isFavourite;
           if(isFavourite=true){
             
           }
           else if(isFavourite=false){

           }


         });}, icon: Icon(isFavourite? Icons.favorite:Icons.favorite_border,color:Colors.red),
         highlightColor:Colors.transparent,
         splashColor: Colors.transparent,

         )
        ),
        
        ListTile(
          leading:Text(
            widget.name,
            style: TextStyle(fontSize: 18,color: Colors.black),
        ),
        trailing: Text("\$${widget.price}",style: TextStyle(fontSize: 18,color: Colors.black),
        ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(right:23,),
      
          child: Row(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.star,size:20,color:Colors.yellow,),
             Icon(Icons.star,size:20,color:Colors.yellow,),
              Icon(Icons.star,size:20,color:Colors.yellow,),
               Icon(Icons.star,size:20,color:Colors.yellow,),
                Icon(Icons.star,size:20,color:Colors.yellow,),
                 
            ],
          ),
        )
        
      ],
      )
      
      ),
    );
  }
}