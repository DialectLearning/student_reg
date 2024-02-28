import 'package:flutter/material.dart';
import 'package:student_reg/student_reg_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> courses = ['Flutter', 'Dart', 'JavaScript', 'Python'];
  final List<UserData> _savedStudents = []; //
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _ageController = TextEditingController();
    final _pincodeController = TextEditingController();
    String _selectedCourse = courses[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: _selectedCourse,
              items: courses
                  .map((course) => DropdownMenuItem(
                        value: course,
                        child: Text(course),
                      ))
                  .toList(),
              onChanged: (value) {
                _selectedCourse = value!;
              },
              decoration: const InputDecoration(
                labelText: 'Course',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _pincodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Pincode',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission logic here
                // Access form data through controllers:
                final name = _nameController.text;
                final course = _selectedCourse;
                final age = int.tryParse(_ageController.text);
                final pincode = int.tryParse(_pincodeController.text);

                if (name.isEmpty || pincode == null || age == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill in all fields."),
                  ));
                  return;
                }
                final student = UserData(
                    name: name, course: course, age: age, pincode: pincode);
                setState(() {
                  _savedStudents.add(student);
                  _nameController.clear(); // Clear form fields after submission
                  _ageController.clear();
                  _pincodeController.clear();
                });
              },
              child: const Text('Submit Form'),
            ),
            const SizedBox(height: 20.0),
            if (_savedStudents.isNotEmpty) // Check if list is not empty
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Saved Data:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _savedStudents.length,
                    itemBuilder: (context, index) {
                      final student = _savedStudents[index];
                      return ListTile(
                        title: Text('${student.name}'),
                        subtitle: Text(
                          'Course: ${student.course}, Age: ${student.age}, Pincode: ${student.pincode}',
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
