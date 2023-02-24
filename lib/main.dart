import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zarity/main.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

List cta = [];
List taskList = [];
bool check = false;
Widget dialog() {
  return Container(
    
    height: 400,
    width: 400,
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: cta.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("Name :${cta[index]['Name']}",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
          subtitle: Text("Age  :${cta[index]['Age']}",style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
        );
      },
    ),
  );
}

@override
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Outfit'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void get() async {
    FirebaseFirestore.instance
        .collection('tasklist')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          taskList.add(doc);
        });
      });
    });

    FirebaseFirestore.instance
        .collection('cta')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          cta.add(doc);
        });
      });
    });
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF02012D),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/img.jpeg',
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good afternoon',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  Text(
                    'John Doe',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset("assets/ic_launcher.png")),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell_fill)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 17.818,
            right: MediaQuery.of(context).size.width / 17.818),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: 68,
                width: 350,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    CircularPercentIndicator(
                      radius: 20,
                      percent: 0.7,
                      center: Text(
                        '70 %',
                        style: TextStyle(color: Colors.white),
                      ),
                      progressColor: Color(0xFFFAFF00),
                      startAngle: 180,
                      lineWidth: 2,
                      rotateLinearGradient: true,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Please complete your profile to book\nconsultations.',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              elevation: 1,
              color: Color(0xFF1B2152),
            ),
            Text(
              'Section Title 1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: 18, bottom: 18),
                  elevation: 1,
                  color: Color(0xFF1B2152),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/doc.jpeg',
                              width: 45,
                              height: 45,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'CTA-1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      height: 122,
                      width: 95,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: 18, bottom: 18),
                  elevation: 1,
                  color: Color(0xFF1B2152),
                  child: GestureDetector(
                    child: Container(
                      height: 122,
                      width: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/prescription (1).png',
                              width: 45,
                              height: 45,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'CTA-2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(top: 18, bottom: 18),
                  elevation: 1,
                  color: Color(0xFF1B2152),
                  child: GestureDetector(
                    child: Container(
                      height: 122,
                      width: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.asset(
                              'assets/prescription (1).png',
                              width: 45,
                              height: 45,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'CTA-3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Section Title 2',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                padding: EdgeInsets.all(13),
                height: 80,
                width: 350,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/download.jpeg',
                        width: 45,
                        height: 45,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Roe Rogan',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Sub Text Shown Here\nCard Description',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 57,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor:Color(0xFF2E2C71) ,
                                title: Text('CTA',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                                content: dialog(),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff1051e3),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                                color: Color.fromRGBO(103, 103, 214, 0.12),
                                width: 2),
                            borderRadius: BorderRadius.circular(35)),
                        alignment: Alignment.center,
                        height: 25,
                        width: MediaQuery.of(context).size.width / 5.297,
                        child: Text('CTA',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFFFF))),
                      ),
                    )
                  ],
                ),
              ),
              elevation: 1,
              color: Color(0xFF1B2152),
            ),
            Card(
              margin: EdgeInsets.only(top: 10, bottom: 4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0))),
              elevation: 1,
              color: Color(0xFF1B2152),
              child: Container(
                height: 99,
                width: 350,
                padding: EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffE8E8E8)),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images.jpeg',
                            width: 45,
                            height: 45,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Article Title',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffD4D4D4)),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              'Article excerpt description that runs two lines\nlong shown here',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffE1E1E1)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              color: Color(0xFF1B2152),
              height: 74,
              width: 350,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images.jpeg',
                      width: 45,
                      height: 45,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Article Title',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffD4D4D4)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Article excerpt description that runs two lines\nlong shown here',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffE1E1E1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: Color(0xFF02012D),
              height: 4,
            ),
            Container(
              padding: EdgeInsets.all(13),
              color: Color(0xFF1B2152),
              height: 74,
              width: 350,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images.jpeg',
                      width: 45,
                      height: 45,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Article Title',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffD4D4D4)),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Article excerpt description that runs two lines\nlong shown here',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffE1E1E1)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14))),
              elevation: 1,
              color: Color(0xFF1B2152),
              child: Container(
                height: 74,
                width: 350,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff1051e3),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(35)),
                    alignment: Alignment.center,
                    height: 25,
                    width: 112,
                    child: Text('View More',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: BottomNavigationBar(
              currentIndex: 0,
              selectedFontSize: 12,
              fixedColor: Colors.white,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFF2E2C71),
              elevation: 1,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xff2075D9),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  icon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(30, 210, 210, 210),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  label: 'Button-1',
                ),
                BottomNavigationBarItem(
                  activeIcon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xff2075D9),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  icon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(30, 210, 210, 210),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(Icons.manage_accounts),
                    ),
                  ),
                  label: 'Button-2',
                ),
                BottomNavigationBarItem(
                  activeIcon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xff2075D9),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        CupertinoIcons.bandage,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  icon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(30, 210, 210, 210),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        CupertinoIcons.bandage,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  label: 'Button-3',
                ),
                BottomNavigationBarItem(
                  activeIcon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xff2075D9),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        CupertinoIcons.doc_plaintext,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  icon: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(30, 210, 210, 210),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: Icon(
                        CupertinoIcons.doc_plaintext,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  label: 'Button-4',
                ),
              ],
              onTap: (value) {
                if (value == 3) {
                  showModalBottomSheet(
                      elevation: 1,
                      backgroundColor: Color(0xFF2E2C71),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      constraints:
                          BoxConstraints(maxWidth: 360, maxHeight: 260),
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text(
                                'Task List',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: taskList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(taskList[index]['name'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    trailing: Checkbox( checkColor: Colors.white,focusColor: Colors.white,hoverColor: Colors.white,
                                    side: BorderSide(color: Colors.white),
  value: check, 
  onChanged: (bool? value){
      
      setState(() {
          check = value!;
      });
  }
)
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      });
                }
              }),
        ),
      ),
    );
  }
}
