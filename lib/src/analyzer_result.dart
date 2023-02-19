import 'package:analyzer/error/error.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:parselyzer/src/convert.dart';

part 'analyzer_result.g.dart';

@JsonSerializable()
class AnalyzerResult {
  final int version;
  final List<AnalyzerDiagnostic> diagnostics;

  AnalyzerResult({
    required this.version,
    required this.diagnostics,
  });

  factory AnalyzerResult.fromJson(Map<String, dynamic> json) =>
      _$AnalyzerResultFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzerResultToJson(this);
}

@JsonSerializable()
class AnalyzerDiagnostic {
  final String code;
  final String documentation;
  final DiagnosticLocation location;
  final String problemMessage;

  @ErrorSeverityConverter()
  final ErrorSeverity severity;

  @ErrorTypeConverter()
  final ErrorType type;

  AnalyzerDiagnostic({
    required this.code,
    required this.documentation,
    required this.location,
    required this.problemMessage,
    required this.severity,
    required this.type,
  });

  factory AnalyzerDiagnostic.fromJson(Map<String, dynamic> json) =>
      _$AnalyzerDiagnosticFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyzerDiagnosticToJson(this);
}

@JsonSerializable()
class DiagnosticLocation {
  final String file;
  final DiagnosticLocationRange range;

  DiagnosticLocation({
    required this.file,
    required this.range,
  });

  factory DiagnosticLocation.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosticLocationToJson(this);
}

@JsonSerializable()
class DiagnosticLocationRange {
  final DiagnosticLocationRangePoint start;
  final DiagnosticLocationRangePoint end;

  DiagnosticLocationRange({
    required this.start,
    required this.end,
  });

  factory DiagnosticLocationRange.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationRangeFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosticLocationRangeToJson(this);
}

@JsonSerializable()
class DiagnosticLocationRangePoint {
  final int column;
  final int line;
  final int offset;

  DiagnosticLocationRangePoint({
    required this.column,
    required this.line,
    required this.offset,
  });

  factory DiagnosticLocationRangePoint.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticLocationRangePointFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosticLocationRangePointToJson(this);
}
