import 'package:demo/constants.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as d;
import 'package:get/get.dart';
import '../database/mydatabase.dart';

class AddEmployee extends StatefulWidget {
  final bool isUpdate;
  final EmployeeCompanion? empDatas;

  const AddEmployee({
    Key? key,
    required this.isUpdate,
    this.empDatas,
  }) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  String? initialName;
  String? initialJob;
  String? initialPlace;
  final _globalKey = GlobalKey<FormState>();

  // late  MyDatabase myDatabase;

  late EmployeeCompanion emp;

  // var nameController = TextEditingController();

  // final jobController = TextEditingController();

  // final locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emp = widget.empDatas ??
        const EmployeeCompanion(
          name: d.Value(''),
          job: d.Value(''),
          place: d.Value(''),
        );
    // myDatabase = MyDatabase();
    // initialName = widget.name;
    // initialJob = widget.job;
    // initialPlace = widget.place;
  }

  @override
  void dispose() {
    super.dispose();
    // myDatabase.close();
    // nameController.dispose();
    // jobController.dispose();
    // locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              _globalKey.currentState!.save();
              widget.isUpdate
                  ? await myDatabase.updateEmployee(emp)
                  : await myDatabase.insertEmployee(emp);
              Get.back();

              // if (widget.isUpdate) {
              //   log("updated called");
              //   // final entity = EmployeeCompanion(
              //   //   name: d.Value(initialName!),
              //   //   job: d.Value(initialJob!),
              //   //   place: d.Value(initialPlace!),
              //   // );
              //   await myDatabase.updateEmployee(emp);
              //   Get.off(const HomeScreen());
              // } else if (_globalKey.currentState.save()) {
              //   log("add called");
              //   // final entity = EmployeeCompanion(
              //   //   name: d.Value(initialName!),
              //   //   job: d.Value(initialJob!),
              //   //   place: d.Value(initialPlace!),
              //   // );
              //   await myDatabase.insertEmployee(emp);
              //   Get.off(const HomeScreen());
              // }
            },
          ),
          kWidth,
        ],
        elevation: 0,
        centerTitle: true,
        title: widget.isUpdate
            ? const Text("Update Employee")
            : const Text("Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: emp.name.value,
                // onChanged: (value) {
                //   initialName = value;
                // },
                onSaved: (value) {
                  emp = emp.copyWith(name: d.Value(value!));
                },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty && value.length < 3) {
                //     return 'Please Enter Your Name';
                //   }
                //   return null;
                // },
                // controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              kHeight,
              TextFormField(
                initialValue: emp.job.value,
                // onChanged: (value) => initialJob = value,
                onSaved: (value) {
                  emp = emp.copyWith(job: d.Value(value!));
                },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty && value.length < 3) {
                //     return 'Please Enter Your Job';
                //   }
                //   return null;
                // },
                // controller: jobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Job Role',
                ),
              ),
              kHeight,
              TextFormField(
                initialValue: emp.place.value,
                // onChanged: (value) => initialPlace = value,
                onSaved: (value) {
                  emp = emp.copyWith(place: d.Value(value!));
                },
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (value) {
                //   if (value!.isEmpty && value.length < 3) {
                //     return 'Please Enter Your Location';
                //   }
                //   return null;
                // },
                // controller: locationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Location',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
