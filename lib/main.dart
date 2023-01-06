import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyhomePage(

      ),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {


  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Skate',
        value: 310.76,
        date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais',),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Container(
            child: Card(
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                 child: Row(
                   children: <Widget>[
                     Container(
                       margin: EdgeInsets.symmetric(
                         horizontal: 15,
                             vertical: 10,
                       ),
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.purple,
                           width: 2,
                         ),
                       ),
                       padding: EdgeInsets.all(10),
                       child: Text(
                         'R\$ ${tr.value.toStringAsFixed(2)}',
                             style: TextStyle(
                             fontWeight: FontWeight.bold,
                               fontSize: 20,
                               color: Colors.purple,
                        ),
                       ),
                     ),
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(
                               tr.title,
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 16,
                               ),
                           ),
                               Text(
                                   DateFormat('d MMM y').format(tr.date),
                                   style: TextStyle(
                                     color: Colors.grey,
                                   ),
                                ),
                             ],
                     ),
                   ],
                 ),
              );
            }).toList()
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  TextButton(
                    child: Text('Nova Transação'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
