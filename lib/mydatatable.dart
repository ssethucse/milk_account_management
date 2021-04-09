import 'package:flutter/material.dart';
import 'Milk.dart';

class MyDataTable extends DataTableSource {
  MyDataTable(this.data);

  final List<Milk> data;

  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].name}')),
        DataCell(Text('${data[index].price}')),
        DataCell(
            TextFormField(
                initialValue: '${data[index].count}',
                keyboardType: TextInputType.number,
                onFieldSubmitted: (val) {
                  print('$val');
                }),
            showEditIcon: true,
        onTap: () => {print('sethu')},)
      ],
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
