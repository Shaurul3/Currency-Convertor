import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  String? error;
  double? convertedResult;

  bool _isNumeric(String value) {
    if (value.isEmpty) {
      return true;
    }
    final num? numeric = num.tryParse(value);

    return numeric != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Currency Convertor'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.network(
              'https://play-lh.googleusercontent.com/pOiddrf8_IPWiUOyhj1cxbz2CzWejYdFjs8H5qGfIxnQs8YMNqZr4ScRevMhVnjS7Sg=w240-h480',
            ),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
                errorText: error,
              ),
              onChanged: (String value) {
                setState(() {
                  text = value;
                  if (!_isNumeric(value)) {
                    error = 'Please enter a valid number';
                  } else {
                    error = null;
                  }
                });
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    final double? amount = double.tryParse(text);

                    if (amount != null) {
                      convertedResult = amount * 4.97;
                    }
                  });
                },
                child: const Text('Convert!')),
            if (convertedResult != null)
              Text(
                '$convertedResult RON',
                style: const TextStyle(fontSize: 20),
              )
          ],
        ));
  }
}
