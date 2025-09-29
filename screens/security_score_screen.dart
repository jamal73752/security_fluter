import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SecurityScoreScreen extends StatefulWidget {

  @override
  State<SecurityScoreScreen> createState() => _SecurityScoreScreenState();
}

class _SecurityScoreScreenState extends State<SecurityScoreScreen> {

  double m=0.90;


  String ?f;

  @override

  Widget build(BuildContext context) {

    if(m==0.82){
     f="جهازك في حالة جيدة";
    }
    else if(m==0.90){
      f="جهازك في حالة ممتازة";
    }
    else if(m==0.50){
      f="جهازك في حالة ضعيفة";
    };
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Center(child: Text('درجة الأمان',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ) ,)),
        backgroundColor: Colors.blueGrey[800],


      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [

            ScoreCircle(),
            SizedBox(height: 30),


            ScoreText(),
            SizedBox(height: 30),

            Expanded(child: RecommendationItem()),


            ImproveButton( context),
          ],
        ),
      ),
    );
  }

  Widget ScoreCircle() {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: m),
        duration: Duration(seconds: 2),
        builder: (context, value, _) {
          return
            CircularPercentIndicator(
              radius: 100,
              lineWidth: 5,
              percent: value,
              center: Text("${(value * 100).toInt()}%\n ",style: TextStyle(fontSize: 20),),
              progressColor: Colors.green,
              circularStrokeCap: CircularStrokeCap.round,
              animation: true,

            );


        },
      ),
    );
  }

  Widget ScoreText() {
    return Column(
      children: [
     FutureBuilder(future: Future.delayed(Duration(seconds:3)), builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.done){
         return  Text(
           ' $f',
           style: TextStyle(color: Colors.white, fontSize: 20),
         );

       }
       else {
         return Text(" ..... يتم فحص حالة الجهاز ");
       }


     },),

        SizedBox(height: 8),
        Text(
          'بعض النقاط تحتاج التحسين',
          style: TextStyle(color: Colors.grey[400], fontSize: 16),
        ),
      ],
    );
  }

  Widget RecommendationItem() {
    return Column(
      spacing: 15,
      children: [
        Container(
          width: 350,
          margin: EdgeInsets.only(top: 10,left: 4),
          padding: EdgeInsets.all(5),

          // color: Colors.blueGrey[800],
          decoration: BoxDecoration(

           boxShadow:[ BoxShadow(blurRadius: 8)],
            color: Colors.blueGrey[800],
            border: Border.all(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            spacing: 73,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.update, color: Colors.red),
              ),
              Text(
                "تحديث النظام",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 75,

                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red),
                ),
                child: Center(
                  child: Text(
                    "مطلوب ",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          margin: EdgeInsets.only(top: 8,left: 4),
          padding: EdgeInsets.all(5),

          // color: Colors.blueGrey[800],
          decoration: BoxDecoration(

            boxShadow:[ BoxShadow(blurRadius: 8)],
            color: Colors.blueGrey[800],
            border: Border.all(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            spacing: 75,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:Colors.orange.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.wifi, color: Colors.orange),
              ),
              Text(
                "فحص الشبكة",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 75,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange),
                ),
                child: Center(
                  child: Text(
                    "مستحسن ",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          margin: EdgeInsets.only(top: 7,left: 4),
          padding: EdgeInsets.all(5),

          // color: Colors.blueGrey[800],
          decoration: BoxDecoration(

            boxShadow:[ BoxShadow(blurRadius: 8)],
            color: Colors.blueGrey[800],
            border: Border.all(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            spacing: 60,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.reviews, color: Colors.green),
              ),
              Text(
                "مراجعة الصلاحيات",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
width: 75,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green),
                ),
                child: Center(
                  child: Text(
                    "مهم ",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          margin: EdgeInsets.only(top: 10,left: 4),
          padding: EdgeInsets.all(5),

          // color: Colors.blueGrey[800],
          decoration: BoxDecoration(

            boxShadow:[ BoxShadow(blurRadius: 8)],
            color: Colors.blueGrey[800],
            border: Border.all(color: Colors.blueGrey.shade100),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            spacing: 73,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.update, color: Colors.red),
              ),
              Text(
                "تحديث النظام",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
              width: 75,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.indigoAccent.shade700),
                ),
                child: Center(
                  child: Text(
                    "مطلوب ",
                    style: TextStyle(color: Colors.red, fontSize: 12,
                    fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ImproveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( "سيتم تطوير زر التحسين لاحقا  "  ),
              duration: Duration(seconds: 2),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'تحسين الأمان تلقائياً',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
