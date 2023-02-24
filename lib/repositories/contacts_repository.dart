import '../utils/interfaces/ilocal_db.dart';

class ContactsRepository {
  final ILocalDB localDB;

  ContactsRepository({required this.localDB});

  Future saveNewContact() async {}

  Future editContact() async {}

  Future deleteContact() async {}
}
