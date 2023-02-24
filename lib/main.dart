import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_contacts/features/sign_in/screens/sign_in_screen.dart';
import 'package:my_contacts/utils/hive_client.dart';
import 'package:my_contacts/utils/http_client.dart';
import 'package:my_contacts/utils/interfaces/ilocal_db.dart';

import 'utils/interfaces/ihttp_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final client = DioHttpClient(client: Dio());
    final localDb = HiveDb();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IHttpClient>.value(value: client),
        RepositoryProvider<ILocalDB>.value(value: localDb),
        // RepositoryProvider<PokemonDataRepository>(
        //   create: (context) =>
        //       PokemonDataRepository(client: RepositoryProvider.of(context)),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 2,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
