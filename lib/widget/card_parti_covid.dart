import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardPartiCovid extends StatelessWidget {
  CardPartiCovid({Key? key, this.oneResa, this.userIdResa}) : super(key: key);
  Map? oneResa;
  int? userIdResa;

  @override
  Widget build(BuildContext context) {
    // print(oneResa);
    initializeDateFormatting('fr_FR', null);
    var dateResa =
        DateTime.parse(oneResa?['date_resa']).add(const Duration(days: 1));

    Null Function()? onPressFct;
    Color colorCard = Color.fromARGB(185, 224, 94, 84);
    String textCard =
        'Salle ${oneResa?['nom_salle']} - ${DateFormat.yMd('fr_FR').format(dateResa)} - Admin email: ${oneResa?['email']}';

    if (oneResa?['is_covid'] == 0) {
      colorCard = Color.fromARGB(186, 254, 200, 22);
      onPressFct = () {
        Navigator.pushNamed(context, '/covid', arguments: {
          "oneResa": oneResa,
        });
      };
    }

    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: colorCard,
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 3),
              blurRadius: 6,
              spreadRadius: 2,
              color: Color.fromARGB(55, 54, 52, 52),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: GestureDetector(
          onTap: onPressFct,
          child: Text(
            textCard,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 21, 121, 133),
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
