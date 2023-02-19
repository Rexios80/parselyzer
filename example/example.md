<!-- embedme ../readme/usage.dart -->
```dart
import 'dart:io';

import 'package:parselyzer/parselyzer.dart';

void main() {
  final result = Process.runSync('dart', ['analyze', '--format=json']);
  final analysis = AnalyzerResult.fromConsole(result.stdout as String);
  final issues = analysis?.diagnostics.length ?? 0;
  print('Found $issues issues');
}

```