import 'package:flutter/material.dart';

class WiFiScannerScreen extends StatefulWidget {
  @override
  _WiFiScannerScreenState createState() => _WiFiScannerScreenState();
}


    class _WiFiScannerScreenState extends State<WiFiScannerScreen> {
    // bool _isScanning = false;
    // List<WiFiNetwork> _networks = [];
    // int _selectedTab = 0; // 0: الشبكات, 1: التحليل


    @override
    Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.blueGrey[900],
    appBar: AppBar(
    title: Center(child: Text('ماسح WiFi')),
    backgroundColor: Colors.blueGrey[800],
    ),
    body: Column(
    children: [
    // تبويبات
    _buildTabs(),
    SizedBox(height: 10),

    // زر المسح
    // if (_selectedTab == 0) _buildScanButton(),

    // المحتوى
    // Expanded(
    //   child: _selectedTab == 0 ? _buildNetworksList() : _buildAnalysis(),
    // ),
    ],
    ),
    );
    }
    }

//
// class WiFiScannerScreen extends StatefulWidget {
//   @override
//   _WiFiScannerScreenState createState() => _WiFiScannerScreenState();
// }
//
// class _WiFiScannerScreenState extends State<WiFiScannerScreen> {
//   bool _isScanning = false;
//   List<WiFiNetwork> _networks = [];
//   int _selectedTab = 0; // 0: الشبكات, 1: التحليل
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: Text('ماسح WiFi'),
//         backgroundColor: Colors.blueGrey[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Column(
//         children: [
//           // تبويبات
//           _buildTabs(),
//           SizedBox(height: 10),
//
//           // زر المسح
//           if (_selectedTab == 0) _buildScanButton(),
//
//           // المحتوى
//           Expanded(
//             child: _selectedTab == 0 ? _buildNetworksList() : _buildAnalysis(),
//           ),
//         ],
//       ),
//     );
//   }
//
    Widget _buildTabs() {
    return Container(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(

    color: Colors.blueGrey[800],
    borderRadius: BorderRadius.circular(12),
    ),
    child: Row(

    children: [
    Expanded(
    child: MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    onPressed: () {}, child: Text("الشبكات"),color: Colors.blue,),
    ),
    Expanded(
    child: MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    onPressed: () {}, child: Text("التحليل"),color: Colors.blue,),
    ),
    ],
    ),
    );
    }

