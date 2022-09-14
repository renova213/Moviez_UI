import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_widget/presentation/widgets/skeleton_container.dart';

import '../../data/models/movie_model.dart';

class BannerCard extends StatelessWidget {
  final List<MovieModel> bannerList;
  const BannerCard({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, _) => SizedBox(
        width: 24.w,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: bannerList.length,
      itemBuilder: (context, index) => _card(index, context),
    );
  }

  Column _card(int index, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 250.w,
          height: 170.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: bannerList[index].image,
              placeholder: (context, _) => SkeletonContainer(
                width: 250.w,
                height: 170.h,
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorWidget: (context, __, _) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 250.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 25.h,
                      width: 160.w,
                      child: Text(
                        bannerList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Text(
                    bannerList[index].genre,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
              RatingBarIndicator(
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellow.shade800,
                ),
                itemSize: 16.sp,
                rating: bannerList[index].rating,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
