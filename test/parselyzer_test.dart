import 'dart:io';

import 'package:parselyzer/parselyzer.dart';
import 'package:test/test.dart';

Future<AnalyzerResult> analyze() async {
  final result = await Process.run(
    'dart',
    ['analyze', '--format=json'],
    workingDirectory: 'test_resources/test_project',
  );
  return AnalyzerResult.fromConsole(result.stdout as String)!;
}

void main() {
  test('Parse test', () async {
    final result = await analyze();
    expect(result.diagnostics.length, 3);
  });
}
