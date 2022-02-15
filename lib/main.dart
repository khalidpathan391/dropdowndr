import 'package:flutter/material.dart';

import 'Docter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ?key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(child: MyHomePage(title: 'DOCTOR')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key ?key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = "Dr_Ahmad_Khan";
  List<String> primelist = [
    "Dr_Ahmad_Khan",
    "Dr_Jakir_Alvi",
    "Dr_Nihal_Khan",
    "Dr_Sajed_Khan",
    "Dr_Sana_Khan"
  ];
  List<Doctor> doctor = [
   Doctor("Dr_Ahmad_Khan", "Rama_Hospital", "Dentist", "2019",
        "assets/images/Dr_Ahmad_Khan.jpg"),
    Doctor("Dr_Jakir_Alvi", "Hi_Tech", "Surgeon", "2019",
        "assets/images/Dr_Jakir_Alvi.jpg"),
    Doctor("Dr_Nihal_Khan", "Era", "Skin_Specialist", "2019",
        "assets/images/Dr_Nihal_Khan.jpg"),
    Doctor("Dr_Sajed_Khan", "KMC", "Sexologist", "2019",
        "assets/images/Dr_Sajed_Khan.jpg"),
    Doctor("Dr_Sana_Khan", "Integral", "Neuro_Specialist", "2019",
        "assets/images/Dr_Sana_Khan.jpg"),

  ];

    Doctor? selectedpath =  null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_circle_down),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String ?newValue) {
                setState(() {
                  dropdownValue = newValue!;

                  for (int x = 0; x < doctor.length; x++) {
                    if (dropdownValue == doctor[x].name)
                      selectedpath = doctor[x];
                  }
                });
              },
              items: primelist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            selectedpath != null
                ? Container(
                width: 500,

                // color: Colors.yellow,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.yellow])),
                child: Row(
                  children: [
                    Container(
                        height: 200,
                        width: 200,
                        child: Image.asset(selectedpath!.pic.toString())),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        Text("Name:${selectedpath!.name}"),
                        Text("Duration:${selectedpath!.hospital}"),
                        Text("Party:${selectedpath!.specialization}")
                      ],
                    )
                  ],
                ))
                : SizedBox()
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
