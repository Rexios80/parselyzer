import 'dart:io';

import 'package:parselyzer/parselyzer.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

Future<AnalyzerResult?> analyze() async {
  final projectDir = p.join('test_resources', 'test_project');
  final dartFile = File(p.join(projectDir, 'lib', 'test.dart'));
  dartFile.writeAsStringSync(
    File(p.join(projectDir, 'lib', 'test.txt')).readAsStringSync(),
  );
  addTearDown(() {
    if (dartFile.existsSync()) {
      dartFile.deleteSync();
    }
  });

  final result = await Process.run('dart', [
    'analyze',
    '--format=json',
  ], workingDirectory: projectDir);
  return AnalyzerResult.fromConsole(result.stdout as String);
}

void main() {
  test('Parse test', () async {
    final result = await analyze();
    expect(result?.diagnostics.length, 3);
  });
}
