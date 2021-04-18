import 'package:finhack/json/stats_json.dart';
import 'package:finhack/themes/colors.dart';
import 'package:finhack/widgets/lineChart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StatsApp extends StatefulWidget {
  @override
  _StatsAppState createState() => _StatsAppState();
}

class _StatsAppState extends State<StatsApp> {
  int monthIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getStatsBody(),
      backgroundColor: Colors.grey.withOpacity(0.05),
    );
  }

  Widget getStatsBody() {
    var size = MediaQuery.of(context).size;
    List expenses = [
      {"icon": Icons.arrow_back, "middle": "Income", "money": "\$7893.50"},
      {"icon": Icons.arrow_forward, "middle": "Expense", "money": "\$4783.45"}
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 3,
                  color: Colors.black.withOpacity(0.03))
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 60, 60, 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Stats",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Icon(
                        AntDesign.search1,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(stats.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              monthIndex = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 340) / 6,
                            child: Column(
                              children: [
                                Text(
                                  stats[index]["year"],
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 40,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: index == monthIndex
                                              ? primary
                                              : Colors.grey[400]),
                                      color: index == monthIndex
                                          ? primary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Text(
                                      stats[index]["month"],
                                      style: TextStyle(
                                          color: index == monthIndex
                                              ? Colors.grey[100]
                                              : Colors.black.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 72),
            child: Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Net Balance",
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.4)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "\$2560.90",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                    ),
                    Container(
                      height: 250,
                      child: LineChartOurs(),
                    )
                  ],
                ),
              ),
            ),
          ),
          //fds,
          SizedBox(
            height: 10,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  height: 170,
                  width: (size.width - 160) / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 22, 10, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: expenses[index]["middle"] == "Income"
                                  ? blue
                                  : primary),
                          child: Icon(
                            expenses[index]["icon"],
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                expenses[index]["middle"],
                                style: TextStyle(
                                    fontSize: 14.6,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(expenses[index]["money"],
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
          SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }
}
