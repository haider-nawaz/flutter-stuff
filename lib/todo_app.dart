import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final dates = [];

  void fillDates() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    for (var i = 0; i < 7; i++) {
      //only store the date for example 21,22,23
      dates.add(monday.add(Duration(days: i)).day);
    }
    print(dates);
  }

  @override
  void initState() {
    fillDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 0,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  headerWidget(),
                  const SizedBox(height: 10),
                  Text(
                    "MANAGE YOUR TASKS",
                    style: GoogleFonts.montserrat(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Divider(
              color: Colors.black12,
            ),
            //display dates of current week in a horizontal list, use dates

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final isCurrentDate = dates[index] == DateTime.now().day;
                  return Row(
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        isCurrentDate ? "TODAY" : dates[index].toString(),
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isCurrentDate ? Colors.black : Colors.black26,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "x",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  );
                },
                itemCount: dates.length,
              ),
            ),

            const Divider(
              color: Colors.black12,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  taskWidget(
                      Colors.purple, "MEDIUM", "December Dribble Shot Design"),
                  taskWidget(
                      Colors.yellow, "HIGH", "Meeting with Outsized Client"),
                  taskWidget(
                      Colors.green, "LOW", "Chat Application Meeting Team"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container taskWidget(Color color, String priority, String taskTitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      //height: 200,
      decoration: BoxDecoration(
        color: color.withOpacity(.4),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: GoogleFonts.montserrat(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "01 Dec to 31 Dec",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/man.png",
                      width: 50,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        "assets/man.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Image.asset(
                        "assets/man.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  height: 40,
                  //width: 40,
                  decoration: BoxDecoration(
                    color: priority == "MEDIUM"
                        ? Colors.yellow
                        : priority == "HIGH"
                            ? Colors.red
                            : Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(priority),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(child: Icon(Icons.share)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row headerWidget() {
    return Row(
      children: [
        Image.asset(
          "assets/man.png",
          height: 70,
          width: 70,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.add_circle,
                size: 35,
              ),
              const SizedBox(width: 5),
              Text(
                "Create new Task",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
            ],
          ),
        )
      ],
    );
  }
}
