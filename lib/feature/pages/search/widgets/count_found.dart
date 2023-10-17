import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'found_horizantal.dart';
import '../search_page.dart';
import 'found_vertical.dart';
import 'not_found.dart';

class Found extends StatefulWidget {
  const Found({super.key});

  @override
  State<Found> createState() => _FoundState();
}

class _FoundState extends State<Found> {
  Widget verticalHorizantal = controller.foundHouse.isNotEmpty
      ? FoundVertical(
          findHouse: controller.foundHouse,
        )
      : const NotFound();

  Color vertical = AppColors.black;
  Color horizantal = AppColors.barelGrey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Found ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      controller.foundHouse.length.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      ' estates',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: AppColors.softGrey,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              verticalHorizantal =
                                  controller.foundHouse.isNotEmpty
                                      ? const FoundHorizantal()
                                      : const NotFound();
                              vertical = AppColors.barelGrey;
                              horizantal = AppColors.black;
                            });
                          },
                          icon: Icon(
                            Icons.window_sharp,
                            color: horizantal,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              verticalHorizantal =
                                  controller.foundHouse.isNotEmpty
                                      ? FoundVertical(
                                          findHouse: controller.foundHouse,
                                        )
                                      : const NotFound();
                              vertical = AppColors.black;
                              horizantal = AppColors.barelGrey;
                            });
                          },
                          icon: Icon(
                            Icons.table_rows_rounded,
                            color: vertical,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalHorizantal
      ],
    );
  }
}
