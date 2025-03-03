import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/assets/assets.gen.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/core/theme/app_colors.dart';
import 'package:hotel_booking_app/core/theme/app_theme_extention.dart';

const _rateValue = 5.0;
const _numberOfStars = 5;

class HotelCard extends StatelessWidget {
  const HotelCard({
    this.thumbnailImage,
    required this.name,
    required this.destination,
    required this.buttonText,
    this.onClickFavor,
    this.days,
    this.nights,
    this.roomType,
    this.boardingType,
    this.pricePerPerson,
    this.totalPrice,
    this.flightIncluded,
    this.adultCount,
    this.childrenCount,
    this.reviewsCount,
    this.score,
    this.scoreDescription,
    this.isFavor = false,
    super.key,
  });

  final String? thumbnailImage;
  final String name;
  final String destination;
  final int? days;
  final int? nights;
  final String? roomType;
  final String? boardingType;
  final double? pricePerPerson;
  final double? totalPrice;
  final bool? flightIncluded;
  final int? adultCount;
  final int? childrenCount;
  final int? reviewsCount;
  final double? score;
  final String? scoreDescription;
  final VoidCallback? onClickFavor;
  final String buttonText;
  final bool isFavor;

  bool get _isDaysNotNull => days != null;
  bool get _isNightsNotNull => nights != null;
  bool get _isRoomTypeNotNull => roomType != null;
  bool get _isBoardingTypeNotNull => boardingType != null;
  bool get _isPricePerPersonNotNull => pricePerPerson != null;
  bool get _isTotalPriceNotNull => totalPrice != null;
  bool get _isFlightIncludedNotNull => flightIncluded != null;
  bool get _isAdultCountNotNull => adultCount != null;
  bool get _isChildrenCountNotNull => childrenCount != null;
  bool get _isReviewsCountNotNull => reviewsCount != null;
  bool get _isScoreNotNull => score != null;
  bool get _isScoreDescriptionNotNull => scoreDescription != null;

  bool get _isBiggerDescription => ([
    _isDaysNotNull,
    _isNightsNotNull,
    _isRoomTypeNotNull,
    _isBoardingTypeNotNull,
    _isAdultCountNotNull,
    _isChildrenCountNotNull,
    _isFlightIncludedNotNull,
    _isTotalPriceNotNull,
    _isPricePerPersonNotNull,
  ].any((check) => check));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (thumbnailImage != null)
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Image.network(thumbnailImage!),
                    if (onClickFavor != null)
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: onClickFavor,
                          icon: Icon(switch (isFavor) {
                            true => Icons.favorite,
                            false => Icons.favorite_border,
                          }, color: AppColors.white),
                          iconSize: 30,
                        ),
                      ),
                    if (_isReviewsCountNotNull || _isScoreNotNull || _isScoreDescriptionNotNull)
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _Score(reviewsCount: reviewsCount, score: score, scoreDescription: scoreDescription),
                      ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ...[for (int index = 0; index < _numberOfStars; index++) Assets.icons.starPng.image(width: 20)],
                    Assets.icons.helpOutlinePng.image(width: 20),
                  ],
                ),
                Text(name, style: context.theme.textTheme.labelMedium),
                Text(destination, style: context.theme.textTheme.labelSmall),
                Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: Divider(color: AppColors.lightGrey)),
                if (_isBiggerDescription) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_isDaysNotNull || _isNightsNotNull)
                              _DescriptionSingleLine(
                                firstText: '$days ${context.l10n.day}',
                                secondText: '$nights ${context.l10n.nights}',
                              ),
                            if (_isRoomTypeNotNull || _isBoardingTypeNotNull)
                              _DescriptionSingleLine(firstText: roomType ?? '', secondText: boardingType),
                            if (_isAdultCountNotNull || _isChildrenCountNotNull)
                              _DescriptionSingleLine(
                                firstText: '$adultCount ${context.l10n.adult}, $childrenCount ${context.l10n.children}',
                                secondText: switch (flightIncluded ?? false) {
                                  true => '${context.l10n.isFlight}',
                                  false => '',
                                },
                              ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'ab ',
                                  style: context.theme.textTheme.labelSmall?.copyWith(color: AppColors.black),
                                ),
                                TextSpan(
                                  text: '$totalPrice €',
                                  style: context.theme.textTheme.labelLarge?.copyWith(color: AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '$pricePerPerson ${context.l10n.perPerson}',
                            style: context.theme.textTheme.labelSmall?.copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
                ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(width: double.infinity, child: Center(child: Text(buttonText))),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Score extends StatelessWidget {
  const _Score({required this.reviewsCount, required this.score, required this.scoreDescription});

  final int? reviewsCount;
  final double? score;
  final String? scoreDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.green,
            borderRadius: BorderRadius.circular(2),
          ),
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tag_faces_rounded, color: AppColors.white, size: 14),
              SizedBox(width: 2),
              Text(
                '$score / $_rateValue',
                style: context.theme.textTheme.bodySmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Text(
          '$scoreDescription ($reviewsCount ${context.l10n.reviewsCount})',
          style: context.theme.textTheme.bodySmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _DescriptionSingleLine extends StatelessWidget {
  const _DescriptionSingleLine({required this.firstText, required this.secondText});

  final String firstText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Flexible(child: Text(firstText, style: context.theme.textTheme.bodySmall)),
          if (secondText != null) ...[
            VerticalDivider(),
            Flexible(child: Text(secondText!, style: context.theme.textTheme.bodySmall)),
          ],
        ],
      ),
    );
  }
}
