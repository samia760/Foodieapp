import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodieapp/models/cart_model.dart';
import 'package:foodieapp/models/categories_model.dart';
import 'package:foodieapp/models/food_categories_model.dart';
import 'package:foodieapp/models/foods_model.dart';
//import 'package:foodieapp/models/usermodel.dart';

class MyProvider extends ChangeNotifier{
  //userdata//
  
  //nurgr/
List<CategoriesModel> burgerList=[];
late CategoriesModel burgerModel;
Future<void> getBurgerCategory()async{
  List<CategoriesModel> newBurgerList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('Categories').document('8J604WPWoFp93CmHuKpW').collection('burger').getDocuments();
querySnapshot.documents.forEach((element) {
  
burgerModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(burgerModel.name);
newBurgerList.add(burgerModel);
burgerList=newBurgerList;

});
//notifyListeners();
}
get throwBurgerList{
return burgerList;
}
/////second
List<CategoriesModel> recipeList=[];
late CategoriesModel recipeModel;
Future<void> getRecipeCategory()async{
  List<CategoriesModel> newRecipeList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('categories').document('8J604WPWoFp93CmHuKpW').collection('Recipe').getDocuments();
querySnapshot.documents.forEach((element) {
  
recipeModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(recipeModel.name);
newRecipeList.add(recipeModel);
recipeList=newRecipeList;

});
}
get throwRecipeList{
return recipeList;
}
//thrd
List<CategoriesModel> drinksList=[];
late CategoriesModel drinksModel;
Future<void> getDrinksCategory()async{
  List<CategoriesModel> newDrinksList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('categories').document('8J604WPWoFp93CmHuKpW').collection('Drinks').getDocuments();
querySnapshot.documents.forEach((element) {
  
drinksModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(drinksModel.name);
newDrinksList.add(drinksModel);
drinksList=newDrinksList;

});
}
get throwDrinksList{
return drinksList;
}
//fourth
List<CategoriesModel> bbqList=[];
late CategoriesModel bbqModel;
Future<void> getBbqCategory()async{
  List<CategoriesModel> newBbqList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('categories').document('8J604WPWoFp93CmHuKpW').collection('BBQ').getDocuments();
querySnapshot.documents.forEach((element) {
  
bbqModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(bbqModel.name);
newBbqList.add(bbqModel);
bbqList=newBbqList;

});
}
get throwBbqList{
return bbqList;
}
//fifth
List<CategoriesModel> pizaList=[];
late CategoriesModel pizaModel;
Future<void> getPizaCategory()async{
  List<CategoriesModel> newPizaList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('categories').document('8J604WPWoFp93CmHuKpW').collection('Piza').getDocuments();
querySnapshot.documents.forEach((element) {
  
pizaModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(pizaModel.name);
newPizaList.add(pizaModel);
pizaList=newPizaList;

});
}
get throwPizaList{
return pizaList;
}
//sixth
List<CategoriesModel> lasagnaList=[];
late CategoriesModel lasagnaModel;
Future<void> getLasagnaCategory()async{
  List<CategoriesModel> newLasagnaList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('categories').document('8J604WPWoFp93CmHuKpW').collection('lasagna').getDocuments();
querySnapshot.documents.forEach((element) {
  
lasagnaModel=CategoriesModel(image: element.data['image'], name:element.data['name'] );
//print(lasagnaModel.name);
newLasagnaList.add(lasagnaModel);
lasagnaList=newLasagnaList;

});
}
get throwLasagnaList{
return lasagnaList;
}
//////////////single food//////////////////
List<FoodModel> foodModelList=[];
late FoodModel foodModel;
Future<void> getFoodList()async{
  List<FoodModel> newSingleFoodList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('Foods').getDocuments();
querySnapshot.documents.forEach((element) {
  
  foodModel=FoodModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );

newSingleFoodList.add(foodModel);

},);

foodModelList=newSingleFoodList;
notifyListeners();
}
get throwFoodModelList{
return foodModelList;
}
/////burgercategories//////
List<FoodCategoriesModel> burgerCategoriesList=[];
late FoodCategoriesModel burgerCategoriesModel;
Future<void> getBurgerCategoriesList()async{
  List<FoodCategoriesModel> newBurgerCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('burger').getDocuments();
querySnapshot.documents.forEach((element) {
  
burgerCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(burgerCategoriesModel.name);
newBurgerCategoriesList.add(burgerCategoriesModel);
burgerCategoriesList=newBurgerCategoriesList;

});
//notifyListeners();
}
get throwBurgerCategoriesList{
return burgerCategoriesList;
}

