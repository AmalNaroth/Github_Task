import 'package:flutter/material.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/features/github_task/infrastructure/entites/git_repository_entity.dart';
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<RepositoryEntity>;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            TextWidget(textValue: "Repository",
            fontSize: 18,
            fontWeight: FontWeight.bold),
            fWidth10,
            Icon(Icons.work_outline,
            size: 25,)
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final data = args[index];
        return ListTile(
          onTap: () async{
            final Uri url = Uri.parse('https://flutter.dev');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $_url');
    }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          leading: CircleAvatar(child: Center(child: TextWidget(textValue: data.language ?? ""))),
          tileColor: Colors.grey.withOpacity(.4),
          title: TextWidget(textValue: data.name! ?? ""),
          subtitle: TextWidget(textValue: data.visibility! ?? ""),
          trailing: TextWidget(textValue: data.pushedAt! ?? ""),
        );
      }, separatorBuilder: (context, index) {
        return fHight20;
      }, itemCount: args.length ?? 0),
    );
  }
}