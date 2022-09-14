import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_widget/common/navigator_fade_helper.dart';
import 'package:material_widget/data/datasources/movie_local_data_source.dart';
import 'package:material_widget/presentation/pages/search_page.dart';
import 'package:material_widget/presentation/widgets/banner_card.dart';
import 'package:material_widget/presentation/widgets/watch_list_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final bannerList = MovieLocalDataSourceImpl().getBannerListMovies();
  final watchList = MovieLocalDataSourceImpl().getWatchListMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appbar(context),
              SizedBox(
                height: 26.h,
              ),
              SizedBox(
                height: 250.h,
                child: BannerCard(
                  bannerList: bannerList,
                ),
              ),
              Text(
                "From Disney",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(child: WatchListCard(watchListMovie: watchList)),
            ],
          ),
        ),
      ),
    );
  }

  Row _appbar(context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Moviez",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Watch Much Easier",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              NavigatorFadeHelper(
                child: const SearchPage(),
              ),
            );
          },
          icon: Icon(
            CupertinoIcons.search,
            size: 22.sp,
          ),
        ),
      ],
    );
  }
}
