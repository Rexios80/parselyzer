import 'dart:io';

import 'package:parselyzer/parselyzer.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

Future<AnalyzerResult?> analyze() async {
  final projectDir = p.join('test_resources', 'test_project');
  final source = File(p.join(projectDir, 'lib', 'test.txt'));
  final dartFile = File(p.join(projectDir, 'lib', 'test.dart'));

  dartFile.writeAsStringSync(source.readAsStringSync());
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
    if (result == null) {
      fail('Expected analysis result');
    }

    expect(result.diagnostics, isNotEmpty);

    final first = result.diagnostics.first;
    expect(first.code, isNotEmpty);
    expect(first.problemMessage, isNotEmpty);
    expect(first.location.file, endsWith('test.dart'));

    final decoded = AnalyzerResult.fromJson(result.toJson());
    expect(decoded.version, result.version);
    expect(decoded.diagnostics.length, result.diagnostics.length);
    expect(decoded.diagnostics.first.code, first.code);
    expect(decoded.diagnostics.first.severity, first.severity);
    expect(decoded.diagnostics.first.type, first.type);
  });
}
