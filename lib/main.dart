import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vijay Tyagi Portfolio",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0b1120),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final ScrollController _scrollController = ScrollController();

final GlobalKey aboutKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey projectKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 800;

void scrollTo(GlobalKey key) {
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOut,
  );
}

Widget navItem(String text, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text, style: const TextStyle(color: Colors.white70)),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Vijay Tyagi"),
        actions: mobile
            ? []
            : [
          navItem("About", () => scrollTo(aboutKey)),
          navItem("Experience", () => scrollTo(experienceKey)),
          navItem("Projects", () => scrollTo(projectKey)),
          navItem("Contact", () => scrollTo(contactKey)),
          const SizedBox(width: 20)
        ],
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [

            /// 🔥 HERO SECTION
            Container(
              key: aboutKey,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                color: const Color(0xff111827),
                borderRadius: BorderRadius.circular(25),
              ),
              child: mobile
                  ? Column(children: [
                heroText(),
                const SizedBox(height: 30),
                heroCircle(),
              ])
                  : Row(
                children: [
                  Expanded(child: heroText()),
                  heroCircle(),
                ],
              ),
            ),
            SizedBox(height: 15,),

            /// 🔧 SKILLS
            sectionTitle("Tech Stack & Capabilities"),
            SizedBox(height: 20,),
            wrapSkills(),
            /// 💼 EXPERIENCE
            Column(
              key: experienceKey,
              children: [
                SizedBox(height: 30,),
                sectionTitle("Experience",),
                SizedBox(height: 15,),
                experienceGrid(context),
              ],
            ),
            /// Project
           Column(
             key: projectKey,
             children: [
               SizedBox(height: 5,),
               sectionTitle("Project"),
               projectGrid(context),
             ],
           ),

            sectionTitle("Contact"),
            contactSection(),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }

  /// 🔹 NAV ITEM
  Widget navItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  /// 🔥 HERO TEXT
  Widget heroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        chip("Flutter Developer • 2+ years"),

        const SizedBox(height: 20),

        const Text(
          "Building production-grade",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),

        const Text(
          "Flutter apps at scale",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent),
        ),

        const SizedBox(height: 20),

        const Text(
          "I build scalable Flutter apps with clean architecture, APIs, Firebase and real-time features.",
          style: TextStyle(color: Colors.white70),
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            button("View Projects"),
            const SizedBox(width: 10),
            outlineButton("Download CV"),
          ],
        ),

        const SizedBox(height: 20),

      ],
    );
  }

  /// 🔵 RIGHT CIRCLE
  Widget heroCircle() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.green],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xff111827),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Flutter'),
                Text('Developer')
              ],
            )
          ),
        ),
      ),
    );
  }

  /// 🔘 CHIP
  Widget chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }

  /// 🔘 BUTTON
  Widget button(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
      ),
      child: Text(text),
    );
  }

  Widget outlineButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(text),
    );
  }

  /// 📌 SECTION TITLE
  Widget sectionTitle(String text) {
  return Padding(
  padding: const EdgeInsets.only(left: 20, right: 20),
  child: Align(
  alignment: Alignment.centerLeft,
  child: Text(
  text,
  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  ),
  ),
  );
  }

  /// 🧠 SKILLS
  Widget wrapSkills() {
    final List<String> skills = [
      "Dart",
      "C",
      "Flutter",
      "GetX",
      "Riverpod",
      "Firebase Authentication",
      "Push Notifications",
      "Google Cloud APIs",
      "Firebase Realtime DB",
      "Sqflite",
      "Realm",
      "Stripe",
      "Razorpay",
      "ZegoCloud",
      "Agora SDK",
      "Real-time Chat",
      "Call Notifications",
      "Message Notifications",
      "Google Maps",
      "Face Detection",
      "Google Drive API",
      "iCloud",
      "REST API Integration",
      "Library Customization",
      "App Deployment",
      "Android Studio",
      "VS Code",
      "Postman",
      "Git",
    ];

  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Wrap(
  spacing: 10,
  runSpacing: 10,
  children: skills.map((e) => chip(e)).toList(),
  ),
  );
  }

  /// 📦 RESPONSIVE GRID
  Widget responsiveGrid(BuildContext context) {
  int crossAxisCount = MediaQuery.of(context).size.width > 1000
  ? 3
      : MediaQuery.of(context).size.width > 600
  ? 2
      : 1;

  return Padding(
  padding: const EdgeInsets.all(20),
  child: GridView.builder(
  itemCount: 6,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: crossAxisCount,
  crossAxisSpacing: 20,
  mainAxisSpacing: 20,
  ),
  itemBuilder: (context, index) {
  return projectCard();
  },
  ),
  );
  }

  /// 📦 PROJECT CARD
  Widget projectCard() {
  return Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
  color: const Color(0xff111827),
  borderRadius: BorderRadius.circular(18),
  ),
  child: const Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text("Project Name",
  style: TextStyle(fontWeight: FontWeight.bold)),
  SizedBox(height: 10),
  Text("Short project description",
  style: TextStyle(color: Colors.white70)),
  ],
  ),
  );
  }

  Widget experienceGrid(BuildContext context) {
    final experiences = [
      {
        "role": "Flutter Developer",
        "company": "Winklix Internet Pvt. Ltd.",
        "duration": "Jan 2026 – March 2026",
        "points": [
          "Responsive UI development",
          "REST API integration",
          "Face detection feature",
          "Audio/video calling (Agora)",
          "Real-time chat + notifications",
          "Google Maps integration"
        ]
      },
      {
        "role": "Flutter Developer",
        "company": "Glocify Technologies Pvt. Ltd.",
        "duration": "Apr 2025 – Dec 2025",
        "points": [
          "Modern responsive UI",
          "REST API handling",
          "Stripe payment integration",
          "NFC read/write",
          "Realm database",
          "Google Cloud & iCloud"
        ]
      },
      {
        "role": "Flutter Developer",
        "company": "Global Asprint Pvt. Ltd.",
        "duration": "Mar 2024 – Mar 2025",
        "points": [
          "Scalable Flutter apps",
          "Firebase auth + notifications",
          "Performance optimization (GetX, Riverpod)"
        ]
      },
      {
        "role": "Flutter Developer",
        "company": "Connex Infotech Pvt. Ltd.",
        "duration": "Jul 2023 – Mar 2024",
        "points": [
          "Cross-platform apps",
          "REST API integration",
          "State management (GetX, Riverpod)"
        ]
      },
    ];

    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: MasonryGridView.count(
        crossAxisCount: isMobile ? 1 : 2, // ✅ MAIN FIX
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          final exp = experiences[index];

          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff111827),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ROLE
                Text(
                  exp["role"] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                /// COMPANY + DATE
                Text(
                  "${exp["company"]} | ${exp["duration"]}",
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 10),

                /// POINTS
                ...List.generate(
                  (exp["points"] as List).length,
                      (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("•  ",
                            style: TextStyle(color: Colors.greenAccent)),
                        Expanded(
                          child: Text(
                            (exp["points"] as List)[i],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget projectGrid(BuildContext context) {
    final projects = [
      {
        "name": "Scanly",
        "points": [
          "Implemented app features using GetX for structured state management.",
          "Integrated external packages to provide advanced document scanning functionality.",
          "Leveraged OpenAI to convert scanned documents into concise, meaningful summaries.",
          "Integrated Google Drive API for secure file upload, download, rename, and access management.",
          "Worked with iCloud Container for PDF upload, download, and file synchronization across Apple devices.",
        ]
      },
      {
        "name": "MagicLandPOS",
        "points": [
          "Implemented app features using GetX for efficient state management.",
          "Designed and developed responsive UI and integrated APIs across multiple platforms.",
          "Integrated Stripe to enable secure and seamless payment processing.",
        ]
      },
      {
        "name": "EasyCampus",
        "points": [
          "Implemented app features using GetX for state management.",
          "Utilized Firebase for real-time messaging and notifications.",
          "Designed and developed a streamlined user registration and hiring process.",
        ]
      },
      {
        "name": "UniHealth",
        "points": [
          "Designed intuitive UI to enhance user experience.",
          "Integrated APIs and handled JSON data effectively.",
          "Contributed to end-to-end development for seamless functionality.",
        ]
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: ListView.builder(
        itemCount: projects.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final project = projects[index];

          return Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff111827),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 PROJECT TITLE
                Text(
                  project["name"] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                /// 🔹 POINTS LIST
                ...List.generate(
                  (project["points"] as List).length,
                      (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text("•",
                              style: TextStyle(
                                  color: Colors.greenAccent, fontSize: 14)),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            (project["points"] as List)[i],
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget contactSection() {
    return Container(
      key: contactKey,
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Get in Touch",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("📧 Email: vijaytyagi2002@gmail.com",
              style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5),
          Text("📱 Phone: +91 9105729122",
              style: TextStyle(color: Colors.white70)),
          SizedBox(height: 5),
          Text("📍 Location: Muzaffarnagar, Uttar Pradesh, India",
              style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}