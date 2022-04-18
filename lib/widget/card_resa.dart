import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardResa extends StatelessWidget {
  CardResa({Key? key, this.oneResa}) : super(key: key);
  Map? oneResa;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR', null);
    var dateResa =
        DateTime.parse(oneResa?['date_resa']).add(const Duration(days: 1));
    var dateNow = DateTime.now().add(const Duration(days: 1));

    ButtonStyle styleBtn;
    Null Function()? onPressFct;
    Color colorCard;
    String textCard =
        'Salle ${oneResa?['nom']} - ${DateFormat.yMd('fr_FR').format(dateResa)}';

    if (DateFormat.yMd('fr_FR').format(dateResa) ==
        (DateFormat.yMd('fr_FR').format(dateNow))) {
      styleBtn = TextButton.styleFrom(
          maximumSize: const Size(double.infinity, 60),
          backgroundColor: const Color.fromARGB(186, 254, 200, 22),
          primary: const Color(0xFF068D9D),
          textStyle: const TextStyle(fontSize: 20));

      onPressFct = () {
        Navigator.pushNamed(context, '/gestion', arguments: {
          "idResa": oneResa?['id'],
          "titre": textCard,
        });
      };
      colorCard = const Color.fromARGB(186, 254, 200, 22);
    } else {
      styleBtn = TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
      onPressFct = null;
      colorCard = const Color.fromARGB(185, 150, 141, 111);
    }

    return Card(
      margin: const EdgeInsets.all(10),
      shadowColor: Colors.black,
      color: colorCard,
      elevation: 8,
      child: TextButton(
        onPressed: onPressFct,
        style: styleBtn,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textCard),
          ],
        ),
      ),
    );
  }
}
