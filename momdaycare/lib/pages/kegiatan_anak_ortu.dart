import 'package:flutter/material.dart';
import 'login_page.dart';

class KegiatanAnakPage extends StatefulWidget {
  @override
  _KegiatanAnakPageState createState() => _KegiatanAnakPageState();
}

class _KegiatanAnakPageState extends State<KegiatanAnakPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Status Anak'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Personal Information section
              _buildSectionTitle('Personal Information'),
              _buildTextFormField('Child\'s Name'),
              _buildTextFormField('Date of Birth'),
              _buildTextFormField('Drop-off Time'),
              SizedBox(height: 20),

              // Health Information section
              _buildSectionTitle('Health Information'),
              _buildTextFormField('Allergies'),
              _buildTextFormField('Medications'),
              _buildTextFormField('Special Instructions'),
              SizedBox(height: 20),

              // Daily Routine section
              _buildSectionTitle('Daily Routine'),
              _buildTextFormField('Preferred Nap Time'),
              _buildTextFormField('Meal Preferences'),
              _buildTextFormField('Favorite Activities'),
              SizedBox(height: 20),

              // Emergency Contact section
              _buildSectionTitle('Emergency Contact'),
              _buildTextFormField('Contact Name'),
              _buildTextFormField('Contact Number'),
              _buildTextFormField('Relationship to Child'),
              SizedBox(height: 20),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the data
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildTextFormField(String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
