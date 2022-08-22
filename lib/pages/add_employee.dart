import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as d;
import '../database/mydatabase.dart';

class AddEmployee extends StatefulWidget {
  final bool isUpdate;
  late final String? name;
  final String? job;
  final String? place;

  AddEmployee({
    Key? key,
    required this.isUpdate,
    this.name,
    this.job,
    this.place,
  }) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  late MyDatabase myDatabase;

  final nameController = TextEditingController();

  final jobController = TextEditingController();

  final locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myDatabase = MyDatabase();
  }

  @override
  void dispose() {
    super.dispose();
    myDatabase.close();
    nameController.dispose();
    jobController.dispose();
    locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final entity = EmployeeCompanion(
                name: d.Value(nameController.text),
                job: d.Value(jobController.text),
                place: d.Value(locationController.text),
              );

              myDatabase.insertEmployee(entity).then(
                    (value) => ScaffoldMessenger.of(context).showMaterialBanner(
                      MaterialBanner(
                        content: Text("New Employee Added $value"),
                        actions: [
                          TextButton(
                            onPressed: () => ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner(),
                            child: Text("Close"),
                          )
                        ],
                      ),
                    ),
                  );
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: widget.isUpdate ? Text("Update Employee") : Text("Add Employee"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.name ?? "",
              onChanged: (value) => widget.name = value,
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
          ],
        ),
      ),
    );
  }
}
