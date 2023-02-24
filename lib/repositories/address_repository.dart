import 'package:my_contacts/utils/interfaces/ihttp_client.dart';

import '../utils/interfaces/ilocal_db.dart';

class AddressRepository {
  final ILocalDB localDB;
  final IHttpClient client;

  AddressRepository({required this.localDB, required this.client});

  Future searchPossibleAdressses() async {}

  Future getLatitudeAndLongitude() async {}
}
