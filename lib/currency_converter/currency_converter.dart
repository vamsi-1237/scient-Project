import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController textEditingController = TextEditingController();
  double result = 0;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      final input = textEditingController.text;
      setState(() {
        if (input.isEmpty || double.tryParse(input) == null) {
          result = 0;
        } else {
          result = double.parse(input) * 81;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(12.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.attach_money),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 4.0,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                {
                  textEditingController.clear();
                }
              },
              style: ButtonStyle(
                elevation: WidgetStatePropertyAll(15),
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                minimumSize: WidgetStatePropertyAll(Size(250, 50)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                textStyle: const WidgetStatePropertyAll(
                  TextStyle(color: Colors.white),
                ),
              ),

              child: Text('CLEAR'),
            ),
          ],
        ),
      ),
    );
  }
}
