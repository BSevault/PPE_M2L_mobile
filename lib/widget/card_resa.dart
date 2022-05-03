import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardResa extends StatelessWidget {
  CardResa({Key? key, this.oneResa, this.userIdResa}) : super(key: key);
  Map? oneResa;
  int? userIdResa;

  @override
  Widget build(BuildContext context) {
    // print(oneResa);
    initializeDateFormatting('fr_FR', null);
    var dateResa =
        DateTime.parse(oneResa?['date_resa']).add(const Duration(days: 1));
    var dateNow = DateTime.now().add(const Duration(days: 1));
    // print(dateNesa);

    Null Function()? onPressFct;
    Color colorCard;
    String textCard =
        'Salle ${oneResa?['nom']} - ${DateFormat.yMd('fr_FR').format(dateResa)}';

    if (DateFormat.yMd('fr_FR').format(dateResa) ==
        (DateFormat.yMd('fr_FR').format(dateNow))) {
      onPressFct = () {
        Navigator.pushNamed(context, '/gestion', arguments: {
          "idResa": oneResa?['id'],
          "userIdResa": userIdResa,
          "checkParticipants": oneResa?['check_participants'],
          "titre": textCard,
        });
      };
      colorCard = const Color.fromARGB(186, 254, 200, 22);
    } else {
      onPressFct = null;
      colorCard = const Color.fromARGB(71, 82, 81, 77);
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
