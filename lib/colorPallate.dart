import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'colorController.dart';

class ColorPallateMaker extends StatefulWidget {
  @override
  _ColorPallateMakerState createState() => _ColorPallateMakerState();
}

class _ColorPallateMakerState extends State<ColorPallateMaker> {
  ColorController _colorController;
Color currentColor=Colors.lightBlueAccent;

void changeColor(Color color)=> setState(()=>currentColor=color);
  @override
  Widget build(BuildContext context) {
    _colorController=Provider.of<ColorController>(context);
  return Column(
    children: [
      ColorPicker(
          pickerColor: currentColor,
          onColorChanged: changeColor,
        colorPickerWidth: 300.0,
        pickerAreaHeightPercent: 0.7,
        enableAlpha: true,
        displayThumbColor: true,
        showLabel: true,
        paletteType: PaletteType.hsv,
        pickerAreaBorderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(2.0),
          topRight: const Radius.circular(2.0)
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          primary: Colors.black,
          ),
            onPressed:(){

          setState(() {
            _colorController.changedColor=currentColor;
            _colorController.changeColorFlag();
          });
        }, child: Text("Confirm")),
      )
    ],
  ) ;

    }



}




