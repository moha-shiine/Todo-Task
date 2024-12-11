class Taskmodel {
  int? id;
  String title;
  String category;
  String subtitle;
  String timeTask;

  Taskmodel({
    this.id,
    required this.title,
    required this.category,
    required this.subtitle,
    required this.timeTask,
  });

  // Convert JSON to Taskmodel
  factory Taskmodel.fromJson(Map<String, dynamic> json) {
    return Taskmodel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      subtitle: json['subtitle'],
      timeTask: json['timeTask'],
    );
  }

  // Convert Taskmodel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'subtitle': subtitle,
      'timeTask': timeTask,
    };
  }
}
