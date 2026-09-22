// import 'package:flutter/material.dart';
// import 'package:ibadah_journey/core/constants/colors.dart';
// import 'package:ibadah_journey/core/services/notification_service.dart';
// import 'package:ibadah_journey/pages/target/add_target_page.dart';
// import 'package:ibadah_journey/pages/target/models/target_model.dart';
// import 'data/target_data.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';
// import '../../../providers/target_provider.dart';
// import 'package:ibadah_journey/services/target_storage_service.dart';

// class TargetPage extends StatefulWidget {
//   const TargetPage({super.key});

//   @override
//   State<TargetPage> createState() => _TargetPageState();
// }

// class _TargetPageState extends State<TargetPage> {
//   int streak = 0; // 🔥 STREAK

//   // HITUNG PROGRESS OTOMATIS
//   double get progress {
//     final done = targetList.where((e) => e.isDone).length;

//     return done / targetList.length;
//   }

//   int get doneCount {
//     return targetList.where((e) => e.isDone).length;
//   }

//   final List<Map<String, dynamic>> habits = [
//     {
//       'title': 'Sholat Subuh',
//       'subtitle': 'Jangan tinggalkan sholat Subuh',
//       'done': true,
//       'icon': Icons.wb_sunny_rounded,
//     },
//     {
//       'title': 'Baca Quran',
//       'subtitle': 'Minimal 2 halaman setiap hari',
//       'done': true,
//       'icon': Icons.menu_book_rounded,
//     },
//     {
//       'title': 'Dzikir Pagi',
//       'subtitle': 'Dzikir setelah Subuh',
//       'done': false,
//       'icon': Icons.favorite_rounded,
//     },
//     {
//       'title': 'Sedekah',
//       'subtitle': 'Berbagi kepada sesama',
//       'done': false,
//       'icon': Icons.volunteer_activism_rounded,
//     },
//     {
//       'title': 'Tahajud',
//       'subtitle': 'Bangun malam untuk ibadah',
//       'done': true,
//       'icon': Icons.nightlight_round,
//     },
//   ];

//   // icons
//   final List<IconData> targetIcons = [
//     Icons.mosque_rounded,
//     Icons.menu_book_rounded,
//     Icons.favorite_rounded,
//     Icons.nightlight_round,
//     Icons.volunteer_activism_rounded,
//     Icons.self_improvement_rounded,
//     Icons.star_rounded,
//     Icons.bedtime_rounded,
//   ];

//   IconData selectedIcon = Icons.star_rounded;

//   // toggle
//   final List<String> progressTabs = [
//     'Hari Ini',
//     'Mingguan',
//     'Bulanan',
//   ];

//   String selectedProgress = 'Hari Ini';

//   // CATEGORY LIST
//   final List<String> categories = [
//     'Semua',
//     'Sholat',
//     'Quran',
//     'Dzikir',
//     'Puasa',
//     'Sedekah',
//   ];

//   String selectedCategory = 'Semua';

//   // filtered list
//   List get filteredTargets {
//     if (selectedCategory == 'Semua') {
//       return targetList;
//     }

//     return targetList.where((target) {
//       return target.category == selectedCategory;
//     }).toList();
//   }

//   /// shared_preferences

//   // FUCTION SAVE
//   Future<void> saveTargets() async {
//     final prefs = await SharedPreferences.getInstance();

//     for (int i = 0; i < targetList.length; i++) {
//       prefs.setBool(
//         'target_$i',
//         targetList[i].isDone,
//       );
//     }

//     prefs.setString(
//       'last_date',
//       DateTime.now().toIso8601String(),
//     );
//   }

//   // LOAD SAVE
//   Future<void> loadSavedTargets() async {
//     final saved = await TargetStorageService.loadTargets();

//     if (saved.isNotEmpty) {
//       for (int i = 0; i < saved.length; i++) {
//         if (i < targetList.length) {
//           targetList[i].isDone = saved[i];
//         }
//       }

//       setState(() {});
//     }
//   }

//   // FUCTION LOAD
//   Future<void> loadTargets() async {
//     final prefs = await SharedPreferences.getInstance();

//     setState(() {
//       for (int i = 0; i < targetList.length; i++) {
//         targetList[i].isDone = prefs.getBool('target_$i') ?? false;
//       }

//       streak = prefs.getInt('streak') ?? 0;
//     });
//   }

//   // SAVE STREAK
//   Future<void> checkStreak() async {
//     final prefs = await SharedPreferences.getInstance();

