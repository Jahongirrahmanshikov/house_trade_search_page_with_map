import '../../../../common/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../search_page.dart';

class FoundHorizantal extends StatefulWidget {
  const FoundHorizantal({super.key});

  @override
  State<FoundHorizantal> createState() => _FoundHorizantalState();
}

class _FoundHorizantalState extends State<FoundHorizantal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 200 / 300,
          crossAxisCount: 2,
        ),
        itemCount: controller.foundHouse.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 400,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  color: AppColors.softGrey,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 180,
                          child: Stack(
                            children: [
                              const ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/q.png"),
                                  width: 170,
                                  height: 170,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 110,
                                  top: 5,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: controller
                                          .isHave(controller.foundHouse[index])
                                      ? AppColors.limeGreen
                                      : Colors.grey[350],
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
                                padding: const EdgeInsets.only(
                                  top: 130,
                                  left: 55,
                                ),
                                child: SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                      color: Color(0xAF1F4C6B),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          ' \$ ${controller.foundHouse[index].price}',
                                          style: const TextStyle(
                                            color: Color(0xFFF5F4F7),
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                            letterSpacing: 0.36,
                                          ),
                                        ),
                                        const Text(
                                          '/month',
                                          style: TextStyle(
                                            color: Color(0xFFF5F4F7),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            height: 0.28,
                                            letterSpacing: 0.18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          ' ${controller.foundHouse[index].name}',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    height: 2.5,
                                  ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              controller.foundHouse[index].raiting.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Icon(
                              Icons.location_on_sharp,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            Flexible(
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                controller.foundHouse[index].address.toString(),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
