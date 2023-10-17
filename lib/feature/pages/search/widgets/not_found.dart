import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.softGrey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 30,
                  blurRadius: 60,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.limeGreen,
              child: Text(
                "!",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            "Search Not Found",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w800,
                  height: 2,
                ),
          ),
          Text(
            'Sorry, we can`t find the real estates you are looking \n for. Maybe, a little spelling mistake?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
