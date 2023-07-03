import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<ContactData> contactList = [
      ContactData("John Doha", "john@gmail.com", 0162654666565),
      ContactData("Alex", "alex@gmail.com", 0162645433565),
      ContactData("Tim", "tim@gmail.com", 0145346565),
      ContactData("Jane", "jane@gmail.com", 0145346466565),
      ContactData("Carl", "carl@gmail.com", 0145346466565),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                setState(() {

                });
                showModalBottomSheet(context: context, builder: (context){
                  return SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Contact Details",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Name : ${contactList[index].name}"),
                          Text("Email : ${contactList[index].email}"),
                          Text("Phone Number : ${contactList[index].phoneNumber}"),
                        ],
                      ),
                    ),

                  );
                });
              },
              title: Text(contactList[index].name),
            );
          },
          separatorBuilder: (context,index){
            return const SizedBox();
          },
          itemCount: contactList.length,
      ),
    );
  }

}

class ContactData {
  String name, email;
  int phoneNumber;
  ContactData(this.name, this.email, this.phoneNumber);
}