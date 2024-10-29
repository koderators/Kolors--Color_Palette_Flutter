import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color _selectedColor = Colors.blue;
  double _radius = 10.0;


  Future <void> chooseColor() async{
    Color? color = await showColorPickerDialog(
        context,
        _selectedColor,
        title: Text('Select Color'),
      showColorCode: true,
      showColorName: true,
      showRecentColors: true,
      pickersEnabled: <ColorPickerType , bool> {
          ColorPickerType.wheel:true,
        ColorPickerType.customSecondary:true,
        ColorPickerType.bw:true

      },
      subheading: Text('Color`s shades')

    );

    if (color != null) {
      setState(() {
        _selectedColor = color;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: _selectedColor,
        title: Text('Kolors', style: TextStyle(color: Colors.white),),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20),
            child: Text('Set radius', style: TextStyle(fontSize: 18,color: Colors.black),),
          ),

          Slider(
              value: _radius,
              max: 24,
              thumbColor: _selectedColor,
              activeColor: _selectedColor,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              }
          ),

          ColorPicker(
          showColorCode: true,
          showColorName: true,
          showRecentColors: true,
          showMaterialName: true,
          enableOpacity: true,
          opacityTrackHeight: 10,
          opacityTrackWidth: 350,
          opacityThumbRadius: 20,
          color: _selectedColor,
          borderRadius: _radius,
          colorNameTextStyle: TextStyle(fontWeight: FontWeight.bold),
          pickersEnabled: <ColorPickerType , bool> {
            ColorPickerType.wheel:true,

          },
          subheading: Text('Color`s shade'),

              onColorChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
              }
          )

        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: _selectedColor,
        child: Icon(Icons.color_lens_outlined, color: Colors.white,),
          onPressed: () {
          chooseColor();
          }
      ),
    );
  }
}
