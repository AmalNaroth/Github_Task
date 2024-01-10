import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_task/config/routes/app_routes.dart';
import 'package:github_task/core/navigation_services/navigator_services.dart';
import 'package:github_task/core/utils/size_utils.dart';
import 'package:github_task/core/utils/textediting_controllers.dart';
import 'package:github_task/features/github_task/application/home_screen/home_bloc.dart';
import 'package:github_task/features/github_task/presentation/widgets/snackbar_widget.dart';
import 'package:github_task/features/github_task/presentation/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: mWidth! * .4,
                height: mWidth! * .4,
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/github-logo.png"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Github",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(.1),
                ),
                child: TextField(
                  controller: HomeScreenControlls.searchQuery,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "User name",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: const EdgeInsets.all(20),
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: BlocConsumer<HomeBloc, HomeState>(
                    listener: (context, state) {
                      if (state is HomeNoUserFoundState) {
                        customSnackBar(state.message, context);
                      } else if (state is HomeUserFoundState) {
                        print(state.userData);
                        NavigatorService.pushNamed(AppRoutes.userProfileScreen,
                            arguments: state.userData);
                      }
                    },
                    builder: (context, state) {
                      if (state is HomeLoadingState) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      } else {
                        return TextWidget(
                          textValue: "Search",
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        );
                      }
                    },
                  ),
                ),
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(
                    HomeSeachButtonClickEvent(
                      userName: HomeScreenControlls.searchQuery.text.trim(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
