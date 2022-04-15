import 'requester.dart';

class User {
  final int _id;
  final String _prenom;
  final String _nom;

  User(this._id, this._prenom, this._nom);

  get userId {
    return _id;
  }

  get userPrenom {
    return _prenom;
  }

  get userNom {
    return _nom;
  }

  Future<dynamic> reservationsUser() {
    return Requester.getRequest("/$_id/reservations");
  }
}
