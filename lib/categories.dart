import 'package:flutter/material.dart';
import 'package:foodieapp/bottomcontainer.dart';
import 'package:foodieapp/detailpage.dart';
import 'package:foodieapp/models/food_categories_model.dart';
import 'package:foodieapp/screen1.dart';

 
class Categories extends StatelessWidget {
  List<FoodCategoriesModel> list=[];

   Categories({required this.list});

 
 // @override
 // _CategoriesState createState() => _CategoriesState();


//class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
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
      body: GridView.count(
      shrinkWrap: false,
      primary: false,
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      
      children:list.map((e) => BottomContainer(image:e.image, price: e.price, name: e.name, onTap: () {  Navigator.of(context).pushReplacement(
           MaterialPageRoute(
             builder:(context)=>DetailPage(image: e.image, name: e.name, price: e.price,) ));},),).toList()
      ),
    );
  }
}