//
//   Widget _buildTabItem(String title, int index) {
//     bool isSelected = _selectedTab == index;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedTab = index;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue[600] : Colors.transparent,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScanButton() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: ElevatedButton.icon(
//           onPressed: _isScanning ? null : _startScan,
//           icon: _isScanning
//               ? SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               color: Colors.white,
//             ),
//           )
//               : Icon(Icons.wifi_find, size: 20),
//           label: Text(
//             _isScanning ? 'جاري المسح...' : 'بدء مسح الشبكات',
//             style: TextStyle(fontSize: 16),
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue[600],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetworksList() {
//     if (_isScanning) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(color: Colors.blue[300]),
//             SizedBox(height: 20),
//             Text(
//               'جاري البحث عن الشبكات...',
//               style: TextStyle(color: Colors.grey[400], fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'قد يستغرق هذا بضع ثوانٍ',
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (_networks.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.wifi_off, size: 80, color: Colors.grey[600]),
//             SizedBox(height: 20),
//             Text(
//               'لم يتم العثور على شبكات',
//               style: TextStyle(color: Colors.grey[400], fontSize: 16),
//             ),
//             Text(
//               'اضغط على "بدء مسح الشبكات" للبحث',
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ListView.builder(
//       padding: EdgeInsets.all(16),
//       itemCount: _networks.length,
//       itemBuilder: (context, index) {
//         return _buildNetworkItem(_networks[index]);
//       },
//     );
//   }
//
//   Widget _buildNetworkItem(WiFiNetwork network) {
//     Color securityColor = network.securityLevel == 'آمن'
//         ? Colors.green
//         : network.securityLevel == 'تحذير'
//         ? Colors.orange
//         : Colors.red;
//
//     return Card(
//       color: Colors.blueGrey[800],
//       margin: EdgeInsets.only(bottom: 10),
//       child: ListTile(
//         leading: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.wifi, color: _getSignalColor(network.strength)),
//             Text(
//               '${network.strength}%',
//               style: TextStyle(color: Colors.grey[400], fontSize: 10),
//             ),
//           ],
//         ),
//         title: Text(
//           network.name,
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('قوة الإشارة: ${network.strength}%',
//                 style: TextStyle(color: Colors.grey[400], fontSize: 12)),
//             Text('الأمان: ${network.securityLevel}',
//                 style: TextStyle(color: securityColor, fontSize: 12)),
//           ],
//         ),
//         trailing: Container(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: securityColor.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: securityColor),
//           ),
//           child: Text(
//             network.securityLevel,
//             style: TextStyle(color: securityColor, fontSize: 10),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAnalysis() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'تحليل أمان الشبكة',
//             style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//
//           _buildAnalysisItem('شبكات آمنة', _networks.where((n) => n.securityLevel == 'آمن').length, Colors.green),
//           _buildAnalysisItem('شبكات تحذير', _networks.where((n) => n.securityLevel == 'تحذير').length, Colors.orange),
//           _buildAnalysisItem('شبكات خطيرة', _networks.where((n) => n.securityLevel == 'خطير').length, Colors.red),
//
//           SizedBox(height: 30),
//           Divider(color: Colors.grey[700]),
//           SizedBox(height: 20),
//
//           Text(
//             'توصيات الأمان:',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//
//           _buildRecommendation('تجنب الشبكات المفتوحة', Icons.warning),
//           _buildRecommendation('استخدم VPN للشبكات العامة', Icons.vpn_lock),
//           _buildRecommendation('غير كلمة مرور الراوتر', Icons.password),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAnalysisItem(String title, int count, Color color) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.blueGrey[800],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.circle,
//             ),
//           ),
//           SizedBox(width: 10),
//           Text(title, style: TextStyle(color: Colors.white)),
//           Spacer(),
//           Text(count.toString(), style: TextStyle(color: color, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRecommendation(String text, IconData icon) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue[300], size: 20),
//       title: Text(text, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
//       dense: true,
//     );
//   }
//
//   Color _getSignalColor(int strength) {
//     if (strength >= 70) return Colors.green;
//     if (strength >= 40) return Colors.orange;
//     return Colors.red;
//   }
//
//   void _startScan() async {
//     setState(() {
//       _isScanning = true;
//       _networks = [];
//     });
//
//     // محاكاة المسح
//     await Future.delayed(Duration(seconds: 3));
//
//     setState(() {
//       _isScanning = false;
//       _networks = [
//         WiFiNetwork('Home-WiFi', 95, 'آمن'),
//         WiFiNetwork('Ali_Network', 80, 'آمن'),
//         WiFiNetwork('Public-Free-WiFi', 75, 'خطير'),
//         WiFiNetwork('STC-WiFi', 60, 'تحذير'),
//         WiFiNetwork('Mobily-5G', 85, 'آمن'),
//         WiFiNetwork('CoffeeShop', 50, 'خطير'),
//       ];
//     });
//   }
// }
//
// class WiFiNetwork {
//   final String name;
//   final int strength;
//   final String securityLevel;
//
//   WiFiNetwork(this.name, this.strength, this.securityLevel);
// }

  //   return Scaffold(
  //     backgroundColor: Colors.blueGrey[900],
  //     appBar: AppBar(
  //       title: Text('ماسح WiFi'),
  //       backgroundColor: Colors.blueGrey[800],
  //       leading: IconButton(
  //         icon: Icon(Icons.arrow_back),
  //         onPressed: () => Navigator.pop(context),
  //       ),
  //     ),
  //     body: Column(
  //       children: [
  //         // تبويبات
  //         _buildTabs(),
  //         SizedBox(height: 10),
  //
  //         // زر المسح
  //         if (_selectedTab == 0) _buildScanButton(),
  //
  //         // المحتوى
  //         Expanded(
  //           child: _selectedTab == 0 ? _buildNetworksList() : _buildAnalysis(),
  //         ),
  //       ],
  //     ),
  //   );
  // }
//
// Widget _buildTabs() {
//   return Container(
//
//     margin: EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: Colors.blueGrey[800],
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Row(
//       children: [
//         Expanded(
//           child: _buildTabItem('0', 0),
//         ),
//         Expanded(
//           child: _buildTabItem('1',1),
//         ),
//       ],
//     ),
//   );
// }
//
//
//   Widget _buildTabItem(String title, int index) {
//     bool isSelected = _selectedTab == index;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedTab = index;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue[600] : Colors.transparent,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Text(
//           title,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScanButton() {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: ElevatedButton.icon(
//           onPressed: _isScanning ? null : _startScan,
//           icon: _isScanning
//               ? SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               color: Colors.white,
//             ),
//           )
//               : Icon(Icons.wifi_find, size: 20),
//           label: Text(
//             _isScanning ? 'جاري المسح...' : 'بدء مسح الشبكات',
//             style: TextStyle(fontSize: 16),
//           ),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue[600],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildNetworksList() {
//     if (_isScanning) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(color: Colors.blue[300]),
//             SizedBox(height: 20),
//             Text(
//               'جاري البحث عن الشبكات...',
//               style: TextStyle(color: Colors.grey[400], fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'قد يستغرق هذا بضع ثوانٍ',
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (_networks.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.wifi_off, size: 80, color: Colors.grey[600]),
//             SizedBox(height: 20),
//             Text(
//               'لم يتم العثور على شبكات',
//               style: TextStyle(color: Colors.grey[400], fontSize: 16),
//             ),
//             Text(
//               'اضغط على "بدء مسح الشبكات" للبحث',
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//       );
//     }
//
//     return ListView.builder(
//       padding: EdgeInsets.all(16),
//       itemCount: _networks.length,
//       itemBuilder: (context, index) {
//         return _buildNetworkItem(_networks[index]);
//       },
//     );
//   }
//
//   Widget _buildNetworkItem(WiFiNetwork network) {
//     Color securityColor = network.securityLevel == 'آمن'
//         ? Colors.green
//         : network.securityLevel == 'تحذير'
//         ? Colors.orange
//         : Colors.red;
//
//     return Card(
//       color: Colors.blueGrey[800],
//       margin: EdgeInsets.only(bottom: 10),
//       child: ListTile(
//         leading: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.wifi, color: _getSignalColor(network.strength)),
//             Text(
//               '${network.strength}%',
//               style: TextStyle(color: Colors.grey[400], fontSize: 10),
//             ),
//           ],
//         ),
//         title: Text(
//           network.name,
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('قوة الإشارة: ${network.strength}%',
//                 style: TextStyle(color: Colors.grey[400], fontSize: 12)),
//             Text('الأمان: ${network.securityLevel}',
//                 style: TextStyle(color: securityColor, fontSize: 12)),
//           ],
//         ),
//         trailing: Container(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: securityColor.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: securityColor),
//           ),
//           child: Text(
//             network.securityLevel,
//             style: TextStyle(color: securityColor, fontSize: 10),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAnalysis() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'تحليل أمان الشبكة',
//             style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//
//           _buildAnalysisItem('شبكات آمنة', _networks.where((n) => n.securityLevel == 'آمن').length, Colors.green),
//           _buildAnalysisItem('شبكات تحذير', _networks.where((n) => n.securityLevel == 'تحذير').length, Colors.orange),
//           _buildAnalysisItem('شبكات خطيرة', _networks.where((n) => n.securityLevel == 'خطير').length, Colors.red),
//
//           SizedBox(height: 30),
//           Divider(color: Colors.grey[700]),
//           SizedBox(height: 20),
//
//           Text(
//             'توصيات الأمان:',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//
//           _buildRecommendation('تجنب الشبكات المفتوحة', Icons.warning),
//           _buildRecommendation('استخدم VPN للشبكات العامة', Icons.vpn_lock),
//           _buildRecommendation('غير كلمة مرور الراوتر', Icons.password),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAnalysisItem(String title, int count, Color color) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.blueGrey[800],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 10,
//             height: 10,
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.circle,
//             ),
//           ),
//           SizedBox(width: 10),
//           Text(title, style: TextStyle(color: Colors.white)),
//           Spacer(),
//           Text(count.toString(), style: TextStyle(color: color, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildRecommendation(String text, IconData icon) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue[300], size: 20),
//       title: Text(text, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
//       dense: true,
//     );
//   }
//
//   Color _getSignalColor(int strength) {
//     if (strength >= 70) return Colors.green;
//     if (strength >= 40) return Colors.orange;
//     return Colors.red;
//   }
//
//   void _startScan() async {
//     setState(() {
//       _isScanning = true;
//       _networks = [];
//     });
//
//     // محاكاة المسح
//     await Future.delayed(Duration(seconds: 3));
//
//     setState(() {
//       _isScanning = false;
//       _networks = [
//         WiFiNetwork('Home-WiFi', 95, 'آمن'),
//         WiFiNetwork('Ali_Network', 80, 'آمن'),
//         WiFiNetwork('Public-Free-WiFi', 75, 'خطير'),
//         WiFiNetwork('STC-WiFi', 60, 'تحذير'),
//         WiFiNetwork('Mobily-5G', 85, 'آمن'),
//         WiFiNetwork('CoffeeShop', 50, 'خطير'),
//       ];
//     });
//   }
// }
//
// class WiFiNetwork {
//   final String name;
//   final int strength;
//   final String securityLevel;
//
//   WiFiNetwork(this.name, this.strength, this.securityLevel);
// }
