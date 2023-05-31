import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/history_controller.dart';
import '../models/history_model.dart';
import '../utils/colors.dart';
import '../widgets/history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryController historyController = HistoryController();
  List<History> listHistory = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: white));
    HistoryController.init();
    listHistory.addAll(historyController.read("history"));
    listHistory.sort((a, b) {
      return b.dateTime.compareTo(a.dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red1,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: white),
        title: Text(
          "History",
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final item = listHistory.elementAt(index);
          if (index != 0 &&
              (item.dateTime.day ==
                  listHistory.elementAt(index - 1).dateTime.day) &&
              (item.dateTime.month ==
                  listHistory.elementAt(index - 1).dateTime.month) &&
              (item.dateTime.year ==
                  listHistory.elementAt(index - 1).dateTime.year)) {
            return HistoryItem(
              history: item,
              isNewDay: false,
            );
          } else {
            return HistoryItem(
              history: item,
              isNewDay: true,
            );
          }
        },
        itemCount: listHistory.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 0,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
