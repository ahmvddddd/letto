import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:letto/app.dart' show App;

void main() {
  const ProviderScope(child: App());
}
