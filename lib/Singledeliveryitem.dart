

import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addresstype;
  SingleDeliveryItem({required this.title,required this.address,required this.addresstype,required this.number});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(10),

                ),
                child:Center(
                  child:  Text(addresstype,style: TextStyle(fontSize:13,color: Colors.white),
                ),
              ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red[900],
          ),
          subtitle: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Text(address),
              SizedBox(
                height: 5,
              ),
              Text(number)
            ],
          
            
          
          ),
        ),
        Divider(
          height: 35,
        )
      ],
    );
  }
 
  }