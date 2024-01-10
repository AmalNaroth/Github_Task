import 'package:flutter/material.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/features/github_task/infrastructure/entites/user_entity.dart';
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as UserEntity;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: mWidth! * .12,
                    backgroundImage: NetworkImage(
                      args.avatarUrl ?? "",
                    ),
                  ),
                  fWidth20,
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              textValue: args.name ?? "No name",
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        fHight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                TextWidget(
                                  textValue: "Following",
                                  fontSize: 17,
                                ),
                                TextWidget(
                                  textValue: "${args.following ?? 0}",
                                  fontSize: 20,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                TextWidget(
                                  textValue: "Following",
                                  fontSize: 17,
                                ),
                                TextWidget(
                                  textValue: "${args.followers ?? 0}",
                                  fontSize: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              fHight40,
              UserProfileTileWidget(
                  title: "${args.bio ?? "Not mentioned"}", icon: Icons.person,),
              UserProfileTileWidget(
                  title: "${args.location ?? "Not mentioned"}", icon: Icons.pin_drop),
              UserProfileTileWidget(
                  title: "${args.company ?? "Not mentioned"}", icon: Icons.apartment),
              UserProfileTileWidget(
                  title: "Created by : ${args.createdAt ?? "Not mentioned"}",
                  icon: Icons.account_tree_outlined),
              UserProfileTileWidget(
                  title: "Updated by : ${args.updatedAt ?? "Not mentioned"}",
                  icon: Icons.update),
              fHight20,
              Divider(
                color: Colors.grey,
              ),
              fHight20,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    backgroundColor: Colors.white),
                onPressed: () {},
                child: TextWidget(
                    textValue: "Repository", fontColors: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
