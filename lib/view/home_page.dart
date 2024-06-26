import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hraccoon/model/seat_model.dart';
import 'package:hraccoon/viewmodel/home_viewmodel.dart';
import 'package:hraccoon/widget/seat_list_widget.dart';
import 'package:hraccoon/widget/button_main_action.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              padding: MaterialStateProperty.all(const EdgeInsets.only(right: 28)),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Color(0xFF2659F1),
                fontFamily: 'KanitLight',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // Close overlays
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    _buildDropdown(context, true),
                    const Spacer(),
                    _buildDropdown(context, false),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "| 내 좌석 정보",
                style: TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 20,
                  height: 1.4,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(height: 8),
              _buildCurrentSeatInfo(context),
              const SizedBox(height: 10),
              buttonMainAction(
                context: context,
                text: "취소하기",
                onPressed: context.watch<HomeViewModel>().isSeatCanceled
                    ? null
                    : () => context.read<HomeViewModel>().cancelSeat(),
              ),
              const SizedBox(height: 10),
              Column(
                children: context.watch<HomeViewModel>().seats.map((seat) {
                  return SeatListWidget(seat: seat);
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(BuildContext context, bool isOffice) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();
    final items = isOffice ? HomeViewModel.officeDropdownList : HomeViewModel.floorDropdownList;
    final value = isOffice ? viewModel.selectedOffice : viewModel.selectedFloor;
    return DropdownButton<String>(
      value: value,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          if (isOffice) {
            viewModel.setSelectedOffice(newValue);
          } else {
            viewModel.setSelectedFloor(newValue);
          }
        }
      },
    );
  }

  Widget _buildCurrentSeatInfo(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    if (viewModel.currentSeatNum == null || viewModel.isSeatCanceled) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF2659F1)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            "사용하고 있는 좌석이 없습니다",
            style: TextStyle(
              fontFamily: 'KanitRegular',
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
      );
    }

    final Seat currentSeat = viewModel.seats.firstWhere((seat) => seat.number == viewModel.currentSeatNum);

    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2659F1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF1FFA69),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                currentSeat.number.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 24,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "오피스 : ${currentSeat.office}",
                style: const TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 20,
                  height: 1.2,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                "층 : ${currentSeat.floor}",
                style: const TextStyle(
                  fontFamily: 'KanitRegular',
                  fontSize: 20,
                  height: 1.2,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}