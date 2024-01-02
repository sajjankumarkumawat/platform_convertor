import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;
  bool isProfile = false;
  bool isTheme = false;
  DateTime? date;

  TextEditingController _name = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _chat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Platform Convertor"),
          actions: [
            Switch(
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            )
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person_add_alt_1),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),
            Tab(
              child: Text("SETTING"),
            ),
          ]),
        ),
        body: TabBarView(children: [
          Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 54,
                ),
                ClipOval(
                  child: Container(
                    height: size.height / 8,
                    width: size.width / 3.8,
                    color: Color(0xffE3D4F4),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.camera_alt,
                      size: 26,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 54,
                ),
                Container(
                  width: size.width / 1.05,
                  child: TextField(
                    onTap: () {},
                    cursorColor: Colors.black54,
                    controller: _name,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                      labelText: "Name",
                      labelStyle: const TextStyle(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(),
                      ),
                      hintText: 'Enter your name',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 54,
                ),
                Container(
                  width: size.width / 1.05,
                  child: TextField(
                    onTap: () {},
                    cursorColor: Colors.black54,
                    controller: _phonenumber,
                    keyboardType: TextInputType.numberWithOptions(),
                    style: const TextStyle(fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      labelText: "Phone Number",
                      labelStyle: const TextStyle(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(),
                      ),
                      hintText: 'Enter your phone number',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 54,
                ),
                Container(
                  width: size.width / 1.05,
                  child: TextField(
                    onTap: () {},
                    cursorColor: Colors.black54,
                    controller: _chat,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.message_outlined,
                        color: Colors.black,
                      ),
                      labelText: "Chat Conversation",
                      labelStyle: const TextStyle(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(),
                      ),
                      hintText: 'Enter your chat',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: ()async {
                      var pickedDate = await  showDatePicker(
                            context: context,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2030));

                      print(pickedDate);
                      setState(() {
                        date = pickedDate!;
                      });

                      },
                      icon: Icon(
                        Icons.calendar_month,
                      ),
                    ),
                    date !=null ?Text("${date}") : Text("${DateTime.now()}"),

                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: ()async {
                      var pickedTime = showTimePicker(context: context, initialTime: TimeOfDay.now());

                      print(pickedTime);
                      },
                      icon: Icon(
                        CupertinoIcons.time,
                      ),
                    ),
                    time != null?Text("${time}") : Text("${TimeOfDay.now()}")
                  ],
                ),
                ElevatedButton(onPressed: () {
                    setState(() async {
                      if(_name.text.isNotEmpty && _phonenumber.text.isNotEmpty){
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString("Name", _name.text);
                        name = pref.getString("Name")! as List<String>;
                        pref.setString("PhoneNumber", _phonenumber.text);
                        phonenumber = pref.getString("PhoneNumber")!;
                      }
                    });
                }, child: Text("Save"))
              ],
            ),
          ),
          // Center(child: const Text("No chats yet...")),
          Container(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                Row(
                  children: [
                    Text("$name"),
                    Text("$phonenumber"),
                    Text("$date"),
                  ],
                )
              ],
            ),
          ),
          Center(child: const Text("No calls yet...")),
          Container(
            height: size.height,
            width: size.width,
            child: Column(

              children: [
                SizedBox(height: size.height / 28),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 15,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.black54,
                      size: 30,
                    ),
                    SizedBox(
                      width: size.width / 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "Update Profile Data",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width / 4,
                    ),
                    Switch(
                      value: isProfile,
                      onChanged: (value) {
                        setState(() {
                          isProfile = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height / 64),
                Divider(
                  height: size.height / 54,
                ),
                SizedBox(height: size.height / 64),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 15,
                    ),
                    Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.black54,
                      size: 30,
                    ),
                    SizedBox(
                      width: size.width / 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "Change theme",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width / 3,
                    ),
                    Switch(
                      value: isTheme,
                      onChanged: (value) {
                        setState(() {
                          isTheme = value;
                        });
                      },
                    ),
                  ],
                ),

              ],
            ),
          )
        ]),
      ),
    );
  }
}
