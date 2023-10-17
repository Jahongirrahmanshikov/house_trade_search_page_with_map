import 'package:flutter/material.dart';
import '../../../../common/styles/app_colors.dart';
import '../search_page.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    required this.search,
  });

  final String search;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  String? search;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      child: SizedBox(
        height: 70,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: AppColors.softGrey,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                onChanged: (value) {
                  controller.search(value);
                },
                autofocus: controller.autoInput,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        controller.autoInput = false;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
