import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 260,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 8),
                  child: Text(
                    course.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                const Spacer(),
                const Text(
                  "8 SECTIONS (4 HEURES)",
                  style: TextStyle(color: Colors.white54),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                    3,
                    (i) => Transform.translate(
                      offset: Offset((-10 * i).toDouble(), 0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("assets/avatars/Avatar ${i + 1}.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(course.iconSrc)
        ],
      ),
    );
  }
}