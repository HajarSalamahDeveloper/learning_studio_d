import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:learning_studio/shared/extensions/padding_ex.dart';
import 'package:learning_studio/shared/extensions/size_ex.dart';
import 'package:learning_studio/shared/extensions/widget_ex.dart';
import 'package:learning_studio/shared/widgets/app_txt_widget.dart';

import '../../../../config/const/app_images.dart';
import '../../../../config/style/app_colors.dart';
import '../../../../core/faker/dummy_network_image.dart';
import '../../../../shared/extensions/theme_contex.dart';
import '../../../../shared/widgets/app_scaffold.dart';
import '../../../../shared/widgets/images/asset_image.dart';
import '../../../../shared/widgets/images/network_image.dart';
import '../../../../shared/widgets/images/svg_image.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'homeScreen';
  static const String path = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      
         
       
      body: Column(
        children: [
          // Fixed Profile and Notification Section
          CustomAppBar(),
          // Scrollable Content
          SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 16),
                const TestYourselfCard(),
                const SizedBox(height: 16),
                const SearchBar(),
                const SizedBox(height: 16),
                 SectionHeader(title: "Courses", onSeeAll: () {}),
                const CategoryTabs(),
                const CourseList(),
                const SizedBox(height: 16),
                 SectionHeader(title: "Frequently Asked Questions", onSeeAll: () {}),
                const FAQSection(),
                const SizedBox(height: 16),
                 SectionHeader(title: "Library", onSeeAll: () {}),
                const CategoryTabs(),
                const LibraryList(),
                const SizedBox(height: 16),
              ],
            ),
          ).expanded(),
      
      
        ],
      ),
    );
  }
}


/// 🔹 Reusable Section Header
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionHeader({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(onPressed: onSeeAll, child: const Text("See all")),
      ],
    );
  }
}

/// 🔹 Test Yourself Card


class TestYourselfCard extends StatelessWidget {
  const TestYourselfCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
       clipBehavior: Clip.none,
      children: [
      
        
        // Content
        Container(
          margin: EdgeInsets.only(top: 85.h),
              // padding: EdgeInsetsDirectional.only(top: 7.h , start: 20.w , end: 20.w),
              decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.h),
        image: const DecorationImage(
          image: AssetImage(AppImages.cardTestimg), // Update path
          fit: BoxFit.cover,
        ),
              ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                TextWidget(
                  "Test yourself",
                  style: theme.textTheme.headlineSmall,
                ),
                8.sizeH,
                 TextWidget(
                  "Assess your knowledge with interactive quizzes. Identify strengths and areas for improvement. Test your understanding now",
                  style: theme.textTheme.bodySmall?.copyWith(
                    
                  ),
                 
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF218482), // Matching button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Do it now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
         
       PositionedDirectional(
          top: -5.h, // Move the image above the card
          start: 168.w,
          end: 20.w,
          child: Align(
            alignment: Alignment.topCenter,
            child: AssetImageWidget(
             AppImages.manSmile , // Update path
              // width: 205.w, // Adjust size
              // height: 142,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ).paddingOnly(top: 7.h , start: 20.w , end: 20.w);
  }
}

/// 🔹 Search Bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Quick Search",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

/// 🔹 Category Tabs
class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoryTab(label: "Most Popular", isSelected: true),
        CategoryTab(label: "Mathematics"),
        CategoryTab(label: "Computer Science"),
      ],
    );
  }
}

/// 🔹 Individual Category Tab
class CategoryTab extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryTab({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black,
        ),
        child: Text(label),
      ),
    );
  }
}

/// 🔹 Course List (Horizontal Scroll)
class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CourseCard(title: "UX Design Basics", author: "John Joe", price: "\$200"),
          CourseCard(title: "Advanced UI/UX", author: "Sarah W.", price: "\$250"),
        ],
      ),
    );
  }
}

/// 🔹 Course Card
class CourseCard extends StatelessWidget {
  final String title;
  final String author;
  final String price;

  const CourseCard({super.key, required this.title, required this.author, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 100, color: Colors.grey[300]), // Placeholder for image
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(author),
          Text(price, style: const TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

/// 🔹 FAQ Section
class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FAQTile(question: "What is an educational platform?"),
        FAQTile(question: "How do I enroll in a course?"),
      ],
    );
  }
}

/// 🔹 FAQ Tile
class FAQTile extends StatelessWidget {
  final String question;

  const FAQTile({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(question, style: const TextStyle(color: Colors.blue)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

/// 🔹 Library List (Similar to Courses)
class LibraryList extends StatelessWidget {
  const LibraryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CourseCard(title: "UX Design for Developers", author: "Sarah University", price: "\$100"),
          CourseCard(title: "Hands-on UI Design", author: "James Dev", price: "\$120"),
        ],
      ),
    );
  }
}
