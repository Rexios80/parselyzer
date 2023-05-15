import 'dart:convert';

import 'package:analyzer/error/error.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:parselyzer/src/convert.dart';

part 'analyzer_result.g.dart';

/// Parsed analysis result
@JsonSerializable()
class AnalyzerResult {
  /// Analysis version
  final int version;

  /// Diagnostics this analysis found
  final List<AnalyzerDiagnostic> diagnostics;

  /// Constructor
  AnalyzerResult({
    required this.version,
    required this.diagnostics,
  });

  /// Create an [AnalyzerResult] from the console output of running
  /// `dart analyze --format=json`
  static AnalyzerResult? fromConsole(String output) {
    final json = output.split('\n').firstWhereOrNull((e) => e.startsWith('{'));
    if (json == null) return null;
    return AnalyzerResult.fromJson(jsonDecode(json));
  }

  /// From json
  factory AnalyzerResult.fromJson(Map<String, dynamic> json) =>
      _$AnalyzerResultFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AnalyzerResultToJson(this);
}

/// Analysis disgnostic
@JsonSerializable()
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
  @ErrorSeverityConverter()
  final ErrorSeverity severity;

  /// Diagnostic type
  @ErrorTypeConverter()
  final ErrorType type;

  /// Constructor
  AnalyzerDiagnostic({
    required this.code,
    required this.documentation,
    required this.location,
    required this.problemMessage,
    required this.severity,
    required this.type,
  });

  /// From json
  factory AnalyzerDiagnostic.fromJson(Map<String, dynamic> json) =>
      _$AnalyzerDiagnosticFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$AnalyzerDiagnosticToJson(this);
}

/// The location of a diagnostic
@JsonSerializable()
class DiagnosticLocation {
  /// File path
  final String file;

  /// Location range
  final DiagnosticLocationRange range;

  /// Constructor
  DiagnosticLocation({
    required this.file,
    required this.range,
  });

  /// From json
  factory DiagnosticLocation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$DiagnosticLocationToJson(this);
}

/// The range of the diagnostic location
@JsonSerializable()
class DiagnosticLocationRange {
  /// Start point
  final DiagnosticLocationRangePoint start;

  /// End point
  final DiagnosticLocationRangePoint end;

  /// Constructor
  DiagnosticLocationRange({
    required this.start,
    required this.end,
  });

  /// From json
  factory DiagnosticLocationRange.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationRangeFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$DiagnosticLocationRangeToJson(this);
}

/// The point of the diagnostic location range
@JsonSerializable()
class DiagnosticLocationRangePoint {
  /// Column
  final int column;

  /// Line
  final int line;

  /// Offset
  final int offset;

  /// Constructor
  DiagnosticLocationRangePoint({
    required this.column,
    required this.line,
    required this.offset,
  });

  /// From json
  factory DiagnosticLocationRangePoint.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationRangePointFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$DiagnosticLocationRangePointToJson(this);
}
