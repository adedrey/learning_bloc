// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

enum AppTheme {
  dark,
  light;

  String toJson() => name;
  static AppTheme fromJson(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final AppTheme appTheme;
  ThemeState({
    this.appTheme = AppTheme.light,
  });

  factory ThemeState.initial() => ThemeState();

  @override
  String toString() {
    // TODO: implement toString
    return 'ThemeState(appTheme: $appTheme)';
  }

  @override
  List<Object> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appTheme': appTheme.toJson(),
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      appTheme: AppTheme.fromJson(json['appTheme']),
    );
  }
}
