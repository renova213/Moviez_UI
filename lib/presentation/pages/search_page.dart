import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/datasources/movie_local_data_source.dart';
import '../widgets/watch_list_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watchList = MovieLocalDataSourceImpl().getWatchListMovies();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              _searchBar(),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Text(
                    "Search Result",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Text(
                    "(2)",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: WatchListCard(watchListMovie: watchList),
              ),
              Center(
                child: SizedBox(
                  height: 50.h,
                  width: 220.w,
                  child: _suggestionButton(context),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _searchBar() {
    return TextField(
      onSubmitted: (value) {
        myFocusNode.unfocus();
      },
      focusNode: myFocusNode,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-1 ]'),
        ),
      ],
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        hintText: "Search Movie ...",
        prefixIcon: Icon(
          CupertinoIcons.search,
          size: 22.sp,
          color: Colors.black,
        ),
      ),
    );
  }

  ElevatedButton _suggestionButton(context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.r),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          Color(0xff0D0846),
        ),
      ),
      onPressed: () {},
      child: Text(
        "Suggest Movie",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
