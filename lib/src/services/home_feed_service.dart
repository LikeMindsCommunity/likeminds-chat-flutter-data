abstract class IHomeFeedService {
  /// Get Home Feed API
  /// Calls our backend for getting the home feed
  /// Returns a [dynamic] object
  /// Throws [DioError] if something goes wrong
  Future<dynamic> getHomeFeed();
}

class HomeFeedService extends IHomeFeedService {
  @override
  Future<dynamic> getHomeFeed() async {}
}
