import 'package:flutter/material.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  final names = [
    "Top Picks",
    "Indoor",
    "Outdoor",
    "New Arrivals",
    "Popular Plants",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          headerwidget(),
          const SizedBox(
            height: 40,
          ),
          bannerWidget(),
          const SizedBox(
            height: 20,
          ),
          searchWidget(),
          const SizedBox(
            height: 20,
          ),
          //create a horizontal listview with the names list
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: index != 0 ? Colors.black : Colors.green,
                          decoration: index == 0
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          decorationColor: Colors.green,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Stack(
            clipBehavior: Clip.none,
            // fit: StackFit.expand,
            children: [
              Container(
                //transform:

                transform: Matrix4.rotationZ(-0.03),

                transformAlignment: Alignment.centerLeft,
                clipBehavior: Clip.antiAlias,
                height: 170,

                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.withOpacity(.5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Air Purifying\nPlants",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$400",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: -70,
                top: -40,
                child: Image.asset(
                  "assets/plant.png",
                  width: 150,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Flexible searchWidget() {
    return Flexible(
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      // offset: const Offset(
                      //     0, 3), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Search",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/scan.png',
                      width: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      // offset: const Offset(
                      //     0, 3), // changes position of shadow
                    ),
                  ]),
              child: Image.asset(
                "assets/filters.png",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row headerwidget() {
    return Row(
      children: [
        Image.asset(
          'assets/logo.png',
          width: 30,
        ),
        const SizedBox(
          width: 30,
        ),
        const Text(
          "Plantify",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.notifications_outlined,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/hamburger.png',
              width: 35,
            ),
          ],
        ),
      ],
    );
  }

  Stack bannerWidget() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            "assets/banner.png",
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "There's a plant\nfor everyone.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Get your 1st plant\n@ %40 off",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
