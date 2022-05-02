import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardPartiCovid extends StatelessWidget {
  CardPartiCovid(
      {Key? key,
      required this.allParticipations,
      required this.itemChange,
      this.colorCard})
      : super(key: key);
  List allParticipations;
  Function itemChange;
  Color? colorCard;

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // this.allParticipations.forEach((element) {
    //   var dateResa =
    //       DateTime.parse(element['date_resa']).add(const Duration(days: 1));
    //   element['date_format'] = DateFormat.yMd('fr_FR').format(dateResa);
    // });

    return ListView.builder(
      // controller: controller,
      // scrollDirection: Axis.vertical,
      // shrinkWrap: true,
      // padding: const EdgeInsets.all(10),
      itemCount: allParticipations.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: colorCard,
          child: CheckboxListTile(
            title: Text(
              '${allParticipations[index].nom_salle} - ${allParticipations[index].date_resa}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${allParticipations[index].email}',
              style: const TextStyle(
                color: Color.fromARGB(255, 21, 121, 133),
              ),
            ),
            secondary: const Icon(
              Icons.medical_services,
              color: Color.fromARGB(255, 21, 121, 133),
              size: 40,
            ),
            value: allParticipations[index].isCheck,
            onChanged: (bool? val) {
              itemChange(val, index);
            },
          ),
        );
      },
    );
  }
}
