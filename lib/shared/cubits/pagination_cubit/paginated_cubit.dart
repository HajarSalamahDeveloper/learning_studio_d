import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/paginated_response.dart';
  
  abstract class PaginatedCubit<T> extends Cubit<PaginatedState<T>> {
  PaginatedCubit() : super(PaginatedInitial<T>());

  /// This method should be overridden by the subclass to
  /// make the actual API call.
  Future<PaginatedResponse<T>> fetchData(int page);

  /// Load the initial page (usually page 1).
  Future<void> loadInitial() async {
    try {
      emit(PaginatedLoading<T>(results: [], currentPage: 1));
      final paginatedResponse = await fetchData(1);
      emit(PaginatedSuccess<T>(
        results: paginatedResponse.results,
        hasReachedMax: paginatedResponse.nextPageUrl == null,
        currentPage: 1,
      ));
    } catch (error) {
      emit(PaginatedError<T>(
        error: error.toString(),
        results: [],
        currentPage: 1,
      ));
    }
  }

  /// Load more data (for pagination).
  Future<void> loadMore() async {
    if (state is PaginatedLoading || state.hasReachedMax) return;

    final currentState = state;
    try {
      emit(PaginatedLoading<T>(results: currentState.results, currentPage: currentState.currentPage));
      final nextPage = currentState.currentPage + 1;
      final paginatedResponse = await fetchData(nextPage);

      final List<T> results = List.of(currentState.results)..addAll(paginatedResponse.results);
      emit(PaginatedSuccess<T>(
        results: results,
        hasReachedMax: paginatedResponse.nextPageUrl == null,
        currentPage: nextPage,
      ));
    } catch (error) {
      emit(PaginatedError<T>(
        error: error.toString(),
        results: currentState.results,
        currentPage: currentState.currentPage,
      ));
    }
  }

  /// Optionally, a method to refresh the list and reset to page 1.
  Future<void> refresh() async {
    await loadInitial();
  }
}

 
sealed class PaginatedState<T> {
  final List<T> results;
  final bool isLoading;
  final bool hasReachedMax;
  final int currentPage;

  PaginatedState({
    required this.results,
    required this.isLoading,
    required this.hasReachedMax,
    required this.currentPage,
  });
}

class PaginatedInitial<T> extends PaginatedState<T> {
  PaginatedInitial() : super(results: [], isLoading: false, hasReachedMax: false, currentPage: 1);
}

class PaginatedLoading<T> extends PaginatedState<T> {
  PaginatedLoading({
    required super.results,
    required super.currentPage,
  }) : super(
          isLoading: true,
          hasReachedMax: false,
        );
}

class PaginatedSuccess<T> extends PaginatedState<T> {
  PaginatedSuccess({
    required super.results,
    required super.hasReachedMax,
    required super.currentPage,
  }) : super(
          isLoading: false,
        );
}

class PaginatedError<T> extends PaginatedState<T> {
  final String error;

  PaginatedError({
    required this.error,
    required super.results,
    required super.currentPage,
  }) : super(
          isLoading: false,
          hasReachedMax: false,
        );
}