//     final allDone = targetList.every((e) => e.isDone);

//     if (allDone) {
//       streak++;

//       prefs.setInt('streak', streak);
//     }
//   }

//   // RESET HARIAN
//   Future<void> resetDailyTargets() async {
//     final prefs = await SharedPreferences.getInstance();

//     final lastDateString = prefs.getString('last_date');

//     if (lastDateString == null) return;

//     final lastDate = DateTime.parse(lastDateString);

//     final now = DateTime.now();

//     final isNewDay = lastDate.day != now.day ||
//         lastDate.month != now.month ||
//         lastDate.year != now.year;

//     if (isNewDay) {
//       for (var target in targetList) {
//         target.isDone = false;
//       }

//       await saveTargets();

//       setState(() {});
//     }
//   }

//   //

//   @override
//   void initState() {
//     super.initState();

//     Future.microtask(() {
//       context.read<TargetProvider>().loadTargets();
//     });

//     resetDailyTargets();

//     saveTargets();

//     loadSavedTargets();

//     checkStreak();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final completed = habits.where((e) => e['done'] == true).length;

//     final progress = completed / habits.length;

//     final completedCount = targetList.where((e) => e.isDone).length;

//     final provider = context.watch<TargetProvider>();

//     return Scaffold(
//       backgroundColor: AppColors.background,

//       /// APPBAR
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           'Target Ibadah',
//           style: TextStyle(
//             color: AppColors.primary,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),

//       /// FLOATING BUTTON
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: AppColors.primary,
//         elevation: 0,
//         onPressed: () async {
//           await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => const AddTargetPage(),
//             ),
//           );

//           setState(() {});
//         },
//         icon: const Icon(
//           Icons.add_rounded,
//           color: Colors.white,
//         ),
//         label: const Text(
//           'Tambah Habit',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// HERO CARD
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xff4A9B78),
//                     Color(0xff2E7D5A),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primary.withOpacity(0.18),
//                     blurRadius: 18,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Progress Hari Ini',
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 13,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     '$completed dari ${habits.length} target selesai',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                     ),
//                   ),
//                   const SizedBox(height: 22),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: LinearProgressIndicator(
//                       value: progress,
//                       minHeight: 10,
//                       backgroundColor: Colors.white24,
//                       valueColor: const AlwaysStoppedAnimation<Color>(
//                         Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.local_fire_department_rounded,
//                         color: Colors.orange,
//                       ),
//                       const SizedBox(width: 8),
//                       const Text(
//                         '7 Hari Streak',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const Spacer(),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 14,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white24,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           '${(progress * 100).toInt()}%',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             // TOGGLE UI PREMIUM
//             SizedBox(height: 24),
//             SizedBox(
//               height: 46,
//               child: ListView.separated(
//                 padding: EdgeInsets.symmetric(horizontal: 25),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: progressTabs.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 10),
//                 itemBuilder: (context, index) {
//                   final tab = progressTabs[index];

//                   final selected = selectedProgress == tab;

//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedProgress = tab;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 250),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                       ),
//                       decoration: BoxDecoration(
//                         color: selected ? AppColors.primary : AppColors.white,
//                         borderRadius: BorderRadius.circular(18),
//                         border: Border.all(
//                           color: selected
//                               ? AppColors.primary
//                               : Colors.grey.shade200,
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           tab,
//                           style: TextStyle(
//                             color: selected ? Colors.white : AppColors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 24),
//             if (selectedProgress == 'Hari Ini') ...[
//               TodaySection(),
//             ],

//             if (selectedProgress == 'Mingguan') ...[
//               WeeklySection(),
//             ],

//             if (selectedProgress == 'Bulanan') ...[
//               MonthlySection(),
//             ],

//             const SizedBox(height: 24),

