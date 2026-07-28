import 'package:analyzer/error/error.dart';

/// Convert between [DiagnosticSeverity] and [String]
class ErrorSeverityConverter {
  /// Constructor
  const ErrorSeverityConverter();

  /// Parse a [DiagnosticSeverity] from JSON
  DiagnosticSeverity fromJson(String json) =>
      DiagnosticSeverity.values.firstWhere(
        (e) => e.name == json,
        orElse: () => throw Exception('Unknown DiagnosticSeverity: $json'),
      );

  /// Convert a [DiagnosticSeverity] to JSON
  String toJson(DiagnosticSeverity object) => object.name;
}

/// Convert between [DiagnosticType] and [String]
class ErrorTypeConverter {
  /// Constructor
  const ErrorTypeConverter();

  /// Parse a [DiagnosticType] from JSON
  DiagnosticType fromJson(String json) => DiagnosticType.values.firstWhere(
    (e) => e.name == json,
    orElse: () => throw Exception('Unknown DiagnosticType: $json'),
  );

  /// Convert a [DiagnosticType] to JSON
  String toJson(DiagnosticType object) => object.name;
}
