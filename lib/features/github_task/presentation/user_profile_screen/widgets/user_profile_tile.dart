
import 'package:flutter/material.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';

class UserProfileTileWidget extends StatelessWidget {
  String title;
  IconData icon;
  UserProfileTileWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            fWidth30,
            Expanded(
              child: TextWidget(
                textValue: title,
                fontSize: 17,
              ),
            ),
          ],
        ),
        fHight20,
      ],
    );
  }
}
