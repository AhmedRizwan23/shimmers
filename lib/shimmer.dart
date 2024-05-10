import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final int rowNumbers;
  final int columns;
  final double? height;
  final double? rowHeight;
  final double? columwidth;

  const CustomShimmer(
      {super.key,
      required this.rowNumbers,
      required this.columns,
      this.height,
      this.rowHeight,
      this.columwidth});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      child: Container(
        height: height ?? MediaQuery.of(context).size.height,
        width: columwidth ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.0.r, vertical: 8.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(rowNumbers, (rowIndex) {
            return buildRow(rowHeight: rowHeight);
          }),
        ),
      ),
    );
  }

  Widget buildRow({double? rowHeight}) {
    return Row(
      children: List.generate(columns, (colIndex) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            height: rowHeight ?? 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        );
      }),
    );
  }
}
