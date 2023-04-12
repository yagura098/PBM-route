import 'package:flutter/material.dart';
import 'package:tugas_route/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '-',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Penambahan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController firstNumber;
  late TextEditingController secondNumber;

  @override
  void initState() {
    super.initState();
    firstNumber = TextEditingController();
    secondNumber = TextEditingController();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WillPopScope(
          onWillPop: (() {
            Navigator.pop(context, "Backbutton data");
            return new Future(() => false);
          }),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Angka Pertama'),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85.00),
                child: TextField(
                  controller: firstNumber,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Angka Kedua'),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 85.00),
                child: TextField(
                  controller: secondNumber,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                child: Text(
                  'Tambahkan',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                onPressed: () {
                  var sum = int.parse(firstNumber.text) +
                      int.parse(secondNumber.text);
                  print('SUM IS $sum');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(total: sum)));
                },
              )
            ],
          )),
        ));
  }
}

// class buttonTambah extends StatefulWidget {
//   const buttonTambah({super.key});

//   @override
//   State<buttonTambah> createState() => _buttonTambahState();
// }

// class _buttonTambahState extends State<buttonTambah> {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: (() {
//         _backToHomeandReturnData(context);
//       }),
//       child: Text("Selesai"),
//     );
//   }
// }

// Future<void> _backToHomeandReturnData(BuildContext context) async {
//   final result = await Navigator.push(
//       context, MaterialPageRoute(builder: (context) => SecondPage()));

//   if (!mounted) return;
// }
