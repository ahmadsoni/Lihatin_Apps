import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lihatin/cubit/seat_cubit.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  // Note 0. Available 1. Selected 2. Unavailable
  final String id;
  final bool isAvailable;
  const SeatItem({
    super.key,
    this.isAvailable = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    backgroudColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAilableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnvailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () => {
        if (isAvailable)
          {
            context.read<SeatCubit>().selectSeat(id),
          }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroudColor(),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor(),
          ),
        ),
        child: child(),
      ),
    );
  }
}
