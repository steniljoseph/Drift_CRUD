import 'package:demo/database/mydatabase.dart';
import 'package:demo/pages/add_employee.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MyDatabase myDatabase;

  @override
  void initState() {
    myDatabase = MyDatabase();
    super.initState();
  }

  @override
  void dispose() {
    myDatabase.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Employee CRUD"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<EmployeeData>>(
              future: myDatabase.getEmployees(),
              builder: (context, snapshot) {
                final employees = snapshot.data!;
                if (snapshot.data == null) {
                  return Center(
                    child: Text("No Employee Found"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: employees.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    final employee = employees[index];
                    return ListTile(
                      title: Text(employee.name.toUpperCase()),
                      subtitle: Text(employee.job.toUpperCase()),
                      trailing: Wrap(children: [
                        IconButton(
                          onPressed: () {
                            Get.to(AddEmployee(
                              isUpdate: true,
                              job: employee.job,
                              name: employee.name,
                              place: employee.place,
                            ));
                          },
                          icon: Icon(
                            Icons.edit,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
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
        child: Icon(Icons.add),
        onPressed: () => Get.to(
          AddEmployee(
            isUpdate: false,
          ),
        ),
      ),
    );
  }
}
