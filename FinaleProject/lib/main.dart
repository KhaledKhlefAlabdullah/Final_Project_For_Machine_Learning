import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_test/Functions.dart';
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
  double selectedCoreIValue = 3.0; // تعيين القيمة الافتراضية إلى 3
  double selectedGenerationValue = 1.0;
  double selectedFirstHDDTypeValue = 0.5;
  double selectedFirstHDDSizeValue = 256.0;
  double selectedSecondHDDTypeValue = 0.0;
  double selectedSecondHDDSizeValue = 0.0;
  double selectedRAMSizeValue = 4.0;
  double selectedBatteryLifeValue = 1.0;
  double selectedScreenSizeValue = 14.0;
  double selectedScreenTypeValue = 0.5;
  String selectedGCTypeValue = "مدمج";
  String selectedLaptopStateValue = 'Old';

  // ignore: non_constant_identifier_names
  data(coreI, Gen, FHT, FHS, SDT, SHS, RAM, BatLife,
      SCSize, SCType, GPU, LaptopState) async {
    try {
      final response =
          await http.post(Uri.http('127.0.0.1:8000', '/get_prediction', {
        "coreI": "$coreI",
        "generation": "$Gen",
        "firstHDDType": "$FHT",
        "firstHDDSize": "$FHS",
        "secondHDDType": "$SDT",
        "secondHDDSize": "$SHS",
        "ramSize": "$RAM",
        "batteryLife": "$BatLife",
        "screenSize": "$SCSize",
        "screenType": "$SCType",
        "GPU": "$GPU",
        "laptopState": "$LaptopState"
      }));

      showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('التوقع', textDirection: TextDirection.rtl),
      content: Text('التوقع هو: ${response.body.toString()}\$', textDirection: TextDirection.rtl),
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

        
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Text('خطأ'),
              content: Text('هنالك خطأ بالاتصال بقاعدة البيانات حاول مرة أخرى',
                  textDirection: TextDirection.rtl),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('موافق'),
                ),
              ],
            ),
          );
        },
      );
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
                              title: Text('المعالج من فئة انتل:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedCoreIValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedCoreIValue = newValue!;
                                });
                              },
                              items: <double>[3.0, 5.0, 7.0, 9.0]
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
                              title: Text('الجيل:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedGenerationValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedGenerationValue = newValue!;
                                });
                              },
                              items: <double>[
                                1.0,
                                2.0,
                                3.0,
                                4.0,
                                6.0,
                                7.0,
                                8.0,
                                9.0,
                                10.0,
                                11.0,
                                12.0,
                                13.0
                              ].map((double value) {
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
                              title: Text('نوع الهارد الأول:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedFirstHDDTypeValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedFirstHDDTypeValue = newValue!;
                                });
                              },
                              items: <double>[0.5, 1.0].map((double value) {
                                return DropdownMenuItem<double>(
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
                              title: Text('حجم الهارد الأول:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedFirstHDDSizeValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedFirstHDDSizeValue = newValue!;
                                });
                              },
                              items: <double>[256.0, 512.0, 1000.0]
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
                              title: Text('نوع الهارد الثاني:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedSecondHDDTypeValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedSecondHDDTypeValue = newValue!;
                                });
                              },
                              items:
                                  <double>[0.0, 0.5, 1.0].map((double value) {
                                return DropdownMenuItem<double>(
                                  value: value,
                                  child: Text(
                                    value == 0
                                        ? 'NONE'
                                        : (value == 0.5 ? 'HDD' : 'SSD'),
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
                              title: Text('حجم الهارد الثاني:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DropdownButton<double>(
                              value: selectedSecondHDDSizeValue,
                              onChanged: (double? newValue) {
                                setState(() {
                                  selectedSecondHDDSizeValue = newValue!;
                                });
                              },
                              items: <double>[0.0, 256.0, 512.0, 1000.0]
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
                              DropdownButton<double>(
                                value: selectedRAMSizeValue,
                                onChanged: (double? newValue) {
                                  setState(() {
                                    selectedRAMSizeValue = newValue!;
                                  });
                                },
                                items: <double>[4.0, 8.0, 16.0, 32.0, 64.0]
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
                                title: Text(' مدة عمل البطارية بالساعات:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              DropdownButton<double>(
                                value: selectedBatteryLifeValue,
                                onChanged: (double? newValue) {
                                  setState(() {
                                    selectedBatteryLifeValue = newValue!;
                                  });
                                },
                                items: <double>[1.0, 2.0, 4.0, 6.0, 8.0]
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
                              DropdownButton<double>(
                                value: selectedScreenTypeValue,
                                onChanged: (double? newValue) {
                                  setState(() {
                                    selectedScreenTypeValue = newValue!;
                                  });
                                },
                                items: <double>[
                                  0.5, // HD
                                  1.0, // FHD
                                ].map((double value) {
                                  return DropdownMenuItem<double>(
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
                  //sendDataToApi();
                  
                  data(
                      selectedCoreIValue,
                      selectedGenerationValue,
                      selectedFirstHDDTypeValue,
                      selectedFirstHDDSizeValue,
                      selectedSecondHDDTypeValue,
                      selectedSecondHDDSizeValue,
                      selectedRAMSizeValue,
                      selectedBatteryLifeValue,
                      selectedScreenSizeValue,
                      selectedScreenTypeValue,
                      selectedGCTypeValue,
                      selectedLaptopStateValue);

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
