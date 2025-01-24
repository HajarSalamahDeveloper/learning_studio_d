/// Query Parameters Utils
class QPU {
    static String buildQueryParameters(Map<String, String> queryParams) {
    return queryParams.entries.map((entry) {
      final key = Uri.encodeComponent(entry.key);
      final value = Uri.encodeComponent(entry.value);
      return '$key=$value';
    }).join('&');
  }
 static String buildUrlWithParameters(String baseUrl, Map<String, String> queryParams) {
  final queryString = buildQueryParameters(queryParams);
  return queryString.isNotEmpty ? '$baseUrl?$queryString' : baseUrl;
}
}