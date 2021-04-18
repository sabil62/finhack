import 'package:finhack/json/budget_indicator.dart';
import 'package:finhack/json/day_month.dart';
import 'package:finhack/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.05),
      body: getBudgetBody(),
    );
  }

  Widget getBudgetBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
            ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(65, 60, 65, 35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                            fontSize: 24.6, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(AntDesign.plus),
                            SizedBox(
                              width: 19,
                            ),
                            Icon(AntDesign.search1)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(months.length, (index) {
                        return Container(
                          width: (size.width - 520) / 6,
                          child: Column(
                            children: [
                              Text(
                                months[index]["label"],
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: Container(
                                    height: 36,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? primary
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: currentIndex == index
                                                ? Colors.pink[500]
                                                : Colors.black
                                                    .withOpacity(0.4)),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Center(
                                      child: Text(
                                        months[index]["day"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: currentIndex == index
                                                ? Colors.grey[100]
                                                : Colors.black
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          //for budget containers
          Column(
            children: List.generate(budgetIndicator.length, (index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(65, 1, 65, 26),
                child: Container(
                  height: 150,
                  width: (size.width - 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(34, 22, 22, 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          budgetIndicator[index]["label"],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.36)),
                        ),
                        Row(
                          children: [
                            Text(
                              budgetIndicator[index]["total_price"],
                              style: TextStyle(
                                  fontSize: 21.4,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.4),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              budgetIndicator[index]["percentage"],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.43)),
                            )
                          ],
                        ),
                        Container(
                          height: 4,
                          width: (size.width - 60) *
                              budgetIndicator[index]["indicator"],
                          decoration: BoxDecoration(
                              color: budgetIndicator[index]["color"],
                              borderRadius: BorderRadius.circular(23)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 26,
          )
        ],
      ),
    );
  }
}
