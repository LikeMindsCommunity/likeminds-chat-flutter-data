/// `LMChatCache` is a model class that contains the key and value of the cache.
///  The key is the unique identifier of the cache and the value is the data that is stored in the cache.
// ignore_for_file: lines_longer_than_80_chars

class LMChatCache {
  final String key;
  final dynamic value;

  LMChatCache._({required this.key, required this.value});

}


/// `LMCacheBuilder` is a builder class that helps in building the `LMChatCache` object.
/// The `key` and `value` of the cache can be set using the `key` and `value` methods respectively.
class LMChatCacheBuilder {
  String? _key;
  dynamic _value;

  void key(String key) {
    _key = key;
  }

  void value(dynamic value) {
    _value = value;
  }

  LMChatCache build() {
    return LMChatCache._(key: _key!, value: _value!);
  }
}
