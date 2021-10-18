
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:foodieapp/cart.dart';
import 'package:foodieapp/categories.dart';
import 'package:foodieapp/detailpage.dart';
import 'package:foodieapp/login.dart';
import 'package:foodieapp/models/categories_model.dart';
import 'package:foodieapp/models/food_categories_model.dart';
import 'package:foodieapp/models/foods_model.dart';
import 'package:foodieapp/provider/my_provider.dart';
import 'package:foodieapp/screen4.dart';
import 'package:foodieapp/searchservice.dart';
import 'package:provider/provider.dart';

import 'bottom.dart';
import 'bottomcontainer.dart';
import 'models/usermodel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key, required this.title}) : super(key: key);
final String title;

 //final  firstname;
 //final lastname;
 //final email;
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  //@override
  var queryResultSet=[];
  var tempSearchStore=[];
  initiateSearch(value){
    if(value.lenght==0){
      setState(() {
         queryResultSet=[];
            tempSearchStore=[];
      });
     
    }
    var capitalizedValue=value.subString(0,1).toUpperCase()+value.subString(1);
    if(queryResultSet.length==0&&value.lenght==1){
     SearchService().searchByName(value).then((QuerySnapshot docs){
       for(int i=0;i<docs.documents.length;++i){
         queryResultSet.add(docs.documents[i].data);
       }
     });
    }
    else{
      tempSearchStore=[];
      queryResultSet.forEach((element) { 
         if(element['name'].startsWith(capitalizedValue)){
           setState(() {
             
             tempSearchStore.add(element);
           });
         }
      });
     
    }
  }
    /*late UserModel userModel; 
   Future getCurrentUserDataFunction()async{
    // FirebaseAuth _auth= FirebaseAuth.instance;
     //FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance.collection('userData').document((await FirebaseAuth.instance.currentUser()).uid).get().then((DocumentSnapshot documentSnapshot){
       if(documentSnapshot.exists){
         userModel=UserModel.fromDocument(documentSnapshot);
       }else{
          print("data not exits");
       }
    });
  }*/

  List<CategoriesModel> burgerList=[];
  List<CategoriesModel> recipeList=[];
  List<CategoriesModel> lasagnaList=[];
  List<CategoriesModel> drinksList=[];
  List<CategoriesModel> pizaList=[];
  List<CategoriesModel> bbqList=[];
  List<FoodModel> singleFoodList=[];
  List<FoodCategoriesModel> burgerCategoriesList=[];
   List<FoodCategoriesModel> pizaCategoriesList=[];
    List<FoodCategoriesModel> lasagnaCategoriesList=[];
     List<FoodCategoriesModel> bbqCategoriesList=[];
      List<FoodCategoriesModel> recipeCategoriesList=[];
       List<FoodCategoriesModel> drinksCategoriesList=[];
  Widget categories({required String image,required String name,required Function() onTap}){
     return Column(
   children: [
     GestureDetector(
       onTap:onTap,
       child: Container(
         margin: EdgeInsets.only(left: 20,top: 10),
         height: 70,
         width: 80,
         
     decoration: BoxDecoration(
       
       image: DecorationImage(image:NetworkImage(image),
       fit:BoxFit.cover),
       color: Colors.grey,
       
       
       borderRadius: BorderRadius.circular(10),
        
     ),
     
       ),
     ),
     SizedBox(height: 10,),
     Text(
       name,
       style: TextStyle(
         fontSize: 18,
         color: Colors.black
       ) ,
     )

   ],
     );
  }
  
  /*Widget bottomcontainer({}){
    return 
  }*/

  ///mmooz//
  Widget burger(){
    return Row(
      children:burgerList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){

           Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: burgerCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
   Widget recipe(){
    return Row(
      children:recipeList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: recipeCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
   Widget lasagna(){
    return Row(
      children:lasagnaList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: lasagnaCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
   Widget drinks(){
    return Row(
      children:drinksList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: drinksCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
   Widget piza(){
    return Row(
      children:pizaList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: pizaCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
   Widget bbq(){
    return Row(
      children:bbqList.map((e) => categories(
        image:e.image,
        name:e.name,
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                 builder:(context)=> Categories(list: bbqCategoriesList)
                 //firstname:user.displayName,lastname: user.displayName,email: user.displayName)
                 ));
        }
      )).toList(),
    );
  }
  Widget build(BuildContext context) {
  // getCurrentUserDataFunction();
    MyProvider provider=Provider.of<MyProvider>(context);
    provider.getBurgerCategory();
   burgerList= provider.throwBurgerList;
   provider.getRecipeCategory();
   recipeList=provider.throwRecipeList;
    provider.getLasagnaCategory();
   lasagnaList=provider.throwLasagnaList;
    provider.getDrinksCategory();
   drinksList=provider.throwDrinksList;
    provider.getPizaCategory();
   pizaList=provider.throwPizaList;
    provider.getBbqCategory();
   bbqList=provider.throwBbqList;
   ////singlefood//////
   provider.getFoodList();
   singleFoodList=provider.throwFoodModelList;
    provider.getBurgerCategoriesList();
   burgerCategoriesList=provider.throwBurgerCategoriesList;
   provider.getRecipeCategoriesList();
   recipeCategoriesList=provider.throwRecipeCategoriesList;
   provider.getPizaCategoriesList();
   pizaCategoriesList=provider.throwPizaCategoriesList;
   provider.getDrinksCategoriesList();
   drinksCategoriesList=provider.throwDrinksCategoriesList;
   provider.getLasagnaCategoriesList();
   lasagnaCategoriesList=provider.throwLasagnaCategoriesList;
   provider.getBbqCategoriesList();
   bbqCategoriesList=provider.throwBbqCategoriesList;
    return Scaffold(
       //resizeToAvoidBottomInset: false,
       bottomNavigationBar: BottomNavigation(),
        appBar: AppBar(title: Text("FOODIE",style: TextStyle( shadows: [
        Shadow(
            blurRadius: 10.0,
            color: Colors.black,
            offset: Offset(5.0, 5.0),
            ),
        ],fontSize: 28)), backgroundColor: Colors.red[900],shadowColor: Colors.grey,foregroundColor: Colors.black38),  
      
     
      drawer: Drawer(  
        
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          
          children: <Widget>[  
            UserAccountsDrawerHeader(  
                decoration:BoxDecoration(
                  color: Colors.red[900],
                  
                ) ,
              accountName: Text('hu'),
              accountEmail: Text('hy'),
               
              currentAccountPicture: CircleAvatar(  
                backgroundColor: Colors.red[50],  
                child: Text(  
                  "A",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.account_circle),title: Text("Profile"),  
              onTap: () {  
               // Navigator.pop(context);  
               // Screen4();
               Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>Screen4()));
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.shopping_cart), title: Text("Cart"),  
              onTap: () {  
               Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>CartPage()));
              },  
            ), 
             ListTile(  
              leading: Icon(Icons.wallet_giftcard),title: Text("Orders"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.info),title: Text("About"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.lock), title: Text("Change Password"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ), 
            ListTile(  
              leading: Icon(Icons.logout), title: Text("Logout"),  
              onTap: () {  
              //  Navigator.pop(context);  ]
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    ),
                  );
              },  
            ),    
          ],  
        ),
        
      ),
       //check
       body: ListView(
         
         children: [
           
           Padding(
             padding: const EdgeInsets.all(8.0),
             
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
            
                    onChanged: (value) {
                   //   filterSearchResults(value);
                    //  initiateSearch(value);
                   //   tempSearchStore.map((element) {
                     //   return BottomContainer(image:element.image, price: element.price, name: element.name, onTap: () { Navigator.of(context).pushReplacement(
          // MaterialPageRoute(
          //   builder:(context)=>DetailPage(image: element.image, name: element.name, price: element.price,))); },);}).toList();
                      
                      },
                  //  controller: editingController,
                    decoration: InputDecoration(
                        labelText: "Search",
                        
                        focusColor: Colors.black,
                        hintText: "Search",
                        hoverColor: Colors.black,
                        
                        prefixIcon: Icon(Icons.search,color: Colors.black,),
                        border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))
                            
                            
                            ),
                            
                  ),
          )),
         // GridView.count(crossAxisCount: 2,

   //   children:

      //  tempSearchStore.map((element) {
         //               return BottomContainer(image:element.image, price: element.price, name: element.name, onTap: () { Navigator.of(context).pushReplacement(
         // MaterialPageRoute(
          //   builder:(context)=>DetailPage(image: element.image, name: element.name, price: element.price,))); },);}).toList(),

      


         // ),
        
      
         
         
////sec///
//ListView(
 // children:  [ 
    CarouselSlider(
                items: [
                    
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxRQ2XXZcBd4ZNIBD-39c6BhHvF4-mW8MzMw&usqp=CAU"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
  
                    
                  //2nd Image of Slider
                    Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image:NetworkImage("https://criticalpedagogyelectrified.files.wordpress.com/2018/12/Try-the-Chinese-Food.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    
                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIWsTDPk77MFvaxxehqOcDm8MtgO8oDoXIPw&usqp=CAU"),
                        fit: BoxFit.cover,
                      ),
                       ),
                  ),
                   //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgfHHMErWk1mW4_rr-kbkLjDMEriYB4antnw&usqp=CAU"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ],
  //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
  
  
  
  ////end///
           
           
  
          
  
         ),
   


SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child:   Row(
   
     children: [
       burger(

       ),
       recipe(),
       lasagna(),
       drinks(),
       piza(),
       bbq(),
      /* categories(
         image:'assets/images/wa1.jpg',
          name:"All",
         ),
          categories(
         image:'assets/images/wa2.jpg',
          name:"Burgers",
         ),
         categories(
         image:'assets/images/wa3.jpg',
          name:"Chineese",
         ),
         categories(
         image:'assets/images/wa4.jpg',
          name:"Sirarcha",
         ),
         categories(
         image: "assets/images/wa5.jpg",
          name:"BBQ",
         ),
          categories(
         image:'assets/images/wa5.jpg',
          name:"Cheesy",
         ),*/
     ],
     ),
),
Padding(
  padding: const EdgeInsets.only(top: 16,bottom: 16,
  
  ),
  child:   Container(
    
    height: 30,
    width: 200,
     decoration: BoxDecoration(
       color: Colors.red[900],
    boxShadow: [
            //background color of box
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                6.0, // Move to right 10  horizontally
                6.0, // Move to bottom 10 Vertically
              ),
            )
          ],
     ),
    child: Center(
      child: Text("Let's Beat Your Hunger",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight:FontWeight.bold,
       shadows: [
            Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0),
                ),
            ]
      
      ),),
    ),
  ),
),
    //thrd decor//
