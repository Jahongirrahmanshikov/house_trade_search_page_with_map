import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/search_widget.dart';
import 'controller/controller.dart';
import 'widgets/count_found.dart';

SearchControllerPage controller = SearchControllerPage();

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomAppBar(),
              SearchWidget(search: ""),
              Found(),
            ],
          ),
        ),
      ),
    );
  }
}
