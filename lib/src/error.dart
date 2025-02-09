class RobotEventsError extends Error {
  final int code;
  final String message;

  RobotEventsError(this.code, this.message);

  @override
  String toString() {
    return 'RobotEventsError: $code - $message';
  }
}
