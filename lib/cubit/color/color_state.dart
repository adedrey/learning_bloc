// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  ColorState({
    this.color = Colors.red,
  });

  @override
  List<Object> get props => [color];

  factory ColorState.initial() => ColorState();

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'ColoState(color: $color)';
}
