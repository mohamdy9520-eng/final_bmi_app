
import 'package:flutter/material.dart';

class GenderInfo extends StatelessWidget{
  final String title;
  final int number;
  final void Function()? increaseOnTap;
  final void Function()? decreaseOnTap;
  const GenderInfo({super.key, required this.title, required this.number, this.increaseOnTap, this.decreaseOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 10),
      //Buttom Vertical: 20 ~~Overflowed by 15 pixels
      width:155,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: Color(0xff24263B)),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize:20, color: Colors.white ),),
          Text(number.toString(), style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w700),),
          SizedBox(height:21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.small(
              heroTag: "$title 1"
                ,onPressed:decreaseOnTap,
                backgroundColor: Color(0xff8B8C9E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
                child: Icon(Icons.remove,color: Colors.white,),
              ),


              FloatingActionButton.small(
                heroTag: "$title 2"
              ,onPressed:increaseOnTap,
                backgroundColor: Color(0xff8B8C9E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(100),
                ),
                child: Icon(Icons.add,color: Colors.white,),
              ),


            ],
          )
        ],
      ),
    );
  }
}

