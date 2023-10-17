import 'package:flutter/material.dart';
import '../../../common/styles/app_colors.dart';

class SearchMap extends StatefulWidget {
  const SearchMap({super.key});

  @override
  State<SearchMap> createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/images/map_map.jpeg", fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    onPressed: () => Navigator.pop<Object?>(context),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
    
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 55,
                            blurRadius: 30,
                          ),
                        ],
                      ),
                      child: SearchBar(
                        trailing: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.keyboard_voice_outlined),
                          ),
                        ],
                        hintText: "Find location",
                        leading: const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(Icons.search),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.white),
                        shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
    
                const SizedBox(height: 330),
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: AppColors.deepBlue50,
                    radius: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_drop_down_circle_sharp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: 
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Location detail",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: AppColors.darkBlue,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.softGrey2,
                                  child: Icon(Icons.location_on_outlined),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      "Jl. Pandanaran, Semarang Tengah, \n Semarang City, Central Java 50241"),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 45),
                  child: InkWell(
                    onTap: () {},
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
                          "Choose Line",
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
          ),
        ],
      ),
    );
  }
}
