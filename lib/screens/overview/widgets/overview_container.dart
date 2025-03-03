import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/core/theme/app_theme_extention.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewContainer extends StatelessWidget {
  const OverviewContainer({required this.state, super.key});

  final HomeSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              '${state.hotels.list.length} ${context.l10n.overviewTitle}',
              style: context.theme.textTheme.headlineMedium,
            ),
          ),
          SliverList.separated(
            itemCount: state.hotels.list.length,
            separatorBuilder: (_, _) => SizedBox(height: 24),
            itemBuilder: (context, index) {
              final hotel = state.hotels.list[index];
              return HotelCard(
                name: hotel.name,
                destination: hotel.destination,
                days: hotel.days,
                nights: hotel.nights,
                roomType: hotel.roomType,
                boardingType: hotel.boardingType,
                pricePerPerson: hotel.pricePerPerson,
                totalPrice: hotel.totalPrice,
                flightIncluded: hotel.flightIncluded,
                adultCount: hotel.adultCount,
                childrenCount: hotel.childrenCount,
                thumbnailImage: hotel.thumbnailImage,
                buttonText: context.l10n.overviewButton,
                isFavor: state.favor.contains(hotel.id),
                onClickFavor: () => context.read<HomeCubit>().changeStatusOfFavor(hotel.id),
              );
            },
          ),
        ],
      ),
    );
  }
}
