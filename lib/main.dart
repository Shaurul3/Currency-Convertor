import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    final numeric = num.tryParse(value);

    return numeric != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Currency Convertor'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Image.network('https://play-lh.googleusercontent.com/pOiddrf8_IPWiUOyhj1cxbz2CzWejYdFjs8H5qGfIxnQs8YMNqZr4ScRevMhVnjS7Sg=w240-h480',),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter the amount in EUR',
                errorText: error,
              ),
            onChanged: (String value){
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
            onPressed: (){
              setState(() {
                // Parse the text to an integer
                double? amount = double.tryParse(text);

                // Check if the parsing was successful
                if (amount != null) {
                  // Multiply the parsed amount by 4.97
                  convertedResult = amount * 4.97;

                }
              });
            },
            child: const Text('Convert!')
          ),
          if (convertedResult != null) // Show result only if it's available
            Text(
              '$convertedResult RON',
              style: TextStyle(fontSize: 20),
            )
        ],
      )
    );
  }
}
