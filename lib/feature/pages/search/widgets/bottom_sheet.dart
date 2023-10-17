import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../search_page.dart';
import 'location_view.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  bool isAll = true;
  bool isHouse = false;
  bool isApartment = false;
  bool isVilla = false;
  bool isCottage = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 60,
                  height: 4,
                  child: ColoredBox(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Color(0xFF242B5C),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.54,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAll = true;
                      isHouse = false;
                      isApartment = false;
                      isVilla = false;
                      isCottage = false;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primary,
                    ),
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Property type',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ChipButton(
                    text: "All",
                    onTap: () => setState(() {
                      isAll = true;
                      isHouse = false;
                      isApartment = false;
                      isVilla = false;
                      isCottage = false;
                    }),
                    isSelected: isAll,
                  ),
                  ChipButton(
                    text: "House",
                    onTap: () => setState(() {
                      isHouse = !isHouse;
                      isAll = false;
                    }),
                    isSelected: isHouse,
                  ),
                  ChipButton(
                    text: "Apartment",
                    onTap: () => setState(() {
                      isApartment = !isApartment;
                      isAll = false;
                    }),
                    isSelected: isApartment,
                  ),
                  ChipButton(
                    text: "Villa",
                    onTap: () => setState(() {
                      isVilla = !isVilla;
                      isAll = false;
                    }),
                    isSelected: isVilla,
                  ),
                  ChipButton(
                    text: "Cottage",
                    onTap: () => setState(() {
                      isCottage = !isCottage;
                      isAll = false;
                    }),
                    isSelected: isCottage,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Location',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapsPage(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.location_on_sharp),
                      title: Text(
                        "Semarang",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      trailing: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Stack(
              children: <Widget>[
                const Center(
                  child: SizedBox(
                    width: 350,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage("assets/images/map.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 115,
                    left: 45,
                  ),
                  child: InkWell(
                    onTap: () {
                      isAll ? controller.filter.add("All") : '';
                      isHouse ? controller.filter.add("House") : '';
                      isApartment ? controller.filter.add("Apartment") : '';
                      isVilla ? controller.filter.add("Villa") : '';
                      isCottage ? controller.filter.add("Cottage") : '';
                      isAll = true;
                      isHouse = false;
                      isApartment = false;
                      isVilla = false;
                      isCottage = false;
                      setState(() {
                        controller.autoInput = false;

                        controller.filterHouse();
                        Navigator.pop(context);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      });
                    },
                    child: Container(
                      width: 278,
                      height: 63,
                      decoration: ShapeDecoration(
                        color: AppColors.limeGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Apply Filter",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChipButton extends StatefulWidget {
  const ChipButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final void Function() onTap;
  final bool isSelected;

  @override
  State<ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            widget.isSelected ? AppColors.darkBlue : AppColors.softGrey2,
          ),
          minimumSize: MaterialStateProperty.all<Size?>(const Size(0, 50)),
        ),
        onPressed: () => setState(() => widget.onTap()),
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: widget.isSelected ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
