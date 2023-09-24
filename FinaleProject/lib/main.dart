import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
        textDirection:
            TextDirection.rtl, // قم بتعيين اتجاه النص إلى اليمين إلى اليسار هنا
        child: RegressionLapPrice(),
      ),
    );
  }
}

class RegressionLapPrice extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<RegressionLapPrice> {
  int selectedCoreIValue = 3; // تعيين القيمة الافتراضية إلى 3
  int selectedGenerationValue = 1;
  int selectedFirstHDDTypeValue = 1;
  int selectedFirstHDDSizeValue = 256;
  int selectedSecondHDDTypeValue = 0;
  int selectedSecondHDDSizeValue = 256;
  int selectedRAMSizeValue = 4;
  int selectedBatteryLifeValue = 1;
  double selectedScreenSizeValue = 14;
  int selectedScreenTypeValue = 0;
  String selectedGCTypeValue = "مدمج";
  String selectedLaptopStateValue = 'Old';

/*
  void sendDataToApi(){
     final Map<String, dynamic> data = {
      'coreIValue': selectedCoreIValue,
      'generationValue': selectedGenerationValue,
      'firstHDDTypeValue': selectedFirstHDDTypeValue,
      'firstHDDSizeValue': selectedFirstHDDSizeValue,
      'secondHDDTypeValue': selectedSecondHDDTypeValue,
      'secondHDDSizeValue': selectedSecondHDDSizeValue,
      'ramSizeValue': selectedRAMSizeValue,
      'batteryLifeValue': selectedBatteryLifeValue,
      'screenSizeValue': selectedScreenSizeValue,
      'screenTypeValue': selectedScreenTypeValue,
      'gcTypeValue': selectedGCTypeValue,
      'laptopStateValue': selectedLaptopStateValue,
    };
    
    print(data);
  }*/
  Future<void> sendDataToApi() async {
    print('im here');
    // Create a map representing your data model
    final Map<String, dynamic> data = {
      'coreI': selectedCoreIValue,
      'generation': selectedGenerationValue,
      'firstHDDType': selectedFirstHDDTypeValue,
      'firstHDDSize': selectedFirstHDDSizeValue,
      'secondHDDType': selectedSecondHDDTypeValue,
      'secondHDDSize': selectedSecondHDDSizeValue,
      'ramSize': selectedRAMSizeValue,
      'batteryLife': selectedBatteryLifeValue,
      'screenSize': selectedScreenSizeValue,
      'screenType': selectedScreenTypeValue,
      'gcType': selectedGCTypeValue,
      'laptopState': selectedLaptopStateValue,
    };

    final apiUrl =
        'http://127.0.0.1:8000/submit-data/'; // Replace with your API endpoint
    print(apiUrl);
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Successful API request
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تقديم البيانات'),
            content: Text('تم تقديم البيانات بنجاح!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('موافق'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle API error here
      print('API Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضف معلومات الجهاز'),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(10.0), // تعيين الهوامش للجميع
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('المعالج من فئة انتل:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedCoreIValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedCoreIValue = newValue!;
                                });
                              },
                              items: <int>[3, 5, 7, 9].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('الجيل:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedGenerationValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedGenerationValue = newValue!;
                                });
                              },
                              items: <int>[
                                1,
                                2,
                                3,
                                4,
                                6,
                                7,
                                8,
                                9,
                                10,
                                11,
                                12,
                                13
                              ].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('نوع الهارد الأول:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedFirstHDDTypeValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedFirstHDDTypeValue = newValue!;
                                });
                              },
                              items: <int>[1, 2].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value == 1 ? 'HDD' : 'SSD'),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('حجم الهارد الأول:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedFirstHDDSizeValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedFirstHDDSizeValue = newValue!;
                                });
                              },
                              items: <int>[256, 512, 1000].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('نوع الهارد الثاني:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedSecondHDDTypeValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedSecondHDDTypeValue = newValue!;
                                });
                              },
                              items: <int>[0, 1, 2].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(
                                    value == 0
                                        ? 'NONE'
                                        : (value == 1 ? 'HDD' : 'SSD'),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: 10), // Add margin to the bottom
                        padding:
                            EdgeInsets.all(10), // Add padding to the container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5), // Reduce border opacity
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Increase border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.3), // Add a subtle shadow
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white, // Add a background color
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('حجم الهارد الثاني:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<int>(
                              value: selectedSecondHDDSizeValue,
                              onChanged: (int? newValue) {
                                setState(() {
                                  selectedSecondHDDSizeValue = newValue!;
                                });
                              },
                              items: <int>[256, 512, 1000].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('حجم الذاكرة العشوائية :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              DropdownButton<int>(
                                value: selectedRAMSizeValue,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedRAMSizeValue = newValue!;
                                  });
                                },
                                items: <int>[4, 8, 16, 32, 64].map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(' مدة عمل البطارية بالساعات:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              DropdownButton<int>(
                                value: selectedBatteryLifeValue,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedBatteryLifeValue = newValue!;
                                  });
                                },
                                items: <int>[1, 2, 4, 6, 8].map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(' حجم الشاشة بالانش:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              DropdownButton<double>(
                                value: selectedScreenSizeValue,
                                onChanged: (double? newValue) {
                                  setState(() {
                                    selectedScreenSizeValue = newValue!;
                                  });
                                },
                                items: <double>[14.0, 15.6, 16.0]
                                    .map((double value) {
                                  return DropdownMenuItem<double>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(' دقة الشاشة:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              DropdownButton<int>(
                                value: selectedScreenTypeValue,
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedScreenTypeValue = newValue!;
                                  });
                                },
                                items: <int>[
                                  0, // HD
                                  1, // FHD
                                ].map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value == 0 ? 'HD' : 'FHD'),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  'نوع كرت الشاشة:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedGCTypeValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGCTypeValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'مدمج',
                                  'MX330 2G',
                                  'MX150 2G',
                                  'MX100 2G',
                                  '940MX 2G',
                                  'GTX1660TI 6G',
                                  'GTX1660 4G',
                                  'GTX1060 6G',
                                  'GTX1050 4G',
                                  'RTX3080 8G',
                                  'RTX3070 8G',
                                  'RTX3060 6G',
                                  'RTX3050TI 6G',
                                  'RTX3050 4G',
                                  'RTX3040 4G',
                                  'RTX2060 6G'
                                  // يمكنك إضافة المزيد من الخيارات هنا
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10), // Add margin to the bottom
                          padding: EdgeInsets.all(
                              10), // Add padding to the container
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                                  .withOpacity(0.5), // Reduce border opacity
                            ),
                            borderRadius: BorderRadius.circular(
                                12), // Increase border radius
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.3), // Add a subtle shadow
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                            color: Colors.white, // Add a background color
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  ' حالة الجهاز:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DropdownButton<String>(
                                value: selectedLaptopStateValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedLaptopStateValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'مستعمل',
                                  'جديد',
                                  'اوبن بوكس',
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value == 'مستعمل'
                                        ? 'Old'
                                        : value == 'جديد'
                                            ? 'New'
                                            : 'ObenBox',
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ])),
                  
                ],
              )),
          Padding(
              padding: EdgeInsets.all(25.0), // تعيين الهوامش للجميع
              child: ElevatedButton(
                onPressed: () {
                  print('start');
                  sendDataToApi();
                },
                child: Text(
                  'تقديم البيانات',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      )),
    );
  }
}
