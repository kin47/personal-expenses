import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet!',
                    style: TextStyle(fontFamily: 'OpenSans', fontSize: 20)),
                Container(
                    height: 200,
                    child: Image.asset('images/waiting.png', fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return transactionsitem(
                    transaction: transactions[index], deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
