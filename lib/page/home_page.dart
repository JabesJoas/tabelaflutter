import 'package:flutter/material.dart';
import 'package:proj_int/data/allAlunos.dart';
import 'package:proj_int/model/turma.dart';
import 'package:proj_int/widget/scrollable_widget.dart';
import 'package:proj_int/widget/text_dialog_widget.dart';
import '../utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Turma> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allAlunos);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['id', 'Aluno', 'nota1', 'nota2', 'media'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<dynamic> columns) {
    return columns.map((dynamic column) {
      final id = column == columns[3];

      return DataColumn(
        label: Text(column),
        numeric: id,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Turma> users) => users.map((Turma user) {
        var va1 = user.nota1;
        var va2 = user.nota2;
        double media(nota1, nota2) => ((nota1 + nota2) / 2);
        final cells = [
          user.id,
          user.nome,
          user.nota1,
          user.nota2,
          media(va1, va2),
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 2 || index == 3;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 2:
                    editFirstNota(user);
                    break;
                  case 3:
                    editLastNota(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstNota(Turma editUser) async {
    final nota = await showTextDialog(
      context,
      title: 'Change Nota1',
      value: '${editUser.nota1}',
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(nota1: nota) : user;
        }).toList());
  }

  Future editLastNota(Turma editUser) async {
    final nota = await showTextDialog(
      context,
      title: 'Change Nota2',
      value: '${editUser.nota2}',
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(nota2: nota) : user;
        }).toList());
  }
}
