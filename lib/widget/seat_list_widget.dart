import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hraccoon/model/seat_model.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_viewmodel.dart';
import 'button_main_action.dart';

class SeatListWidget extends StatelessWidget {
  final Seat seat;

  const SeatListWidget({required this.seat});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final isExpanded = viewModel.expandedSeatNum == seat.number;

    return Column(
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE4F1FA), width: 1),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: seat.isCurrent ? Color(0xFF1FFA69) : Color(0xFFD9D9D9),
                ),
                child: Center(
                  child: Text(
                    seat.number.toString(),
                    style: const TextStyle(
                      fontFamily: 'KanitRegular',
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "오피스 : ${seat.office}",
                style: const TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "층 : ${seat.floor}",
                style: const TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  if (isExpanded) {
                    viewModel.collapseSeat();
                  } else {
                    viewModel.expandSeat(seat.number);
                  }
                },
                icon: SvgPicture.asset(
                  isExpanded
                      ? 'assets/icons/keyboard_arrow_up.svg'
                      : 'assets/icons/keyboard_arrow_down.svg',
                  color: Color(0xFF2659F1),
                ),
              ),
            ],
          ),
        ),
        if (isExpanded)
          buttonMainAction(
            context: context,
            text: "사용하기",
            onPressed: () {
              viewModel.selectSeat(seat.number);
              viewModel.collapseSeat();
            },
          ),
      ],
    );
  }
}