import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learing_driver_app/core/constants/app_assets.dart';

class GridFeature extends StatelessWidget {
  const GridFeature({super.key});

  @override
  Widget build(BuildContext context) {
    double gridWidth = MediaQuery.of(context).size.width * 0.9;

    return SizedBox(
      width: gridWidth,
      height: gridWidth,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMenuButton(AppAssets.trafficSign, "Biển báo"),
          _buildMenuButton(AppAssets.lightBulb, "Mẹo"),
          _buildMenuButton(AppAssets.warningSign, "Câu điểm liệt"),
          _buildMenuButton(AppAssets.questionMark, "Câu hay sai"),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String assetPath, String title) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SvgPicture.asset(assetPath, fit: BoxFit.contain, width: 60),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
