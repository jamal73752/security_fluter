import 'package:flutter/material.dart';

class AppPermissionsScreen extends StatefulWidget {
  @override
  _AppPermissionsScreenState createState() => _AppPermissionsScreenState();
}

class _AppPermissionsScreenState extends State<AppPermissionsScreen> {
  final List<Map<String, dynamic>> _permissions = [
    {
      'name': 'الكاميرا',
      'icon': Icons.camera_alt,
      'description': 'تُستخدم لمسح QR codes',
      'isGranted': true,
    },
    {
      'name': 'جهات الاتصال',
      'icon': Icons.contacts,
      'description': 'نسخ احتياطي لجهات الاتصال',
      'isGranted': false,
    },
    {
      'name': 'الموقع',
      'icon': Icons.location_on,
      'description': 'فحص أمان الموقع الجغرافي',
      'isGranted': true,
    },
    {
      'name': 'الميكروفون',
      'icon': Icons.mic,
      'description': 'الأوامر الصوتية',
      'isGranted': false,
    },
    {
      'name': 'التخزين',
      'icon': Icons.storage,
      'description': 'وصول الملفات للمسح',
      'isGranted': true,
    },
    {
      'name': 'الإشعارات',
      'icon': Icons.notifications,
      'description': 'إشعارات الأمان',
      'isGranted': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Center(child: Text('صلاحيات التطبيقات')),
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          // قائمة الصلاحيات
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: _permissions.length,
              itemBuilder: (context, index) {
                final permission = _permissions[index];
                return Container(
                  margin: EdgeInsets.only( top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: permission['isGranted']
                              ? Colors.green[800]
                              : Colors.red[800],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(permission['icon'], color: Colors.white, size: 20),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              permission['name'],
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 4),
                            Text(
                              permission['description'],
                              style: TextStyle(color: Colors.grey[400], fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: permission['isGranted'],
                        onChanged: (value) {
                          setState(() {
                            _permissions[index]['isGranted'] = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveTrackColor: Colors.red[300],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),


          Container(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: Icon(Icons.security, size: 20),
                label: Text(
                  'مسح الصلاحيات',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {

                  bool anyGranted = false;
                  for (var p in _permissions){
                    if (p['isGranted']){
                      anyGranted = true;
                      break;
                    }
                  }

                  if (!anyGranted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('لقد تم حذف كل الصلاحيات الصلاحيات '))
                    );
                    return;
                  }


                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.grey[400],
                      title: Center(child: Text('جاري المسح', style: TextStyle(color: Colors.red[800],fontSize: 20,fontWeight: FontWeight.bold))),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.purple[800]),
                          SizedBox(height: 20),
                          Text('جاري فحص صلاحيات التطبيقات...',
                              style: TextStyle(color: Colors.red[300],fontSize: 20,fontWeight:FontWeight.bold )),
                        ],
                      ),
                    ),
                  );


                  Future.delayed(Duration(seconds: 3), () {
                    setState(() {
                      for (var p in _permissions) {
                        p['isGranted'] = false;
                      }
                    });
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('تم مسح كل الصلاحيات')));
                  });
                },

              )
              ,
            ),
          ),
        ],
      ),
    );
  }
}
