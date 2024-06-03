import 'package:flutter/material.dart';

class InputKegiatanPage extends StatefulWidget {
  @override
  _InputKegiatanPageState createState() => _InputKegiatanPageState();
}

class _InputKegiatanPageState extends State<InputKegiatanPage> {
  final _formKey = GlobalKey<FormState>();

  // State variables
  String? _mealType;
  bool _none = false;
  bool _some = false;
  bool _lots = false;
  bool _diaper = false;
  bool _potty = false;
  bool _dry = false;
  bool _wet = false;
  bool _bm = false;
  bool _breast = false;
  bool _formula = false;
  bool _milk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Routine Report'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality here
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
              // Basic Information section
              _buildSectionTitle('Basic Information'),
              _buildTextFormField('Child\'s Name'),
              _buildTextFormField('Date'),
              _buildTextFormField('Body Temperature'),
              _buildTextFormField('Condition'),
              SizedBox(height: 20),

              // Meals section
              _buildSectionTitle('Meals'),
              _buildDropdown('Meal Type',
                  ['Breakfast', 'Snack', 'Lunch', 'Dinner', 'Fluids', 'Other']),
              _buildTextFormField('Food'),
              _buildCheckboxGroup('Quantity', ['None', 'Some', 'Lots']),
              _buildTextFormField('Comments'),
              SizedBox(height: 20),

              // Toilet section
              _buildSectionTitle('Toilet'),
              _buildTextFormField('Time'),
              _buildCheckboxGroup('Type', ['Diaper', 'Potty']),
              _buildCheckboxGroup('Dry/Wet/BM', ['Dry', 'Wet', 'BM']),
              _buildTextFormField('Notes'),
              SizedBox(height: 20),

              // Rest section
              _buildSectionTitle('Rest'),
              _buildTextFormField('Start'),
              _buildTextFormField('Rest'),
              SizedBox(height: 20),

              // Bottle section
              _buildSectionTitle('Bottle'),
              _buildTextFormField('Time'),
              _buildTextFormField('ML'),
              _buildCheckboxGroup('Bottle Type', ['Breast', 'Formula', 'Milk']),
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

  Widget _buildDropdown(String labelText, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _mealType = newValue;
          });
        },
        value: _mealType,
      ),
    );
  }

  Widget _buildCheckboxGroup(String labelText, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(labelText),
          Wrap(
            children: options.map((String option) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Checkbox(
                    value: _getCheckboxValue(option),
                    onChanged: (bool? value) {
                      setState(() {
                        _setCheckboxValue(option, value!);
                      });
                    },
                  ),
                  Text(option),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  bool _getCheckboxValue(String option) {
    switch (option) {
      case 'None':
        return _none;
      case 'Some':
        return _some;
      case 'Lots':
        return _lots;
      case 'Diaper':
        return _diaper;
      case 'Potty':
        return _potty;
      case 'Dry':
        return _dry;
      case 'Wet':
        return _wet;
      case 'BM':
        return _bm;
      case 'Breast':
        return _breast;
      case 'Formula':
        return _formula;
      case 'Milk':
        return _milk;
      default:
        return false;
    }
  }

  void _setCheckboxValue(String option, bool value) {
    switch (option) {
      case 'None':
        _none = value;
        break;
      case 'Some':
        _some = value;
        break;
      case 'Lots':
        _lots = value;
        break;
      case 'Diaper':
        _diaper = value;
        break;
      case 'Potty':
        _potty = value;
        break;
      case 'Dry':
        _dry = value;
        break;
      case 'Wet':
        _wet = value;
        break;
      case 'BM':
        _bm = value;
        break;
      case 'Breast':
        _breast = value;
        break;
      case 'Formula':
        _formula = value;
        break;
      case 'Milk':
        _milk = value;
        break;
    }
  }
}
