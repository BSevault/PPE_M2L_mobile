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
      _listParticipants.add(
        Participants(participant['id'], participant['nom'],
            participant['prenom'], participant['email'], false),
      );
    });

    return _listParticipants;
  }
}
