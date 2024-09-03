import 'package:bismillah_bisa/pages/absen/absen_page.dart';
import 'package:bismillah_bisa/pages/history/history_page.dart';
import 'package:bismillah_bisa/pages/leave/leave_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _onWillPop(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              color: Color.fromARGB(255, 96, 130, 182).withOpacity(0.7),
            ),
            SafeArea(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AbsenPage(),
                              ),
                            );
                          },
                          icon: const Image(
                            image: AssetImage(
                                'assets/images/attendance-removebg-preview.png'),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Attendance",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeavePage(),
                              ),
                            );
                          },
                          icon: const Image(
                            image: AssetImage(
                                'assets/images/absen-removebg-preview.png'),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Leave / permit",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HistoryPage(),
                              ),
                            );
                          },
                          icon: const Image(
                            image: AssetImage(
                                'assets/images/history-removebg-preview.png'),
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "History",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              "INFO",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            content: const Text("Do you want to exit this application?",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel",
                    style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text("Yes",
                    style: TextStyle(
                        color: Color.fromARGB(255, 96, 130, 182), fontSize: 14)),
              ),
            ],
          ),
        )) ??
        false;
  }
}
