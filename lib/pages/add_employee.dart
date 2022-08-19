import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final locationController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.save),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: Text("Add Employee"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Name';
                }
                return null;
              },
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Job';
                }
                return null;
              },
              controller: jobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Job Role',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Location';
                }
                return null;
              },
              controller: locationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Location',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Age';
                }
                return null;
              },
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
