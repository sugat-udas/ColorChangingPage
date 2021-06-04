import 'package:color_changing_app/chooseColorBody.dart';
import 'package:color_changing_app/colorController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ColorController())
    ],
    child: MyApp()),
    );

}

class MyApp extends StatelessWidget {
  ColorController _colorController;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _colorController=Provider.of<ColorController>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _colorController.chooseColorFlag==true?
          ChooseColorBody()
      :
      MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  ColorController _colorController;
  @override
  Widget build(BuildContext context) {
    _colorController=Provider.of<ColorController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Color',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: _colorController.changedColor,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: _colorController.primaryColor,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  _colorController.changeColorFlag();
                },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,

              ),
                child: Text("Choose Color"),

            )
          ],
        ),
      ),
    );
  }
}


