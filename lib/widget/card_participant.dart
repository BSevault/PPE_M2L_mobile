import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardParticipants extends StatelessWidget {
  CardParticipants(
      {Key? key,
      required this.allParticipants,
      required this.itemChange,
      this.colorCard})
      : super(key: key);
  List allParticipants;
  Function itemChange;
  Color? colorCard;

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: allParticipants.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: colorCard,
          child: CheckboxListTile(
            title: Text(
              '${allParticipants[index].prenom} ${allParticipants[index].nom}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              '${allParticipants[index].email}',
              style: const TextStyle(
                color: Color.fromARGB(255, 21, 121, 133),
              ),
            ),
            secondary: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 21, 121, 133),
              size: 40,
            ),
            value: allParticipants[index].isCheck,
            onChanged: (bool? val) {
              itemChange(val, index);
            },
          ),
        );
      },
    );
  }
}
