import 'package:flutter/material.dart';
import 'package:learing_driver_app/ui/screens/home_screen/widget/check_skill.dart';
import 'package:learing_driver_app/ui/screens/home_screen/widget/circular_progress.dart';
import 'package:learing_driver_app/ui/screens/home_screen/widget/grid_feature.dart';
import 'package:learing_driver_app/ui/screens/practice_screen/practice_screen.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_app_bar.dart';
import 'package:learing_driver_app/ui/shared_widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Trang chủ"),
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgress(value: 200, size: 100),
                  CheckSkill(status: ExamStatus.needImprovement, onTap: () {}),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PracticeScreen(),
                      ),
                    );
                  },
                  color: Colors.lightGreen,
                  height: 80,
                  width: 180,
                  text: "Ôn tập",
                ),
                SizedBox(width: 16),
                CustomButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text("Thi thử")));
                  },
                  color: Colors.deepOrange,
                  height: 80,
                  width: 180,
                  text: "Thi thử",
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          GridFeature(),
        ],
      ),
    );
  }
}
