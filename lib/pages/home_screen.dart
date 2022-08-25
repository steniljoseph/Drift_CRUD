import 'package:demo/constants.dart';
import 'package:demo/database/mydatabase.dart';
import 'package:demo/main.dart';
import 'package:demo/pages/add_update_employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drift/drift.dart' as d;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late MyDatabase myDatabase;

  @override
  void initState() {
    // myDatabase = MyDatabase();
    super.initState();
  }

  @override
  void dispose() {
    // myDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Employee CRUD"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight,
            StreamBuilder<List<EmployeeData>>(
              stream: myDatabase.getEmployees(),
              builder: (context, snapshot) {
                final employees = snapshot.data;
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No Employee Found"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: employees!.length,
                  separatorBuilder: (context, index) => kHeight,
                  itemBuilder: (context, index) {
                    final employee = employees[index];
                    return ListTile(
                      title: Text(employee.name.toUpperCase()),
                      subtitle: Text(employee.job.toUpperCase()),
                      trailing: Wrap(children: [
                        IconButton(
                          onPressed: () {
                            Get.to(
                              AddEmployee(
                                isUpdate: true,
                                empDatas: EmployeeCompanion(
                                  id: d.Value(employee.id),
                                  name: d.Value(employee.name),
                                  job: d.Value(employee.job),
                                  place: d.Value(employee.place),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            final id = employees[index].id;
                            myDatabase.deleteEmployee(id);
                          },
                          icon: const Icon(
                            Icons.delete,
                          ),
                        )
                      ]),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(
          const AddEmployee(
            isUpdate: false,
          ),
        ),
      ),
    );
  }
}
