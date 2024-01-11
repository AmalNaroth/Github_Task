import 'package:flutter/material.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as List<RepositoryEntity>;
    return Scaffold(
      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       TextWidget(
      //           textValue: "Repository",
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold),
      //       fWidth10,
      //       Icon(
      //         Icons.work_outline,
      //         size: 25,
      //       )
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               
               ],),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                    final data = args[index];
                    return args.isEmpty
                        ? Center(
                            child: TextWidget(textValue: "The repository is empty"),
                          )
                        : Link(
                          uri: Uri.parse(args[index].htmlUrl ?? ""),
                          target: LinkTarget.defaultTarget,
                          builder: (context, followLink) {
                            return ListTile(
                              onTap: () => launchUrl(Uri.parse(args[index].htmlUrl ?? "",),
                              mode: LaunchMode.inAppWebView
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              leading: CircleAvatar(
                                child: Center(
                                  child: Text(data.language ?? "",
                                      textAlign: TextAlign.center),
                                ),
                                radius: mWidth! * .09,
                              ),
                              tileColor: Colors.grey.withOpacity(.4),
                              title:
                                  TextWidget(textValue: data.name! ?? "", fontSize: 18),
                              subtitle: TextWidget(textValue: data.visibility! ?? ""),
                              trailing: Icon(
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
                  itemCount: args.length ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}