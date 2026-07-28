import 'dart:convert';

import 'package:analyzer/error/error.dart';
import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:parselyzer/src/convert.dart';

/// Parsed analysis result
@immutable
class AnalyzerResult {
  /// Analysis version
  final int version;

  /// Diagnostics this analysis found
  final List<AnalyzerDiagnostic> diagnostics;

  /// Constructor
  const AnalyzerResult({required this.version, required this.diagnostics});

  /// Create an [AnalyzerResult] from the console output of running
  /// `dart analyze --format=json`
  static AnalyzerResult? fromConsole(String output) {
    final json = output.split('\n').firstWhereOrNull((e) => e.startsWith('{'));
    if (json == null) return null;
    return AnalyzerResult.fromJson(jsonDecode(json));
  }

  /// From json
  factory AnalyzerResult.fromJson(Map<String, dynamic> json) => AnalyzerResult(
    version: (json['version'] as num).toInt(),
    diagnostics: (json['diagnostics'] as List<dynamic>)
        .map((e) => AnalyzerDiagnostic.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'version': version,
    'diagnostics': diagnostics.map((e) => e.toJson()).toList(),
  };
}

/// Analysis disgnostic
@immutable
class AnalyzerDiagnostic {
  /// Diagnostic code
  final String code;

  /// Diagnostic documentation
  final String? documentation;

  /// Diagnostic location
  final DiagnosticLocation location;

  /// Diagnostic problem message
  final String problemMessage;

  /// Diagnostic severity
  final DiagnosticSeverity severity;

  /// Diagnostic type
  final DiagnosticType type;

  /// Constructor
  const AnalyzerDiagnostic({
    required this.code,
    required this.documentation,
    required this.location,
    required this.problemMessage,
    required this.severity,
    required this.type,
  });

  /// From json
  factory AnalyzerDiagnostic.fromJson(Map<String, dynamic> json) =>
      AnalyzerDiagnostic(
        code: json['code'] as String,
        documentation: json['documentation'] as String?,
        location: DiagnosticLocation.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
        problemMessage: json['problemMessage'] as String,
        severity: const ErrorSeverityConverter().fromJson(
          json['severity'] as String,
        ),
        type: const ErrorTypeConverter().fromJson(json['type'] as String),
      );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'documentation': documentation,
    'location': location.toJson(),
    'problemMessage': problemMessage,
    'severity': const ErrorSeverityConverter().toJson(severity),
    'type': const ErrorTypeConverter().toJson(type),
  };
}

/// The location of a diagnostic
@immutable
class DiagnosticLocation {
  /// File path
  final String file;

  /// Location range
  final DiagnosticLocationRange range;

  /// Constructor
  const DiagnosticLocation({required this.file, required this.range});

  /// From json
  factory DiagnosticLocation.fromJson(Map<String, dynamic> json) =>
      DiagnosticLocation(
        file: json['file'] as String,
        range: DiagnosticLocationRange.fromJson(
          json['range'] as Map<String, dynamic>,
        ),
      );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'file': file,
    'range': range.toJson(),
  };
}

/// The range of the diagnostic location
@immutable
class DiagnosticLocationRange {
  /// Start point
  final DiagnosticLocationRangePoint start;

  /// End point
  final DiagnosticLocationRangePoint end;

  /// Constructor
  const DiagnosticLocationRange({required this.start, required this.end});

  /// From json
  factory DiagnosticLocationRange.fromJson(Map<String, dynamic> json) =>
      DiagnosticLocationRange(
        start: DiagnosticLocationRangePoint.fromJson(
          json['start'] as Map<String, dynamic>,
        ),
        end: DiagnosticLocationRangePoint.fromJson(
          json['end'] as Map<String, dynamic>,
        ),
      );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'start': start.toJson(),
    'end': end.toJson(),
  };
}

/// The point of the diagnostic location range
@immutable
class DiagnosticLocationRangePoint {
  /// Column
  final int column;

  /// Line
  final int line;

  /// Offset
  final int offset;

  /// Constructor
  const DiagnosticLocationRangePoint({
    required this.column,
    required this.line,
    required this.offset,
  });

  /// From json
  factory DiagnosticLocationRangePoint.fromJson(Map<String, dynamic> json) =>
      DiagnosticLocationRangePoint(
        column: (json['column'] as num).toInt(),
        line: (json['line'] as num).toInt(),
        offset: (json['offset'] as num).toInt(),
      );

  /// To json
  Map<String, dynamic> toJson() => <String, dynamic>{
    'column': column,
    'line': line,
    'offset': offset,
  };
}
