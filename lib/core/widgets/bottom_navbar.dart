// import 'package:flutter/material.dart';
// import 'package:ibadah_journey/pages/home/home_page.dart';
// import 'package:ibadah_journey/pages/quran/quran_page.dart';

// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({super.key});

//   @override
//   State<BottomNavbar> createState() => _bottomnavbarState();
// }

// class _bottomnavbarState extends State<BottomNavbar> {
//   int currentIndex = 0;

//   final pages = [
//     HomePage(),
//     QuranPage(),
//     IbadahPage(),
//     TargetPage(),
//     ProfilePage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.all(18),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(26),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 20,
//               offset: const Offset(0, 10),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(26),
//           child: BottomNavigationBar(
//             currentIndex: currentIndex,
//             onTap: (index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.white,
//             elevation: 0,
//             selectedItemColor: AppColors.primary,
//             unselectedItemColor: AppColors.grey,
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_rounded),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.menu_book_rounded),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.mosque_rounded),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.track_changes_rounded),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person_rounded),
//                 label: '',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