//             /// PROGRESS SECTION
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Progress Hari Ini',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black,
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// PERCENT
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _progressCard(
//                           title: 'Sholat',
//                           value: '${(progress * 100).toInt()}%',
//                           progress: progress,
//                           icon: Icons.mosque_rounded,
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       Expanded(
//                         child: _progressCard(
//                           title: 'Dzikir',
//                           value: '60%',
//                           progress: 0.6,
//                           icon: Icons.favorite_rounded,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 14),

//                   Row(
//                     children: [
//                       Expanded(
//                         child: _progressCard(
//                           title: 'Quran',
//                           value: '40%',
//                           progress: 0.4,
//                           icon: Icons.menu_book_rounded,
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       Expanded(
//                         child: _progressCard(
//                           title: 'Puasa',
//                           value: '100%',
//                           progress: 1,
//                           icon: Icons.nightlight_round,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // 🔥 streak
//             const SizedBox(height: 24),

//             /// STREAK CARD
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xff4A9B78),
//                     Color(0xff2E7D5A),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.primary.withOpacity(0.2),
//                     blurRadius: 16,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 68,
//                     height: 68,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.15),
//                       borderRadius: BorderRadius.circular(22),
//                     ),
//                     child: const Icon(
//                       Icons.local_fire_department_rounded,
//                       color: Colors.orange,
//                       size: 38,
//                     ),
//                   ),
//                   const SizedBox(width: 18),
//                   const Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Streak Ibadah',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 13,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           '12 Hari Berturut-turut',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                           ),
//                         ),
//                         SizedBox(height: 6),
//                         Text(
//                           'Terus pertahankan ibadahmu ✨',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // 📊 statistik mingguan:
//             const SizedBox(height: 24),

//             /// WEEKLY STATS
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Statistik Mingguan',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       _barItem('Sen', 0.7),
//                       _barItem('Sel', 0.5),
//                       _barItem('Rab', 0.9),
//                       _barItem('Kam', 0.6),
//                       _barItem('Jum', 1),
//                       _barItem('Sab', 0.8),
//                       _barItem('Min', 0.4),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // 🏆 achievement
//             const SizedBox(height: 24),

//             /// ACHIEVEMENT
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Achievement',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _achievementCard(
//                           icon: Icons.local_fire_department_rounded,
//                           title: '7 Hari',
//                           subtitle: 'Streak',
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       Expanded(
//                         child: _achievementCard(
//                           icon: Icons.menu_book_rounded,
//                           title: '30x',
//                           subtitle: 'Khatam',
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       Expanded(
//                         child: _achievementCard(
//                           icon: Icons.star_rounded,
//                           title: 'Level 5',
//                           subtitle: 'Muslim',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             // 📅 kalender progress bulanan
//             const SizedBox(height: 24),

//             /// MONTHLY ACTIVITY
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Aktivitas Bulanan',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Wrap(
//                     spacing: 8,
//                     runSpacing: 8,
//                     children: List.generate(
//                       30,
//                       (index) {
//                         final active = index % 3 != 0;

//                         return Container(
//                           width: 22,
//                           height: 22,
//                           decoration: BoxDecoration(
//                             color: active
//                                 ? AppColors.primary
//                                 : Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 28),

//             /// SECTION TITLE
//             const Text(
//               'Checklist Ibadah',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.black,
//               ),
//             ),

//             const SizedBox(height: 20),

//             SizedBox(
//               height: 42,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 10),
//                 itemBuilder: (context, index) {
//                   final category = categories[index];

//                   final isSelected = selectedCategory == category;

//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCategory = category;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: const Duration(
//                         milliseconds: 250,
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 18,
//                       ),
//                       decoration: BoxDecoration(
//                         color: isSelected ? AppColors.primary : AppColors.white,
//                         borderRadius: BorderRadius.circular(18),
//                         border: Border.all(
//                           color: isSelected
//                               ? AppColors.primary
//                               : Colors.grey.shade200,
//                         ),
//                       ),
//                       child: Center(
//                         child: Text(
//                           category,
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : AppColors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 18),

//             /// HABIT LIST
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: filteredTargets.length,
//               separatorBuilder: (_, __) => const SizedBox(height: 18),
//               itemBuilder: (context, index) {
//                 final target = filteredTargets[index];

//                 return Dismissible(
//                   key: ValueKey(target.title),

//                   direction: DismissDirection.endToStart,

//                   onDismissed: (_) {
//                     setState(() {
//                       targetList.remove(target);
//                     });
//                   },

//                   /// PREMIUM DELETE BACKGROUND
//                   background: Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(right: 24),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xffFF6B6B),
//                           Color(0xffFF3B3B),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Container(
//                       width: 54,
//                       height: 54,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.delete_rounded,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),

//                   child: GestureDetector(
//                     /// COMPLETE TARGET
//                     onTap: () async {
//                       setState(() {
//                         if (target.currentCount < target.targetCount) {
//                           target.incrementProgress();
//                         } else {
//                           target.currentCount = 0;
//                           target.isDone = false;
//                         }
//                       });

//                       await TargetStorageService.saveTargets(
//                         targetList.map((e) => e.isDone).toList(),
//                       );
//                     },

//                     /// EDIT HABIT
//                     onLongPress: () {
//                       final titleController = TextEditingController(
//                         text: target.title,
//                       );

//                       final subtitleController = TextEditingController(
//                         text: target.subtitle,
//                       );

//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         backgroundColor: Colors.transparent,
//                         builder: (_) {
//                           return Container(
//                             padding: EdgeInsets.only(
//                               left: 24,
//                               right: 24,
//                               top: 24,
//                               bottom:
//                                   MediaQuery.of(context).viewInsets.bottom + 24,
//                             ),
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(34),
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   width: 50,
//                                   height: 5,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey.shade300,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 const Text(
//                                   'Edit Habit',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 24),
//                                 TextField(
//                                   controller: titleController,
//                                   decoration: InputDecoration(
//                                     hintText: 'Nama Habit',
//                                     filled: true,
//                                     fillColor: AppColors.background,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 18),
//                                 TextField(
//                                   controller: subtitleController,
//                                   maxLines: 3,
//                                   decoration: InputDecoration(
//                                     hintText: 'Deskripsi Habit',
//                                     filled: true,
//                                     fillColor: AppColors.background,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 28),
//                                 SizedBox(
//                                   width: double.infinity,
//                                   height: 56,
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: AppColors.primary,
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         target.title = titleController.text;

//                                         target.subtitle =
//                                             subtitleController.text;
//                                       });

//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(
//                                       'Simpan Perubahan',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },

//                     /// CARD
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 250),
//                       padding: const EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.94),
//                         borderRadius: BorderRadius.circular(30),
//                         border: Border.all(
//                           color: target.isCompleted
//                               ? AppColors.primary.withOpacity(0.25)
//                               : Colors.transparent,
//                           width: 1.5,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.04),
//                             blurRadius: 20,
//                             spreadRadius: 1,
//                             offset: const Offset(0, 10),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           /// TOP SECTION
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               /// ICON
//                               Container(
//                                 width: 62,
//                                 height: 62,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       AppColors.primary.withOpacity(0.15),
//                                       AppColors.primary.withOpacity(0.05),
//                                     ],
//                                   ),
//                                   borderRadius: BorderRadius.circular(22),
//                                 ),
//                                 child: Icon(
//                                   target.icon,
//                                   color: AppColors.primary,
//                                   size: 30,
//                                 ),
//                               ),

//                               const SizedBox(width: 16),

//                               /// TEXT
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             target.title,
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.bold,
//                                               color: target.isCompleted
//                                                   ? AppColors.primary
//                                                   : AppColors.black,
//                                             ),
//                                           ),
//                                         ),
//                                         if (target.isCompleted)
//                                           Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 6,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               color: AppColors.primary,
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                 20,
//                                               ),
//                                             ),
//                                             child: const Text(
//                                               'Selesai',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 11,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ),
//                                       ],
//                                     ),

//                                     const SizedBox(height: 6),

//                                     Text(
//                                       target.subtitle,
//                                       style: const TextStyle(
//                                         color: AppColors.grey,
//                                         fontSize: 13,
//                                         height: 1.5,
//                                       ),
//                                     ),

//                                     const SizedBox(height: 14),

//                                     /// TAGS
//                                     Wrap(
//                                       spacing: 8,
//                                       runSpacing: 8,
//                                       children: [
//                                         _miniTag(
//                                           icon: Icons.category_rounded,
//                                           text: target.category,
//                                         ),
//                                         _miniTag(
//                                           icon: Icons.repeat_rounded,
//                                           text: target.frequency,
//                                         ),
//                                         _miniTag(
//                                           icon: Icons.calendar_month_rounded,
//                                           text: target.activeDays.join(
//                                             ', ',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 22),

//                           /// PROGRESS HEADER
//                           Row(
//                             children: [
//                               Text(
//                                 '${target.currentCount}/${target.targetCount} ${target.unit}',
//                                 style: const TextStyle(
//                                   color: AppColors.primary,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const Spacer(),
//                               Text(
//                                 '${(target.progress * 100).toInt()}%',
//                                 style: const TextStyle(
//                                   color: AppColors.grey,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           const SizedBox(height: 12),

//                           /// PREMIUM PROGRESS
//                           Container(
//                             height: 10,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               color: Colors.grey.shade200,
//                             ),
//                             child: FractionallySizedBox(
//                               alignment: Alignment.centerLeft,
//                               widthFactor: target.progress,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(30),
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xff4A9B78),
//                                       Color(0xff66BB8A),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 18),

//                           /// FOOTER
//                           Row(
//                             children: [
//                               Icon(
//                                 target.reminderEnabled
//                                     ? Icons.notifications_active_rounded
//                                     : Icons.notifications_off_rounded,
//                                 size: 18,
//                                 color: AppColors.grey,
//                               ),
//                               const SizedBox(width: 8),
//                               Text(
//                                 target.reminderEnabled
//                                     ? '${target.reminderHour.toString().padLeft(2, '0')}:${target.reminderMinute.toString().padLeft(2, '0')}'
//                                     : 'Reminder Off',
//                                 style: const TextStyle(
//                                   color: AppColors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                               const Spacer(),
//                               Icon(
//                                 Icons.touch_app_rounded,
//                                 size: 18,
//                                 color: AppColors.primary.withOpacity(0.5),
//                               ),
//                               const SizedBox(width: 6),
//                               Text(
//                                 'Tap to progress',
//                                 style: TextStyle(
//                                   color: AppColors.primary.withOpacity(0.7),
//                                   fontSize: 11,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             // SECTION 📊 Statistik & Progress Ibadah
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Progress Hari Ini',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 18),

//                   /// PERCENT
//                   Row(
//                     children: [
//                       Expanded(
//                         child: LinearProgressIndicator(
//                           value: provider.progress,
//                           minHeight: 10,
//                           borderRadius: BorderRadius.circular(20),
//                           backgroundColor: Colors.grey.shade200,
//                           valueColor: AlwaysStoppedAnimation(
//                             AppColors.primary,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Text(
//                         '${(provider.progress * 100).toInt()}%',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   /// STATS
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _progressItem(
//                         title: 'Selesai',
//                         value: '${provider.completedCount}',
//                         icon: Icons.check_circle_rounded,
//                       ),
//                       _progressItem(
//                         title: 'Target',
//                         value: '${targetList.length}',
//                         icon: Icons.flag_rounded,
//                       ),
//                       _progressItem(
//                         title: 'Streak',
//                         value: '7 Hari',
//                         icon: Icons.local_fire_department_rounded,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 28),

//             /// WEEKLY PROGRESS
//             const Text(
//               'Progress Mingguan',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.black,
//               ),
//             ),

//             const SizedBox(height: 18),

//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   _DayProgress(
//                     day: 'Sen',
//                     active: true,
//                   ),
//                   _DayProgress(
//                     day: 'Sel',
//                     active: true,
//                   ),
//                   _DayProgress(
//                     day: 'Rab',
//                     active: true,
//                   ),
//                   _DayProgress(
//                     day: 'Kam',
//                     active: false,
//                   ),
//                   _DayProgress(
//                     day: 'Jum',
//                     active: true,
//                   ),
//                   _DayProgress(
//                     day: 'Sab',
//                     active: true,
//                   ),
//                   _DayProgress(
//                     day: 'Min',
//                     active: true,
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 28),

//             /// QURAN TARGET
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(22),
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.03),
//                     blurRadius: 14,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         width: 54,
//                         height: 54,
//                         decoration: BoxDecoration(
//                           color: AppColors.secondary,
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: const Icon(
//                           Icons.menu_book_rounded,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(width: 14),
//                       const Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Target Quran',
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '12 / 30 Hari',
//                               style: TextStyle(
//                                 color: AppColors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: const LinearProgressIndicator(
//                       value: 0.4,
//                       minHeight: 10,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 NotificationService.showNotification(
//                   title: 'Waktunya Ibadah 📿',
//                   body: 'Jangan lupa dzikir pagi hari ini',
//                 );
//               },
//               child: const Text('Test Notifikasi'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// // HELPER WIDGET
// Widget _progressCard({
//   required String title,
//   required String value,
//   required double progress,
//   required IconData icon,
// }) {
//   return Container(
//     padding: const EdgeInsets.all(18),
//     decoration: BoxDecoration(
//       color: AppColors.background,
//       borderRadius: BorderRadius.circular(24),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: 48,
//           height: 48,
//           decoration: BoxDecoration(
//             color: AppColors.secondary,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Icon(
//             icon,
//             color: AppColors.primary,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 8),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: LinearProgressIndicator(
//             value: progress,
//             minHeight: 8,
//             backgroundColor: Colors.grey.shade200,
//             valueColor: const AlwaysStoppedAnimation(
//               AppColors.primary,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Text(
//           value,
//           style: const TextStyle(
//             color: AppColors.primary,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // 📊 statistik mingguan:
// Widget _barItem(String day, double value) {
//   return Column(
//     children: [
//       Container(
//         width: 22,
//         height: 120 * value,
//         decoration: BoxDecoration(
//           color: AppColors.primary,
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       const SizedBox(height: 10),
//       Text(
//         day,
//         style: const TextStyle(
//           color: AppColors.grey,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ],
//   );
// }

// // HELPER 🏆 achievement
// Widget _achievementCard({
//   required IconData icon,
//   required String title,
//   required String subtitle,
// }) {
//   return Container(
//     padding: const EdgeInsets.symmetric(
//       vertical: 20,
//       horizontal: 12,
//     ),
//     decoration: BoxDecoration(
//       color: AppColors.background,
//       borderRadius: BorderRadius.circular(24),
//     ),
//     child: Column(
//       children: [
//         Container(
//           width: 54,
//           height: 54,
//           decoration: BoxDecoration(
//             color: AppColors.secondary,
//             borderRadius: BorderRadius.circular(18),
//           ),
//           child: Icon(
//             icon,
//             color: AppColors.primary,
//           ),
//         ),
//         const SizedBox(height: 14),
//         Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           subtitle,
//           style: const TextStyle(
//             color: AppColors.grey,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // (SECTION) 📊 Statistik & Progress Ibadah
// Widget _progressItem({
//   required String title,
//   required String value,
//   required IconData icon,
// }) {
//   return Column(
//     children: [
//       Container(
//         width: 56,
//         height: 56,
//         decoration: BoxDecoration(
//           color: AppColors.secondary,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Icon(
//           icon,
//           color: AppColors.primary,
//         ),
//       ),
//       const SizedBox(height: 10),
//       Text(
//         value,
//         style: const TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       const SizedBox(height: 4),
//       Text(
//         title,
//         style: const TextStyle(
//           color: AppColors.grey,
//           fontSize: 12,
//         ),
//       ),
//     ],
//   );
// }

// // LIST HABIT
// Widget _miniTag({
//   required IconData icon,
//   required String text,
// }) {
//   return Container(
//     padding: const EdgeInsets.symmetric(
//       horizontal: 10,
//       vertical: 6,
//     ),
//     decoration: BoxDecoration(
//       color: AppColors.background,
//       borderRadius: BorderRadius.circular(14),
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(
//           icon,
//           size: 14,
//           color: AppColors.grey,
//         ),
//         const SizedBox(width: 4),
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 11,
//             color: AppColors.grey,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// // TODAY SECTION
// Widget TodaySection() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(22),
//     decoration: BoxDecoration(
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Progress Hari Ini',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 20),
//         LinearProgressIndicator(
//           value: 0.7,
//           minHeight: 10,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         const SizedBox(height: 18),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _progressItem(
//               title: 'Selesai',
//               value: '7',
//               icon: Icons.check_circle,
//             ),
//             _progressItem(
//               title: 'Target',
//               value: '10',
//               icon: Icons.flag,
//             ),
//             _progressItem(
//               title: 'Streak',
//               value: '12',
//               icon: Icons.local_fire_department,
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// // WEEKLY SECTION
// Widget WeeklySection() {
//   return Container(
//     padding: const EdgeInsets.all(22),
//     decoration: BoxDecoration(
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Statistik Mingguan',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 24),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             _barItem('Sen', 0.7),
//             _barItem('Sel', 0.5),
//             _barItem('Rab', 0.9),
//             _barItem('Kam', 0.6),
//             _barItem('Jum', 1),
//             _barItem('Sab', 0.8),
//             _barItem('Min', 0.4),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// // MONTHLY SECTION
// Widget MonthlySection() {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(22),
//     decoration: BoxDecoration(
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Aktivitas Bulanan',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 20),
//         Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children: List.generate(
//             30,
//             (index) {
//               final active = index % 3 != 0;

//               return Container(
//                 width: 22,
//                 height: 22,
//                 decoration: BoxDecoration(
//                   color: active ? AppColors.primary : Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }

// class _DayProgress extends StatelessWidget {
//   final String day;
//   final bool active;

//   const _DayProgress({
//     required this.day,
//     required this.active,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AnimatedContainer(
//           duration: const Duration(milliseconds: 250),
//           width: 42,
//           height: 42,
//           decoration: BoxDecoration(
//             color: active ? AppColors.primary : AppColors.secondary,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             active ? Icons.check_rounded : Icons.close_rounded,
//             color: active ? Colors.white : AppColors.primary,
//             size: 20,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           day,
//           style: const TextStyle(
//             color: AppColors.grey,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
// }
