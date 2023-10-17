
import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../search_page.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.house});
  final List<String> house;
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    if (widget.house.isEmpty) {
      return const SizedBox();
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.house.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: AppColors.softGrey2,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton.filled(
                          onPressed: () {
                            controller.removeCategory(widget.house[index]);
                            // controller.filterHouse();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.close),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.limeGreen),
                          ),
                        ),
                      ),
                      Text("  ${widget.house[index]}   "),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
