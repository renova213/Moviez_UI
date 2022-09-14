import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_widget/data/models/movie_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_widget/presentation/widgets/skeleton_container.dart';

class WatchListCard extends StatelessWidget {
  final List<MovieModel> watchListMovie;
  const WatchListCard({super.key, required this.watchListMovie});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, _) => SizedBox(
        height: 20.h,
      ),
      itemBuilder: (context, index) => _watchCard(index, context),
      itemCount: watchListMovie.length,
    );
  }

  SizedBox _watchCard(index, context) {
    return SizedBox(
      height: 120.h,
      child: Row(
        children: [
          SizedBox(
            width: 90.w,
            height: 120.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: watchListMovie[index].image,
                placeholder: (context, _) => SkeletonContainer(
                  width: 90.w,
                  height: 115.h,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                errorWidget: (context, __, _) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchListMovie[index].title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  watchListMovie[index].genre,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey),
                ),
                const Spacer(),
                RatingBarIndicator(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.yellow.shade800,
                  ),
                  itemSize: 16.sp,
                  rating: watchListMovie[index].rating,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
