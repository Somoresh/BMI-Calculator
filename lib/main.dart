import 'package:bmi_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Color(0xffE1D7C6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Meter'),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/j.png')),
                  //const Text(
                  // 'BMI',
                  // style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
                  //),
                  SizedBox(
                    height: 35,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight (In kgs)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)),
                      // prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height (In feet)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)),
                      // prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height (In Inch)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)),
                      //prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();

                        if (wt != "" && ft != "" && inch != "") {
                          //bmi calcu;lation

                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iWt / (tM * tM);

                          var msg;

                          if (bmi > 25) {
                            msg = "You are Overweight";
                            bgColor = Colors.red.shade400;
                          } else if (bmi < 18) {
                            msg = 'You are Underweight';
                            bgColor = Colors.yellow.shade400;
                          } else {
                            msg = 'You are Healty';
                            bgColor = Colors.green.shade300;
                          }

                          setState(() {
                            result =
                                "$msg\nYour BMI is : ${bmi.toStringAsFixed(3)}";
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required blanks!!';
                          });
                        }
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 17),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
