// checkDMTab(CheckDMTabResponse? -> Unit)

// Call home/dm/meta with GET method to check whether to show DM Tab or not

// If home/dm/meta success==false

// return checkDMTabResponse={success=false, errorMessage-=<returned in home/dm/meta>}

// else

// return checkDMTabResponse={success=true,LMResponse<CheckDMTabResponse>}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:likeminds_chat_fl/src/managers/api/api_manager.dart';
import 'package:likeminds_chat_fl/src/models/models.dart';

abstract class IDMService {
  Future<CheckDMTabResponseEntity> checkDMTab();
}

class DMService extends IDMService {
  final ApiManager apiManager;

  DMService({
    required this.apiManager,
  });

  @override
  Future<CheckDMTabResponseEntity> checkDMTab() async {
    try {
      final response = await apiManager.get(
        // home/dm/meta
        apiManager.endPoints.checkDMEndpoint,
      );
      CheckDMTabResponseEntity checkDMTabResponse =
          CheckDMTabResponseEntity.fromJson(response.data);
      return checkDMTabResponse;
    } on DioError catch (e) {
      debugPrint(e.message);
      return CheckDMTabResponseEntity(
        success: false,
        errorMessage: e.message,
      );
    }
  }
}
