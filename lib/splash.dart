import 'dart:async';


import 'package:flutter/material.dart';

import 'welcomepage.dart';

class Splashscreen extends StatefulWidget {
   //final urlImage='https://png.pngtree.com/thumb_back/fw800/background/20190221/ourmid/pngtree-delicious-food-white-board-image_26245.jpg';

 // const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  
void initState() {
    super.initState();
    Timer(Duration(seconds: 9),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          Welcomepage()
                                                         )
                                       )
         );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:NetworkImage("https://png.pngtree.com/thumb_back/fw800/background/20190221/ourmid/pngtree-delicious-food-white-board-image_26245.jpg"),
          //AssetImage("assets/images/bg.jpg"),
           
          fit: BoxFit.cover,
          )
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
           // Container(height: 100,width: 100,
          /* Padding(
       padding: const EdgeInsets.only(top: 26,left: 50,right: 50),
       child:  
       Image.asset('assets/images/logo.jpg'),
       
     ),*/
    //Container(
      //  decoration: BoxDecoration(
       //   image: DecorationImage (//(image: NetworkImage(),
            //child: Image.asset('assets/images/logos.png'),
          
          //AssetImage("assets/images/bg.jpg"),
           
         
        ///  )
      //  ),
    // ),
    
      Padding(
        padding: const EdgeInsets.only(top:10,left: 100 ),
        child: Text("FOODIE",style: TextStyle(fontSize: 48,color: Colors.red[700],fontWeight:FontWeight.bold,
           shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueGrey,
                    offset: Offset(5.0, 5.0),
                    ),
                ]
               )),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom:190,top: 30,left:45),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
         
         /* children:[
              Text("More food, more happiness, less time and less prices.",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight:FontWeight.bold,
              shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.blueGrey,
                    offset: Offset(5.0, 5.0),
                    ),
                ])),*/
             // Padding(
             //   padding: const EdgeInsets.only(top:30),
                children:[Text("Welcome to the best food delivery service in the town.",style: TextStyle(fontSize: 37,color: Colors.orange,fontWeight:FontWeight.bold,shadows: [
                Shadow(
                    blurRadius: 10.0,
                    color: Colors.white,
                    offset: Offset(5.0, 5.0),
                    ),
                ],fontFamily:'Raleway')),
              
          ]
        ),
      ),
      //checking
      
      //ebd
            
          ],
            
        )
      )
        
       /* Padding(
       padding: const EdgeInsets.only(top: 26),
       child: Image.asset('assets/images/logo.jpg'),
     ),
         Center(
          child:  Text("FOODIE",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 10.0,
                color: Colors.grey,
                offset: Offset(5.0, 5.0),
                ),
            ]
           )),
          ),*/
      
       
      
    );
  }
}