//drinkcat///C:\Users\SAR\AppData\Local\Android\Sdk
List<FoodCategoriesModel> drinksCategoriesList=[];
late FoodCategoriesModel drinksCategoriesModel;
Future<void> getDrinksCategoriesList()async{
  List<FoodCategoriesModel> newDrinksCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('drinks').getDocuments();
querySnapshot.documents.forEach((element) {
  
drinksCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(drinksCategoriesModel.name);
newDrinksCategoriesList.add(drinksCategoriesModel);
drinksCategoriesList=newDrinksCategoriesList;

});
//notifyListeners();
}
get throwDrinksCategoriesList{
return drinksCategoriesList;
}
//chineserecipecat//
List<FoodCategoriesModel> recipeCategoriesList=[];
late FoodCategoriesModel recipeCategoriesModel;
Future<void> getRecipeCategoriesList()async{
  List<FoodCategoriesModel> newRecipeCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('Recipe').getDocuments();
querySnapshot.documents.forEach((element) {
  
recipeCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(recipeCategoriesModel.name);
newRecipeCategoriesList.add(recipeCategoriesModel);
recipeCategoriesList=newRecipeCategoriesList;

});
//notifyListeners();
}
get throwRecipeCategoriesList{
return recipeCategoriesList;
}
///pizacat//
List<FoodCategoriesModel> pizaCategoriesList=[];
late FoodCategoriesModel pizaCategoriesModel;
Future<void> getPizaCategoriesList()async{
  List<FoodCategoriesModel> newPizaCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('Piza').getDocuments();
querySnapshot.documents.forEach((element) {
  
pizaCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(pizaCategoriesModel.name);
newPizaCategoriesList.add(pizaCategoriesModel);
pizaCategoriesList=newPizaCategoriesList;

});
//notifyListeners();
}
get throwPizaCategoriesList{
return pizaCategoriesList;
}
//bbqcat//
List<FoodCategoriesModel> bbqCategoriesList=[];
late FoodCategoriesModel bbqCategoriesModel;
Future<void> getBbqCategoriesList()async{
  List<FoodCategoriesModel> newBbqCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('BBQ').getDocuments();
querySnapshot.documents.forEach((element) {
  
bbqCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(bbqCategoriesModel.name);
newBbqCategoriesList.add(bbqCategoriesModel);
bbqCategoriesList=newBbqCategoriesList;

});
//notifyListeners();
}
get throwBbqCategoriesList{
return bbqCategoriesList;
}
//lasagnacat//
List<FoodCategoriesModel> lasagnaCategoriesList=[];
late FoodCategoriesModel lasagnaCategoriesModel;
Future<void> getLasagnaCategoriesList()async{
  List<FoodCategoriesModel> newLasagnaCategoriesList=[];
  QuerySnapshot querySnapshot=await  Firestore.instance.collection('foodcategories').document('6qudp6TifFWeqCaklIJy').collection('lasagna').getDocuments();
querySnapshot.documents.forEach((element) {
  
lasagnaCategoriesModel=FoodCategoriesModel(image: element.data['image'], name:element.data['name'],price:element.data['price'] );
//print(lasagnaCategoriesModel.name);
newLasagnaCategoriesList.add(lasagnaCategoriesModel);
lasagnaCategoriesList=newLasagnaCategoriesList;

});
//notifyListeners();
}
get throwLasagnaCategoriesList{
return lasagnaCategoriesList;
}
///add to cart//
List <CartModel> cartList=[];
List <CartModel> newCartList=[];
late CartModel cartModel;
void addToCart({
  required String name,required String image,required int price,required int quantity}){

  cartModel=CartModel(image: image, name:name, price: price, quantity: quantity);
  newCartList.add(cartModel);
  cartList=newCartList;
}

get throwCartList{
  return cartList;
}
//userdata//

int totalprice(){
  int total=1;
  cartList.forEach((element) {total+=element.price*element.quantity;});
  return total;
}
late int deleteIndex;
 void getDeleteIndex(int index){
     deleteIndex=index;
 }
 void delete(){
   cartList.removeAt(deleteIndex);
   notifyListeners();
 }
}


