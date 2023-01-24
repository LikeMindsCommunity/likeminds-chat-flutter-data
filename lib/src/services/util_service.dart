import 'package:dio/dio.dart';
import 'package:likeminds_groupchat/src/endpoints.dart';
import 'package:likeminds_groupchat/src/models/branding/branding_request_model.dart';
import 'package:likeminds_groupchat/src/models/branding/branding_response_model.dart';
import 'package:likeminds_groupchat/src/models/utils/register_device_request_model.dart';
import 'package:likeminds_groupchat/src/models/utils/register_device_response_model.dart';

class UtilService {
  late final Dio _dio;

  UtilService() {
    _dio = Dio();
  }

  Future<RegisterDeviceResponse> registerDevice(
      RegisterDeviceRequest registerDeviceRequest) async {
    final response = await _dio.post(
      REGISTER_DEVICE_ENDPOINT,
      data: registerDeviceRequest.toJson(),
    );
    if (response.data['success'] == false) {
      throw Exception(response.data['error_message']);
    }
    return RegisterDeviceResponse.fromJson(response.data);
  }

  Future<BrandingResponse> getBranding(BrandingRequest brandingRequest) async {
    final response = await _dio.post(
      BRANDING_ENDPOINT,
      options: Options(
        headers: {
          'Authorization': brandingRequest.accessToken,
        },
      ),
    );
    return BrandingResponse.fromJson(response.data);
  }
}
