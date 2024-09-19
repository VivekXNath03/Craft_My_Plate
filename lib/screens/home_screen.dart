import 'package:app/screens/custom_navbar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _headerSection(context),
                    const SizedBox(height: 20),
                    _promoBanner(context),
                    const SizedBox(height: 20),
                    _startCraftingSection(context),
                    const SizedBox(height: 20),
                    _mealBoxesAndCateringSection(context),
                    const SizedBox(height: 30),
                    _chooseYourPlatterSection(context),
                    const SizedBox(
                        height:
                            100), // Add extra space at the bottom for the nav bar
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mealBoxesAndCateringSection(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Start Crafting",
            style: GoogleFonts.lexend(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(36, 38, 40, 1),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: _serviceCard(
              "Meal Boxes",
              "Min 10 Guests",
              Colors.purple.shade100,
              'assets/images/Mask group.png',
              const Color.fromRGBO(99, 24, 175, 1),
            )),
            const SizedBox(width: 16),
            Expanded(
                child: _serviceCard(
              "Catering",
              "Min 120 Guests",
              const Color.fromRGBO(251, 218, 234, 1),
              'assets/images/Clip path group (1).png',
              const Color.fromRGBO(194, 0, 94, 1),
            )),
          ],
        ),
      ],
    );
  }

  Widget _serviceCard(String title, String subtitle, Color color,
      String imagePath, Color buttonColor) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            blurRadius: 18.29,
            spreadRadius: 0,
            offset: Offset(0, -3.66),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -20,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: buttonColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        color: buttonColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseYourPlatterSection(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose Your Platter",
          style: GoogleFonts.lexend(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(36, 38, 40, 1),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Delivery Box",
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(99, 24, 175, 1),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 16,
                ),
                const Text(
                  "(Min 10 - Max 50)",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Text(
              "More",
              style: GoogleFonts.lexend(
                fontSize: 16,
                color: const Color.fromRGBO(72, 76, 81, 1),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          "Best for small gatherings and house-parties",
          style: GoogleFonts.lexend(
            fontSize: 14,
            color: const Color.fromRGBO(147, 153, 159, 1),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 320,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _deliveryBoxCard(context);
              }),
        )
      ],
    );
  }
}

Widget _deliveryBoxCard(context) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: Container(
      width: 320,
      // height: 450,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(236, 236, 236, 1),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/image45.png',
                  height: 148,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Popular",
                    style: GoogleFonts.lexend(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.vape_free),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Punjabi Special Menu",
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(36, 38, 40, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1,
                  dashColor: Colors.black,
                  dashGapLength: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "6 Categories & 9 Items",
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(99, 24, 175, 1),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "See All",
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(96, 102, 108, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const DottedLine(
                  direction: Axis.horizontal,
                  lineLength: double.infinity,
                  lineThickness: 1,
                  dashColor: Colors.black,
                  dashGapLength: 4,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Text(
                      "Starts at",
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(96, 102, 108, 1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          " ₹299",
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(36, 38, 40, 1),
                          ),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Icon(Icons.person, color: Colors.grey),
                        Text(
                          "10 - 600",
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(96, 102, 108, 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Icon.png',
                      width: 20,
                    ),
                    Text(
                      "₹219 ",
                      style: GoogleFonts.lexend(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(99, 24, 175, 1),
                      ),
                    ),
                    Text(
                      "/ Person ",
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(71, 71, 71, 1),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "↓ 20%",
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "with Dynamic Price for 100 Guests",
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: const Color.fromRGBO(99, 24, 175, 1),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _headerSection(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hi Monica!",
        style: GoogleFonts.lexend(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(99, 24, 175, 1),
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Current Location",
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF7B3FF2)),
                  const SizedBox(width: 4),
                  Text(
                    "Hyderabad",
                    style: GoogleFonts.lexend(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, color: Colors.grey[600]),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF7B3FF2),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "How it works?",
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    color: const Color(0xFF7B3FF2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget _startCraftingSection(context) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Start Crafting",
              style: GoogleFonts.lexend(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 232, 185, 1),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, -3.66),
                blurRadius: 18.29,
                spreadRadius: 0,
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Box!",
                    style: GoogleFonts.lexend(
                      fontSize: 18,
                      color: const Color.fromRGBO(36, 38, 40, 1),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Color.fromRGBO(147, 90, 16, 1),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Min 10 - Max 120",
                        style: GoogleFonts.lexend(
                            fontSize: 14,
                            color: const Color.fromRGBO(147, 90, 16, 1),
                            shadows: [
                              const Shadow(
                                color: Color.fromRGBO(147, 90, 16, 0.2),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(233, 170, 75, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("See All"),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Image.asset('assets/images/Clip path group.png', height: 100),
          ],
        ),
      ),
    ],
  );
}

Widget _promoBanner(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: const LinearGradient(colors: [
        Color.fromRGBO(121, 21, 222, 1),
        Color.fromRGBO(38, 12, 64, 1),
      ]),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enjoy your first order, the taste of our delcicious food!",
                style: GoogleFonts.lexend(
                  fontSize: 16,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "FIRSTPLATE01",
                      style: GoogleFonts.lexend(
                        color: const Color.fromRGBO(246, 215, 152, 1),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Image.asset('assets/images/Layer 2.png', height: 100),
      ],
    ),
  );
}
