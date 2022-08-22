import 'package:flutter/material.dart';
// import 'package:untitled/widgets/right_bar.dart';
// import 'package:untitled/widgets/left_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double bmiResult=0;
  String textResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("BMI calculator",
            style:TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 190,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(m)",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight(kg)",
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            TextButton(
              child: Text("Calculate",style: TextStyle(color: Colors.black),),
              onPressed: ((){
                double _h=double.parse(_heightController.text);
                double _w=double.parse(_weightController.text);

                setState(() {
                  bmiResult=_w/(_h*_h);
                  if(bmiResult>25)
                    {
                      textResult="You're over-weight";
                    }
                  else if(bmiResult>=18.5 && bmiResult<=25)
                    {
                      textResult="You have normal weight";
                    }
                  else
                  {
                    textResult="You're under-weight";
                  }
                });
              }),
              style:TextButton.styleFrom(backgroundColor: Colors.white)
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(bmiResult.toString(),style: TextStyle(fontSize: 50),),
            ),
            SizedBox(height: 30,),
            Container(
              child: Text(textResult.toString()),
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
