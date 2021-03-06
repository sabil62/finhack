import 'package:finhack/json/bank.dart';
import 'package:finhack/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email =
      TextEditingController(text: "roman_lion@gmail.com");
  TextEditingController date = TextEditingController(text: "08-14-1999");
  TextEditingController password =
      TextEditingController(text: "passwordiswhatbro");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.02),
      body: getProfileBody(),
    );
  }

  Widget getProfileBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.02))
            ]),
            child: Padding(
              padding: EdgeInsets.fromLTRB(65, 62, 65, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: texter(24.0, 1.0, weight: FontWeight.w700),
                      ),
                      Icon(AntDesign.setting)
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: (size.width - 44) * 0.15,
                          height: 200,
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: -2,
                                child: CircularPercentIndicator(
                                  radius: 162.0,
                                  lineWidth: 6.0,
                                  percent: 0.53,
                                  center: new Text("100%"),
                                  progressColor: primary,
                                  circularStrokeCap: CircularStrokeCap.round,
                                ),
                              ),
                              Positioned(
                                top: 11,
                                left: 10.3,
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/profile/profile.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(19.8, 0, 0, 5),
                        child: Container(
                          width: (size.width - 44) * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sabil Shrestha",
                                style:
                                    texter(24.2, 1.0, weight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Credit Score: \$72.00 ",
                                style: texter(13.0, 0.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2, //or bank.length
                          (index) => Container(
                            height: 120,
                            width: (size.width - 200) / 2,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 45),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bank[index]["name"],
                                          style: TextStyle(
                                              fontSize: 11,
                                              color:
                                                  Colors.grey[200], //jpt jugad
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 7.2,
                                        ),
                                        Text(
                                          bank[index]["amount"],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Colors.grey[100], //jpt jugad
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.4),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 49.6,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        border: Border.all(
                                            width: 1, color: Colors.grey[100]),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      child: Center(
                                          child: Text("Update",
                                              style: texter(17.0, 0.9,
                                                  weight: FontWeight.w500))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 65),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: email,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Date of Birth",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: date,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: texter(14.0, 0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  TextField(
                    controller: password,
                    style: texter(17.4, 1.0, weight: FontWeight.w700),
                    cursorColor: black,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                        focusColor: Colors.green),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle texter(fontsize, opaci, {FontWeight weight = FontWeight.w600}) {
    return TextStyle(
        fontSize: fontsize,
        color: opaci == 0.9
            ? Colors.white
            : Colors.black.withOpacity(opaci), //jpt jugad
        fontWeight: weight);
  }
}
