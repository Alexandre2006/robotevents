class RobotEventsError extends Error {
  final int? code;
  final String? message;

  RobotEventsError(this.code, this.message);

  @override
  String toString() => 'RobotEventsError: $message (Code: $code)';
}
