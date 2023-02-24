abstract class LocalDbException implements Exception {
  const LocalDbException();
}

abstract class ILocalDB {
  // void setOnUserSessionExpired([void Function()? onUserSessionExpired]);

  // FutureOr<void> setAuthenticationToken([String? token]);

  Future<List<dynamic>> getAll(String path);

  void save(
    String path,
    String key, {
    Object? value,
  });

  void delete(String path, String key);

  // HttpClientResponse patch(
  //   String url, {
  //   Object body,
  //   Map<String, dynamic> headers,
  // });

  // HttpClientResponse put(
  //   String url, {
  //   Object body,
  //   Map<String, dynamic> headers,
  // });

  // Future<Uint8List> download(
  //   String url, {
  //   Map<String, dynamic> headers = const {},
  // });
}
