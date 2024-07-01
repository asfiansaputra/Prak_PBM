class Activity {
  final int id;
  final String caregiverEmail;
  final String childName;
  final String activityDescription;
  final String date;

  Activity({
    required this.id,
    required this.caregiverEmail,
    required this.childName,
    required this.activityDescription,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caregiverEmail': caregiverEmail,
      'childName': childName,
      'activityDescription': activityDescription,
      'date': date,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      caregiverEmail: map['caregiverEmail'],
      childName: map['childName'],
      activityDescription: map['activityDescription'],
      date: map['date'],
    );
  }
}
