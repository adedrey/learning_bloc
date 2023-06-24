import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/bloc/theme/theme_state.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.randInt % 2 == 0) {
        emit(
          state.copyWith(appTheme: AppTheme.light),
        );
      } else {
        emit(
          state.copyWith(appTheme: AppTheme.dark),
        );
      }
    });
  }
}
