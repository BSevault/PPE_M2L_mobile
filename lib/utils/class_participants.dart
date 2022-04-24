import 'package:mobile/utils/requester.dart';

class Participants {
  final int userId;
  final String nom;
  final String prenom;
  final String email;
  bool isCheck;

  Participants(this.userId, this.nom, this.prenom, this.email, this.isCheck);

  static Future<List<Participants>> getParticipants(int? idResa) async {
    List<Participants> _listParticipants = [];
    var _all = await Requester.getRequest('/flutter/$idResa/participants');
    _all[0].forEach((participant) {
      bool isPresent;

      participant['is_present'] == 1 ? isPresent = true : isPresent = false;

      _listParticipants.add(
        Participants(participant['id'], participant['nom'],
            participant['prenom'], participant['email'], isPresent),
      );
    });

    return _listParticipants;
  }

  static void checkParticipants(
      List allParticipants, int? idResa, int? userIdResa) async {
    allParticipants.forEach((participant) async {
      await Requester.putRequest('/flutter/$idResa/participants',
          {"id_user": participant.userId, "is_present": participant.isCheck});
    });
    await Requester.putRequest(
      '/flutter/$userIdResa/reservations',
      {"id_resa": '$idResa'},
    );
  }
}
