import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

// @RestApi(baseUrl: 'localhost:5000')
@RestApi(baseUrl: 'https://7d5a264e-ffd0-48e9-899c-bb804ef9b142.mock.pstmn.io')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        contentType: 'application/json',
        headers: {'Authorization': 'Bearer sdfxxvvdsAdfsAASvbgfbdnmpuw'});
    return _ApiService(dio, baseUrl: baseUrl);
  }

  ///Ex
  ///In here you can define end points
  ///after define end points and response  and entity , can generated other auto generated files from this command
  ///flutter pub run build_runner build
  ///flutter pub run build_runner build --delete-conflicting-outputs     //:::::::this will use only after first time build runner run
  // @GET('/version/check')
  // Future<VersionResponse> getAppVersion();
  //
  // @POST('/code')
  // Future<CodeResponse> sendOTPCode(@Body() Map<String, dynamic> body);

}
