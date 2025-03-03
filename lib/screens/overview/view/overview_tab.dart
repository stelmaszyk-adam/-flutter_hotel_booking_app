import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/core/l10n/l10n.dart';
import 'package:hotel_booking_app/screens/home/cubit/home_cubit.dart';
import 'package:hotel_booking_app/screens/overview/widgets/overview_container.dart';

@RoutePage()
class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder:
          (context, state) => switch (state) {
            HomeInitState() || HomeLoadingState() => Center(child: CircularProgressIndicator()),
            HomeFailureState() => Center(
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
            ),
            HomeSuccessState() => OverviewContainer(state: state),
          },
    );
  }
}
