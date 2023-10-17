import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../controller/controller.dart';
import '../search_page.dart';
import 'categories.dart';

class FoundVertical extends StatefulWidget {
  const FoundVertical({
    super.key,
    required this.findHouse,
  });

  final List<HouseModel> findHouse;

  @override
  State<FoundVertical> createState() => _FoundVerticalState();
}

class _FoundVerticalState extends State<FoundVertical> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Categories(house: controller.currentCategories),
          Column(
            children: List.generate(
              widget.findHouse.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.softGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            const ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Image(
                                image: AssetImage("assets/images/q.png"),
                                width: 170,
                                height: 170,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: CircleAvatar(
                                backgroundColor: !controller
                                        .isHave(controller.foundHouse[index])
                                    ? Colors.grey[350]
                                    : AppColors.limeGreen,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.like(
                                        controller.foundHouse[index],
                                      );
                                    });
                                  },
                                  icon: Icon(
                                    !controller.isHave(
                                            controller.foundHouse[index])
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    color: !controller.isHave(
                                            controller.foundHouse[index])
                                        ? AppColors.redOrange
                                        : AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 120, left: 20),
                              child: SizedBox(
                                height: 40,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.darkBlue.withOpacity(0.7),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '  ${widget.findHouse[index].category}  ',
                                      style: const TextStyle(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                        letterSpacing: 0.36,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.findHouse[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.36,
                                    ),
                              ),
                              Text(
                                "",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.36,
                                    ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    '${widget.findHouse[index].raiting}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.36,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    widget.findHouse[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.36,
                                          fontFamily: 'Montserrat',
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                children: [
                                  Text(
                                    "\$ ${widget.findHouse[index].price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0.36,
                                          fontFamily: 'Montserrat',
                                        ),
                                  ),
                                  const Text("/month"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
