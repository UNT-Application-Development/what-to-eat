import 'package:flutter/material.dart';

class CreateGroupFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a group'),
      ),
      body: CreateGroupForm(),
    );
  }
}



//the form widget
class CreateGroupForm extends StatefulWidget {
  @override
  CreateGroupFormState createState() {
    return CreateGroupFormState();
  }
}

//the state class for the form widget
class CreateGroupFormState extends State<CreateGroupForm> {
  //create a global key to identify the Form widget and allow validation
  final _formKey = GlobalKey<FormState>();

  //the text editing controller for the restaurant name field
  final groupNameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //build a Form widget using the _formKey created above
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a group name'
              ),
              controller: groupNameController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    //TODO: Retrieve the value of the group name
                    print("The form was submitted with the value " + groupNameController.text);
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






/*

code for testing the form on its own

 */
void main() {
  runApp(TestForm());
}

class TestForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing of Create Group Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateGroupFormScreen(),
    );
  }
}
