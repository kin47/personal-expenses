import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class transactionsitem extends StatelessWidget {
  const transactionsitem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 120,
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              shape: BoxShape.rectangle,
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: EdgeInsets.all(10),
          child: FittedBox(
            child: Text(
              '${transaction.amount.round()} VND',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              transaction.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('dd-MM-yyyy').format(transaction.date),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
            ),
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: () => deleteTx(transaction.id)),
      ],
    ));
  }
}
