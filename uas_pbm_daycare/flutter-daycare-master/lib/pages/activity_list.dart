import 'package:flutter/material.dart';
import 'activity_input.dart';

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  final List<Map<String, dynamic>> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Activities'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 163, 186, 197),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/anak4.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return Card(
              child: ExpansionTile(
                title: Text(activity['childName']),
                subtitle: Text(activity['activityDescription']),
                children: [
                  ListTile(
                    title: const Text('Age'),
                    subtitle: Text(activity['childAge']),
                  ),
                  ListTile(
                    title: const Text('Temperature'),
                    subtitle: Text(activity['childTemperature']),
                  ),
                  ListTile(
                    title: const Text('Condition'),
                    subtitle: Text(activity['childCondition']),
                  ),
                  ListTile(
                    title: const Text('Date'),
                    subtitle: Text(activity['selectedDate']),
                  ),
                  ListTile(
                    title: const Text('Drop-off Time'),
                    subtitle: Text(activity['dropOffTime']),
                  ),
                  ListTile(
                    title: const Text('Bathroom Time'),
                    subtitle: Text(activity['bathroomTime']),
                  ),
                  ListTile(
                    title: const Text('Toilet Type'),
                    subtitle: Text(activity['toiletType']),
                  ),
                  ListTile(
                    title: const Text('Toilet Condition'),
                    subtitle: Text(activity['toiletCondition']),
                  ),
                  ListTile(
                    title: const Text('Shower Time'),
                    subtitle: Text(activity['showerTime']),
                  ),
                  ListTile(
                    title: const Text('Parent Note'),
                    subtitle: Text(activity['parentNote']),
                  ),
                  ListTile(
                    title: const Text('Feelings'),
                    subtitle: Text(activity['feelings']
                        .entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .join(', ')),
                  ),
                  ListTile(
                    title: const Text('Items Needed'),
                    subtitle: Text(activity['itemsNeeded']
                        .entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .join(', ')),
                  ),
                  ListTile(
                    title: const Text('Meals'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: activity['meals'].entries.map<Widget>((entry) {
                        final mealType = entry.key;
                        final mealData = entry.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('$mealType:'),
                            Text('  Food: ${mealData['food']}'),
                            Text('  Quantity: ${mealData['quantity']}'),
                            Text('  Comments: ${mealData['comments']}'),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ActivityInputPage()),
          );
          if (result != null) {
            setState(() {
              activities.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
