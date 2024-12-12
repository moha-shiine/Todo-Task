class Taskmodel {
  final int id;
  final String title;
  final String category;
  final String subtitle;
  final String? start_time; // Updated to match database column
  final String? end_time; // Updated to match database column
  final String timeTask;

  Taskmodel({
    required this.id,
    required this.title,
    required this.category,
    required this.subtitle,
    this.start_time, // Updated property name
    this.end_time, // Updated property name
    required this.timeTask,
  });

  // Convert Taskmodel to a Map for database insertion
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'subtitle': subtitle,
      'start_time': start_time, // Updated field name
      'end_time': end_time, // Updated field name
      'timeTask': timeTask,
    };
  }

  // Convert Map to Taskmodel instance
  factory Taskmodel.fromJson(Map<String, dynamic> json) {
    return Taskmodel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      subtitle: json['subtitle'],
      start_time: json['start_time'], // Updated field name
      end_time: json['end_time'], // Updated field name
      timeTask: json['timeTask'],
    );
  }
}
