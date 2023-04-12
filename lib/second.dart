import 'package:flutter/material.dart';
import 'package:tugas_route/main.dart';

class SecondPage extends StatefulWidget {
  var total;
  SecondPage({this.total});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var total;
  var returndata = "empty";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total = widget.total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          // iconSize: 72,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hasilnya adalah $total",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() async {
                //there is await inside, so add async tag

                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return MyHomePage(
                    title: '$total',
                  );
                }));
                setState(() {
                  returndata =
                      result; //update the returndata with the return result,
                  //update UI with setState()
                });
              }),
              child: Text("Selesai"),
            )
          ],
        ),
      ),
    );
  }
}
