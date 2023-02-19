import 'package:analyzer/error/error.dart';
import 'package:json_annotation/json_annotation.dart';

/// Convert between [ErrorSeverity] and [String]
class ErrorSeverityConverter extends JsonConverter<ErrorSeverity, String> {
  /// Constructor
  const ErrorSeverityConverter();

  @override
  ErrorSeverity fromJson(String json) => ErrorSeverity.values.firstWhere(
        (e) => e.name == json,
        orElse: () => throw Exception('Unknown ErrorSeverity: $json'),
      );

  @override
  String toJson(ErrorSeverity object) => object.name;
}

/// Convert between [ErrorType] and [String]
class ErrorTypeConverter extends JsonConverter<ErrorType, String> {
  /// Constructor
  const ErrorTypeConverter();

  @override
  ErrorType fromJson(String json) => ErrorType.values.firstWhere(
        (e) => e.name == json,
        orElse: () => throw Exception('Unknown ErrorType: $json'),
      );

  @override
  String toJson(ErrorType object) => object.name;
}
