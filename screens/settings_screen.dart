import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _notifications = true;
  bool _autoScan = false;
  bool _vibration = true;
  String _selectedLanguage = 'العربية';
  String _selectedTheme = 'تلقائي';

  final List<String> _languages = ['العربية', 'English', 'Français', 'Español'];
  final List<String> _themes = ['تلقائي', 'داكن', 'فاتح'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Center(child: Text('الإعدادات')),
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Directionality(textDirection: TextDirection.rtl,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // إعدادات المظهر
            _buildSectionHeader('المظهر'),
            _buildSettingItem(
              'الوضع الداكن',
              Icons.dark_mode,
              _darkMode,
                  (value) => setState(() => _darkMode = value),
            ),
            _buildLanguageSetting(),
            _buildThemeSetting(),
            SizedBox(height: 20),

            // إعدادات الإشعارات
            _buildSectionHeader('الإشعارات'),
            _buildSettingItem(
              'الإشعارات',
              Icons.notifications,
              _notifications,
                  (value) => setState(() => _notifications = value),
            ),
            _buildSettingItem(
              'الاهتزاز',
              Icons.vibration,
              _vibration,
                  (value) => setState(() => _vibration = value),
            ),
            SizedBox(height: 20),

            // إعدادات المسح
            _buildSectionHeader('المسح التلقائي'),
            _buildSettingItem(
              'المسح التلقائي',
              Icons.autorenew,
              _autoScan,
                  (value) => setState(() => _autoScan = value),
            ),
            _buildScanFrequencySetting(),
            SizedBox(height: 20),

            // إعدادات الحساب
            _buildSectionHeader('الحساب'),
            _buildAccountSetting('معلومات الحساب', Icons.person),
            _buildAccountSetting('خصوصية البيانات', Icons.privacy_tip),
            _buildAccountSetting('نسخ احتياطي', Icons.backup),
            SizedBox(height: 20),

            // إعدادات متقدمة
            _buildSectionHeader('متقدم'),
            _buildAdvancedSetting('سجلات النظام', Icons.bug_report),
            _buildAdvancedSetting('إعادة التعيين', Icons.restart_alt),
            SizedBox(height: 30),

            // أزرار الإجراءات
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue[300],
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon, bool value, Function(bool) onChanged) {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[300]),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue[300],
        ),
      ),
    );
  }

  Widget _buildLanguageSetting() {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(Icons.language, color: Colors.blue[300]),
        title: Text('اللغة', style: TextStyle(color: Colors.white)),
        subtitle: Text(_selectedLanguage, style: TextStyle(color: Colors.grey[400])),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () => _showLanguageDialog(),
      ),
    );
  }

  Widget _buildThemeSetting() {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(Icons.color_lens, color: Colors.blue[300]),
        title: Text('السمة', style: TextStyle(color: Colors.white)),
        subtitle: Text(_selectedTheme, style: TextStyle(color: Colors.grey[400])),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () => _showThemeDialog(),
      ),
    );
  }

  Widget _buildScanFrequencySetting() {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(Icons.schedule, color: Colors.blue[300]),
        title: Text('فترة المسح', style: TextStyle(color: Colors.white)),
        subtitle: Text('كل 24 ساعة', style: TextStyle(color: Colors.grey[400])),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildAccountSetting(String title, IconData icon) {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[300]),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildAdvancedSetting(String title, IconData icon) {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[300]),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {
          if (title == 'إعادة التعيين') {
            _showResetDialog();
          }
        },
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: _saveSettings,
            icon: Icon(Icons.save, size: 20),
            label: Text('حفظ الإعدادات', style: TextStyle(fontSize: 16)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: _resetToDefault,
            icon: Icon(Icons.restore, size: 20),
            label: Text('الإعدادات الافتراضية', style: TextStyle(fontSize: 16)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        title: Text('اختر اللغة', style: TextStyle(color: Colors.white)),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _languages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _languages[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: _selectedLanguage == _languages[index]
                    ? Icon(Icons.check, color: Colors.blue[300])
                    : null,
                onTap: () {
                  setState(() {
                    _selectedLanguage = _languages[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        title: Text('اختر السمة', style: TextStyle(color: Colors.white)),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _themes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _themes[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: _selectedTheme == _themes[index]
                    ? Icon(Icons.check, color: Colors.blue[300])
                    : null,
                onTap: () {
                  setState(() {
                    _selectedTheme = _themes[index];
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey[800],
        title: Text('إعادة التعيين', style: TextStyle(color: Colors.white)),
        content: Text(
          'هل أنت متأكد من أنك تريد إعادة تعيين جميع الإعدادات؟',
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء', style: TextStyle(color: Colors.grey[400])),
          ),
          TextButton(
            onPressed: () {
              _resetToDefault();
              Navigator.pop(context);
            },
            child: Text('تأكيد', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حفظ الإعدادات بنجاح'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _resetToDefault() {
    setState(() {
      _darkMode = true;
      _notifications = true;
      _autoScan = false;
      _vibration = true;
      _selectedLanguage = 'العربية';
      _selectedTheme = 'تلقائي';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم استعادة الإعدادات الافتراضية'),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
