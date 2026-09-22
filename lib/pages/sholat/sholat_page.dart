import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/sholat/detail_sholat_page.dart';
import 'package:ibadah_journey/pages/sholat/sholat_data.dart';

class SholatPage extends StatefulWidget {
  const SholatPage({super.key});

  @override
  State<SholatPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<SholatPage> {
  List<DoaModel> filteredDoa = [];

  String selectedCategory = "Semua";

  final List<String> categories = [
    "Semua",
    "Wudhu",
    "Sholat",
    "Doa-Doa",
    "Ziarah",
  ];

  @override
  void initState() {
    super.initState();
    filteredDoa = doaList;
  }

  void searchDoa(String keyword) {
    final result = doaList.where((doa) {
      final matchKeyword =
          doa.judul.toLowerCase().contains(keyword.toLowerCase());

      final matchCategory =
          selectedCategory == "Semua" ? true : doa.kategori == selectedCategory;

      return matchKeyword && matchCategory;
    }).toList();

    setState(() {
      filteredDoa = result;
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;

      if (category == "Semua") {
        filteredDoa = doaList;
      } else {
        filteredDoa = doaList.where((e) => e.kategori == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Doa Harian",
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /// SEARCH
            TextField(
              onChanged: searchDoa,
              decoration: InputDecoration(
                hintText: "Cari doa...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// CATEGORY
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isActive = selectedCategory == cat;

                  return GestureDetector(
                    onTap: () => filterByCategory(cat),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isActive ? AppColors.primary : AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isActive ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// LIST DOA
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoa.length,
                itemBuilder: (context, index) {
                  final doa = filteredDoa[index];

                  return DoaTile(
                    number: "${index + 1}",
                    title: doa.judul,
                    doa: doa,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoaTile extends StatelessWidget {
  final String number;
  final String title;
  final DoaModel doa;

  const DoaTile({
    super.key,
    required this.number,
    required this.title,
    required this.doa,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailSholatPage(doa: doa),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  number,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
