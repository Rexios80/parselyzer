// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'analyzer_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyzerResult _$AnalyzerResultFromJson(Map<String, dynamic> json) =>
    AnalyzerResult(
      version: json['version'] as int,
      diagnostics: (json['diagnostics'] as List<dynamic>)
          .map((e) => AnalyzerDiagnostic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnalyzerResultToJson(AnalyzerResult instance) =>
    <String, dynamic>{
      'version': instance.version,
      'diagnostics': instance.diagnostics,
    };

AnalyzerDiagnostic _$AnalyzerDiagnosticFromJson(Map<String, dynamic> json) =>
    AnalyzerDiagnostic(
      code: json['code'] as String,
      documentation: json['documentation'] as String,
      location:
          DiagnosticLocation.fromJson(json['location'] as Map<String, dynamic>),
      problemMessage: json['problemMessage'] as String,
      severity:
          const ErrorSeverityConverter().fromJson(json['severity'] as String),
      type: const ErrorTypeConverter().fromJson(json['type'] as String),
    );

Map<String, dynamic> _$AnalyzerDiagnosticToJson(AnalyzerDiagnostic instance) =>
    <String, dynamic>{
      'code': instance.code,
      'documentation': instance.documentation,
      'location': instance.location,
      'problemMessage': instance.problemMessage,
      'severity': const ErrorSeverityConverter().toJson(instance.severity),
      'type': const ErrorTypeConverter().toJson(instance.type),
    };

DiagnosticLocation _$DiagnosticLocationFromJson(Map<String, dynamic> json) =>
    DiagnosticLocation(
      file: json['file'] as String,
      range: DiagnosticLocationRange.fromJson(
          json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiagnosticLocationToJson(DiagnosticLocation instance) =>
    <String, dynamic>{
      'file': instance.file,
      'range': instance.range,
    };

DiagnosticLocationRange _$DiagnosticLocationRangeFromJson(
        Map<String, dynamic> json) =>
    DiagnosticLocationRange(
      start: DiagnosticLocationRangePoint.fromJson(
          json['start'] as Map<String, dynamic>),
      end: DiagnosticLocationRangePoint.fromJson(
          json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiagnosticLocationRangeToJson(
        DiagnosticLocationRange instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

DiagnosticLocationRangePoint _$DiagnosticLocationRangePointFromJson(
        Map<String, dynamic> json) =>
    DiagnosticLocationRangePoint(
      column: json['column'] as int,
      line: json['line'] as int,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$DiagnosticLocationRangePointToJson(
        DiagnosticLocationRangePoint instance) =>
    <String, dynamic>{
      'column': instance.column,
      'line': instance.line,
      'offset': instance.offset,
    };
