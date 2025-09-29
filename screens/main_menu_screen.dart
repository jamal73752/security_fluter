import 'package:flutter/material.dart';
import 'package:untitled7/screens/settings_screen.dart';
import 'package:untitled7/screens/wifi_scanner_screen.dart';
import 'security_score_screen.dart';
import 'app_permissions_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],

      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],

        title: Center(
          child: Text(
            "Security Guard",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            // color: Colors.blue,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  margin: EdgeInsets.all(5),
                  // width: double.infinity,
                  child: Wrap(
                    spacing: 9,
                    runSpacing: 8,

                    // spacing: double.infinity,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SecurityScoreScreen(),));
                          },
                          padding: EdgeInsets.symmetric(vertical: 20),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.assessment,
                                  color: Colors.red[500],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade400.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "درجة الامان",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "فحص مستوى أمان جهازك",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      

                      Container(
                        margin: EdgeInsets.all(5),

                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AppPermissionsScreen(),));
                          },
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.assessment,
                                  color: Colors.orange[500],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade400.withOpacity(
                                    0.2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "صلاحيات التطبيقات ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "إدارة أذونات التطبيقات",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),

                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => WiFiScannerScreen(),));
                          },
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.wifi,
                                  color: Colors.orange[500],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade400.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                " WiFi ماسح  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "إدارة أذونات التطبيقات",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),

                        child: MaterialButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text( "سيتم تطوير الصفحة لاحقا  "  ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.security,
                                  color: Colors.green[500],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade400.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "كشف التسريب",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "فحص تسريب البيانات",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),

                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => SettingsScreen(),));
                          },
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.grey[400],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "الاعدادات",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "عدادات التطبيق",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(5),

                        child: MaterialButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text( "سيتم تطوير الصفحة لاحقا  "  ),
                                duration: Duration(seconds: 2),
                              ),
                            );

                          },
                          padding: EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minWidth: 170,
                          // color: Colors.red,
                          color: Colors.blueGrey[800],
                          child: Column(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.warning,
                                  color: Colors.purple[400],
                                ),

                                // color: Colors.red,
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade400.withOpacity(
                                    0.2,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "كشف الروت",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "فحص صلاحيات الجذر",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Text("data")
              ],
            ),
          ),
        ),
      ),
    );
  }
}





