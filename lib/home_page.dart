import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/utils/colors.dart';
import 'package:ui_test/utils/strings.dart';
import 'package:ui_test/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth >= 850;
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.06),
            child: AppBar(
              backgroundColor: blackColor,
              centerTitle: false,
              title: Text(appName, style: TextStyle(color: whiteColor)),
              actions: [
                Center(child: Text(trailExpires, style: TextStyle(color: whiteColor))),
                SizedBox(width: 10),
                const Icon(Icons.verified, color: Colors.blueAccent),
                SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.blueAccent,
                  child: Center(child: Icon(Icons.add, color: whiteColor, size: 20)),
                ),
                SizedBox(width: 10),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.lightGreen, shape: BoxShape.circle),

                  child: Center(child: Text("G", style: TextStyle(color: whiteColor))),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          //    drawer: const Drawer(child: SideMenu()),
          body: Container(
            color: whiteColor,
            child: Row(
              children: [
                if (isDesktop) const SideMenu(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(hello, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    Icon(Icons.arrow_drop_down, size: 18),
                                  ],
                                ),
                                Text(
                                  emailText,
                                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.060),
                        Row(
                          children: [
                            Expanded(child: _invoiceCard('Purchase Invoice', 90, context)),
                            const SizedBox(width: 16),
                            Expanded(child: _invoiceCard('Sales Invoice', 0, context)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Chart area
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade100, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade100, width: 1),
                                  color: Colors.grey.shade50,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Top Selling Product', style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,

                                    child: DChartBarO(
                                      groupList: [
                                        OrdinalGroup(
                                          id: '1',
                                          data: [
                                            OrdinalData(domain: 'Mon', measure: 2),
                                            OrdinalData(domain: 'Tue', measure: 6),
                                            OrdinalData(domain: 'Wed', measure: 3),
                                            OrdinalData(domain: 'Thu', measure: 7),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Use a chart widget like BarChart from fl_chart
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Bottom buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade100, width: 1),
                                color: Colors.grey.shade50,
                              ),
                              child: Padding(padding: const EdgeInsets.all(8.0), child: Text("VIEW SALES HISTORY")),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade100, width: 1),
                                color: Colors.grey.shade50,
                              ),
                              child: Padding(padding: const EdgeInsets.all(8.0), child: Text("VIEW PURCHASE HISTORY")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _invoiceCard(String title, double amount, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      height: MediaQuery.of(context).size.height * 0.33,
      // padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: MediaQuery.of(context).size.width * .04,
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                    child: Icon(Icons.add, size: 14, color: whiteColor),
                  ),
                  SizedBox(width: 6),
                  Text(newText),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.only(left: 20.0, right: 20), child: Text("Total Unpaid Invoices 0.00 ")),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.015,
              color: Colors.grey.shade100,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,

            child: Row(
              children: [
                Expanded(child: Center(child: Text("\$ $amount L", style: const TextStyle(fontSize: 24)))),
                Container(color: Colors.grey.shade100, width: 3, height: MediaQuery.of(context).size.height * 0.10),
                SizedBox(width: 10),
                Expanded(child: Text("\$ $amount L", style: const TextStyle(fontSize: 24))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
