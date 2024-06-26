import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hraccoon/model/seat_model.dart';
import 'package:provider/provider.dart';
import 'package:hraccoon/viewmodel/home_viewmodel.dart';

import 'button_main_action.dart';

class SeatListWidget extends StatelessWidget {
  final Seat seat;

  const SeatListWidget({required this.seat});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();
    final isExpanded = viewModel.expandedSeatNum == seat.number;
    final bool isRedSeat = seat.isCurrent && seat.employeeId != '99999';
    final Color seatColor = seat.isCurrent
        ? (isRedSeat ? Color(0xFFFF3535) : Color(0xFF1FFA69))
        : Color(0xFFD9D9D9);

    return Column(
      children: [
        Container(
          height: 60,
          decoration: const BoxDecoration(
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
                  color: seatColor,
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
          seat.isCurrent
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF2659F1)),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        Text(
                          '사번: ${seat.employeeId}',
                          style: const TextStyle(
                            fontFamily: 'KanitRegular',
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                        const Spacer(flex: 1),
                        Text(
                          '사원명: ${seat.employeeName}',
                          style: const TextStyle(
                            fontFamily: 'KanitRegular',
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                        const Spacer(flex: 2),
                        if (seat.employeeId == '99999')
                          buttonMainAction(
                            context: context,
                            text: "취소하기",
                            onPressed: () {
                              viewModel.cancelSeat();
                              viewModel.collapseSeat();
                            },
                          ),
                      ],
                    ),
                  ),
                ) : buttonMainAction(
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
