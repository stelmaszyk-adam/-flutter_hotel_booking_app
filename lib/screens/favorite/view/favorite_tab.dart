import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';
import 'package:hotel_booking_app/widgets/hotel_card.dart';

@RoutePage()
class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case HomeInitState() || HomeLoadingState():
            return Center(child: CircularProgressIndicator());
          case HomeFailureState():
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.l10n.errorText),
                  ElevatedButton(
                    onPressed: () => context.read<HomeCubit>().init(),
                    child: SizedBox(width: double.infinity, child: Center(child: Text(context.l10n.tryAgain))),
                  ),
                ],
              ),
            );
          case HomeSuccessState():
            final favorHotels = state.hotels.list.where((hotel) => state.favor.contains(hotel.id)).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.separated(
                itemCount: favorHotels.length,
                separatorBuilder: (_, __) => SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final hotel = favorHotels[index];
                  return HotelCard(
                    name: hotel.name,
                    destination: hotel.destination,
                    buttonText: context.l10n.favorButton,
                    thumbnailImage: hotel.thumbnailImage,
                    reviewsCount: hotel.reviewsCount,
                    score: hotel.score,
                    scoreDescription: hotel.scoreDescription,
                    isFavor: true,
                    onClickFavor: () => context.read<HomeCubit>().changeStatusOfFavor(hotel.id),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
