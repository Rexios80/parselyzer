import 'package:analyzer/error/error.dart';
import 'package:json_annotation/json_annotation.dart';

/// Convert between [DiagnosticSeverity] and [String]
class ErrorSeverityConverter extends JsonConverter<DiagnosticSeverity, String> {
  /// Constructor
  const ErrorSeverityConverter();

  @override
  DiagnosticSeverity fromJson(String json) =>
      DiagnosticSeverity.values.firstWhere(
        (e) => e.name == json,
        orElse: () => throw Exception('Unknown DiagnosticSeverity: $json'),
      );

  @override
  String toJson(DiagnosticSeverity object) => object.name;
}

/// Convert between [DiagnosticType] and [String]
class ErrorTypeConverter extends JsonConverter<DiagnosticType, String> {
  /// Constructor
  const ErrorTypeConverter();

  @override
  DiagnosticType fromJson(String json) => DiagnosticType.values.firstWhere(
        (e) => e.name == json,
        orElse: () => throw Exception('Unknown DiagnosticType: $json'),
      );

  @override
  String toJson(DiagnosticType object) => object.name;
}
