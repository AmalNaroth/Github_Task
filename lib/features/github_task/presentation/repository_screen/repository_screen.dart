import 'package:flutter/material.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart'; // Corrected 'entites' to 'entities'
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryScreen extends StatefulWidget {
  const RepositoryScreen({Key? key})
      : super(key: key); // Corrected 'super.key' to 'Key? key'

  @override
  State<RepositoryScreen> createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen>
    with TickerProviderStateMixin {
  late TabController
      _tabController; // Moved TabController initialization outside the build method

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as List<RepositoryEntity>;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            fHight20,
            TextWidget(
                textValue: "Repository",
                fontSize: 30,
                fontWeight: FontWeight.bold),
            fHight30,
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey,
                  ),
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      child: TextWidget(
                          textValue: "All", fontColors: Colors.black),
                    ),
                    Tab(
                      child: TextWidget(
                          textValue: "2023", fontColors: Colors.black),
                    ),
                    Tab(
                      child: TextWidget(
                          textValue: "2024", fontColors: Colors.black),
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  if (args.isEmpty)
                    Center(
                      child: TextWidget(textValue: "The repository is empty"),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        final data = args[index];
                        return Link(
                          uri: Uri.parse(data.htmlUrl ?? ""),
                          target: LinkTarget.defaultTarget,
                          builder: (context, followLink) {
                            return ListTile(
                              onTap: () => launchUrl(
                                Uri.parse(data.htmlUrl ?? ""),
                                mode: LaunchMode.inAppWebView,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: CircleAvatar(
                                child: Center(
                                  child: Text(data.language ?? "",
                                      textAlign: TextAlign.center),
                                ),
                                radius: mWidth! * .09,
                              ),
                              tileColor: Colors.grey.withOpacity(.4),
                              title: TextWidget(
                                textValue: data.name ?? "",
                                fontSize: 18,
                              ),
                              subtitle:
                                  TextWidget(textValue: data.visibility ?? ""),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return fHight20;
                      },
                      itemCount: args.length,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
