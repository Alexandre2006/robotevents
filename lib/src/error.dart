class RobotEventsError extends Error {
  final int? code;
  final String? message;

  RobotEventsError(this.message, this.code);

  @override
  String toString() => 'RobotEventsError: $message (Code: $code)';
}
