class PaginatedResponse<T> {
  /// A list of results of generic type [T].
  final List<T> results;

  /// The current page number of the paginated response.
  final int currentPage;

  /// The last page number of the paginated response.
  final int lastPage;

  /// The URL for the next page of results, if available.
  final String? nextPageUrl;

  /// Constructor for creating an instance of [PaginatedResponse].
  ///
  /// Requires [results], [currentPage], and [lastPage] to be non-null, while
  /// [nextPageUrl] is optional (nullable).
  PaginatedResponse({
    required this.results,
    required this.currentPage,
    required this.lastPage,
    this.nextPageUrl,
  });

  /// Factory method to create a [PaginatedResponse] from a JSON object.
  ///
  /// The [json] map is the raw JSON data returned from an API, and [fromJsonT]
  /// is a function that converts a map into an instance of type [T].
  ///
  /// Example:
  /// ```dart
  /// PaginatedResponse<MyModel>.fromJson(json, (item) => MyModel.fromJson(item));
  /// ```
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> item) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      results: (json['result'] as List)
          .map((item) => fromJsonT(item)) // Convert each item to type [T]
          .toList(),
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      nextPageUrl: json['next_page_url'],
    );
  }
}
