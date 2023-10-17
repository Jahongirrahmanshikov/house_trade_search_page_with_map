import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Search Result",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              height: 2,
            ),
      ),
      leading: CircleAvatar(
        backgroundColor: AppColors.softGrey,
        radius: 25,
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.softGrey,
          radius: 30,
          child: IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const BottomSheetWidget();
                },
              );
            },
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
