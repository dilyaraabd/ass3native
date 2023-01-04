import 'package:flutter/material.dart';

void main() {
  runApp(const TipCalculator());
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) :super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}
class _TipCalculatorState extends State<TipCalculator>{
  final TextEditingController _amountController=TextEditingController();
 final TextEditingController _tipController=TextEditingController();

 double result = 0;
 double total = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.purpleAccent,
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: const Text('Tip Calculator'),
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
            children: [
              TextField(
                controller: _amountController,
                textAlign:TextAlign.center,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
              hintText: 'Enter Price of goods',
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _tipController,
                textAlign:TextAlign.center,
                keyboardType: TextInputType.number,
                decoration:  const InputDecoration(
                    hintText: 'Enter Tip percentage',
                    border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 30)
                ),
                  onPressed: (){
                  double amount = double.parse(_amountController.text);
                  double tip = double.parse(_tipController.text);
                  setState(() {
                    result=amount*(tip/100);
                    total=result + amount;
                  });
                  }, child: const Text('Calculate')),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const Text('Tip Amount',style: TextStyle(fontSize: 40)),
                  const SizedBox(width: 20,),
                  Text(result.toString(),style:const TextStyle(fontSize: 40), )
                ],
              ),
      const SizedBox(height: 15,),
      Row(
        children: [
          const Text('Total Amount',style: TextStyle(fontSize: 40)),
          const SizedBox(width: 20,),
          Text(total.toString(),style:const TextStyle(fontSize: 40), )
            ],
          ),
            ]
        )
        ),
    ),
    );
  }
}