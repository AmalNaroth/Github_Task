import 'package:flutter/material.dart';
import 'package:github_task/core/resources/size_utils.dart';
import 'package:searchfield/searchfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              Container(
                height: mWidth,
                child: Center(
                  child: Image.asset(
                    "assets/images/github-logo.png",
                    height: mWidth! * .45,
                  ),
                ),
              ),
              Form(
                child: SearchField(
                  suggestions: [],
                  suggestionState: Suggestion.expand,
                  textInputAction: TextInputAction.next,
                  hint: 'Search',
                  searchStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  validator: (x) {},
                  searchInputDecoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey, // Set the hint text color to white
                    ),
                  ),
                  maxSuggestionsInViewPort: 6,
                  itemHeight: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
