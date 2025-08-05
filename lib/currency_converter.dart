import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    double result = 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 171, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 71, 171, 220),
        title: Text("Currency Converter"),
        elevation: 0,
        centerTitle: true,
        actions: [Icon(Icons.exit_to_app)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //distance between container and content
              // distance between container and other components
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(12.0), 
              child: Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            Container(
              padding:const EdgeInsets.all(8.0),
              margin:const EdgeInsets.all(12.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.attach_money),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 4.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  {
                    result = double.parse(textEditingController.text) * 81;
                  }
                },
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(15),
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  textStyle: WidgetStatePropertyAll(
                    TextStyle(color: Colors.white),
                  ),
                ),

                child: Text('CONVERT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
