class BowlingMachine {
  final int sessionId;
  final DateTime startTime;
  final DateTime? stopTime;
  final int speed;
  final String swingType;
  final String username;

  BowlingMachine({
    this.sessionId = 1,
    required this.startTime,
    required this.stopTime,
    required this.speed,
    required this.swingType,
    required this.username,
  });

  // Convert a BowlingMachine object into a Map.
  Map<String, dynamic> toMap() {
    return {
      'session_id': sessionId,
      'start_time': _formatDateTime(startTime),
      'stop_time': stopTime != null ? _formatDateTime(stopTime!) : null,
      'speed': speed,
      'swing_type': swingType,
      'username': username,
    };
  }

  // Create a BowlingMachine object from a Map.
  factory BowlingMachine.fromMap(Map<String, dynamic> map) {
    return BowlingMachine(
      sessionId: map['session_id'],
      startTime: _parseDateTime(map['start_time']),
      stopTime: map['stop_time'] != null ? _parseDateTime(map['stop_time']) : null,
      speed: map['speed'],
      swingType: map['swing_type'],
      username: map['username'],
    );
  }

  // Helper method to format DateTime to HH:mm:ss
  static String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  }

  // Helper method to parse formatted DateTime from HH:mm:ss
  static DateTime _parseDateTime(String formattedDateTime) {
    List<int> parts = formattedDateTime.split(':').map(int.parse).toList();
    return DateTime(0, 1, 1, parts[0], parts[1], parts[2]);
  }
}
