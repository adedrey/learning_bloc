// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;
  ColorState({
    this.color = Colors.red,
  });

  factory ColorState.initial() => ColorState();

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    // TODO: implement toString
    return '(ColorState(color: $color))';
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
