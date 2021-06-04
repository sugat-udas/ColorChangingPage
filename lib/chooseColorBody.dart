import 'package:color_changing_app/colorPallate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'colorController.dart';

class ChooseColorBody extends StatelessWidget {
  ColorController _colorController;
  @override
  Widget build(BuildContext context) {
    _colorController=Provider.of<ColorController>(context);
    return Scaffold(
       appBar: AppBar(
         leading: GestureDetector(
             child: Icon(Icons.arrow_back_ios,color: Colors.black,),
           onTap: (){
               _colorController.changeColorFlag();
           },
         ),
      centerTitle: true,
      title: Text('Choose Color',style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,

    ),
      body: ColorChangeBody(),
    );
  }
}

class ColorChangeBody extends StatefulWidget {
  @override
  _ColorChangeBodyState createState() => _ColorChangeBodyState();
}

class _ColorChangeBodyState extends State<ColorChangeBody> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 32.0,right: 20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Primary Color",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
            SizedBox(height: 25.0,),
            DropDownColorChanger(),
            SizedBox(height: 25.0,),
            Text("Change Secondary Color",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
            SizedBox(height: 25.0,),
            ColorPallateMaker(),


          ],
        ),
      ),
    );
  }
}

class DropDownColorChanger extends StatefulWidget {
  @override
  _DropDownColorChangerState createState() => _DropDownColorChangerState();
}

class _DropDownColorChangerState extends State<DropDownColorChanger> {
  ColorController _colorController;
  int value=1;
  @override
  Widget build(BuildContext context) {
    _colorController=Provider.of<ColorController>(context);
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          elevation: 2,
          dropdownColor: Colors.white,

          value: value,
          items: [
            DropdownMenuItem(child: Text("Black"),value: 1,
            onTap: (){
                _colorController.changePrimaryColor(Colors.black);
            },),
            DropdownMenuItem(child: Text("Grey"),value: 2,onTap: (){
              _colorController.changePrimaryColor(Colors.black);
            },),
            DropdownMenuItem(child: Text("Yellow"),value: 3,onTap: (){
              _colorController.changePrimaryColor(Colors.yellow);
            },),
            DropdownMenuItem(child: Text("Green"),value: 4, onTap: (){
              _colorController.changePrimaryColor(Colors.green);
            },),
            DropdownMenuItem(child: Text("Orange"),value: 5,onTap: (){
              _colorController.changePrimaryColor(Colors.orange);
            },),
            DropdownMenuItem(child: Text("Red"),value: 6,onTap: (){
              _colorController.changePrimaryColor(Colors.red);
            },),
          ],
          onChanged: (int val){
            setState(() {
              value=val;
            });
          },
          hint: Text("Select Color"),
        ),
      ),
    );
  }
}


