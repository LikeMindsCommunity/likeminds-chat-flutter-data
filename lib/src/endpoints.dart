import 'package:likeminds_chat_fl/src/environment/env.dart';

/// This file contains all the endpoints used in the package

// ignore_for_file: constant_identifier_names

class EndPoints {
  static EndPoints? _instance;
  static EndPoints instance(bool? isProd) =>
      _instance ??= EndPoints._(isProduction: isProd ?? false);

  final bool isProduction;
  final int pageLimit = 10;

  EndPoints._({required this.isProduction});

  String get CARAVAN_HOST =>
      isProduction ? EnvProd.caravanHost : EnvDev.caravanHost;
  String get KETTLE_HOST =>
      isProduction ? EnvProd.kettleHost : EnvDev.kettleHost;

  String get authEndpoint => "$KETTLE_HOST/sdk/initiate";
  String get authRefreshEndpoint => "$KETTLE_HOST/user/refresh";
  String get authLogoutEndpoint => "$KETTLE_HOST/user/logout";

  String get registerDeviceEndpoint => "$CARAVAN_HOST/push";

  String getBrandingEndPoint(String communityId) {
    return "$CARAVAN_HOST/community/$communityId/branding";
  }
}