Container(
  height: 790,
  margin: EdgeInsets.symmetric(horizontal: 10),
  child: GridView.count(
    shrinkWrap: false,
    primary: false,
    crossAxisCount: 2,
  childAspectRatio: 0.65,
  crossAxisSpacing: 20,
  mainAxisSpacing: 20,
  
  children:singleFoodList.map((e) => BottomContainer(image:e.image, price: e.price, name: e.name, onTap: () { Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>DetailPage(image: e.image, name: e.name, price: e.price,))); },),).toList()

  /*children: [
     bottomcontainer(image:'assets/images/wa1.jpg', price: 600, name: "Burgers"),
      bottomcontainer(image:'assets/images/wa2.jpg', price: 600, name: "Flimsy"),
       bottomcontainer(image:'assets/images/wa3.jpg', price: 600, name: "Chineese"),
bottomcontainer(image:'assets/images/wa4.jpg', price: 600, name: "Sirarcha"),
 bottomcontainer(image:'assets/images/wa5.jpg', price: 600, name: "BBQ"),
  bottomcontainer(image:'assets/images/wa6.jpg', price: 600, name: "Cheesy"),
  ],*/
  
  ),
)  

    

//yahnse//
  ]

    
       
      ),
     // bottomNavigationBar: BottomNavigation(),
    //  body: BottomNavigation(),
               );
         
         
      
  
   // );
  }
}