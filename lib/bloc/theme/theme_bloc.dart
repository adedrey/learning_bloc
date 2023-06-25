import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>(
      (event, emit) {
        emit(
          state.copyWith(
              appTheme: state.appTheme == AppTheme.light
                  ? AppTheme.dark
                  : AppTheme.light),
        );
      },
      transformer: sequential(),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print('Counter from storage: $json');
    final themeState = ThemeState.fromJson(json);
    print("ThemeState: $themeState");
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print('Counter to storage: $state');
    final themeJson = state.toJson();
    print("ThemeState: $themeJson");
    return themeJson;
  }
}
