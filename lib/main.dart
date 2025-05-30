import 'package:flutter/material.dart'; // Import flutter material
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:letto/app.dart';

void main() {
  runApp( // Add runApp here
    const ProviderScope(child: App()),
  );
}
