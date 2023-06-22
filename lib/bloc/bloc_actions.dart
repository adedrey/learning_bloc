import 'package:flutter/foundation.dart' show immutable;

enum PersonUrl { person1, persons2 }

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction implements LoadAction {
  final PersonUrl url;
  const LoadPersonsAction({
    required this.url,
  }) : super();
}
