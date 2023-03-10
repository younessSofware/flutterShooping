import 'package:first_app/_shared/widgets/shimmer_page.dart';
import 'package:flutter/material.dart';

class ListVerticalLoading extends StatefulWidget {
  const ListVerticalLoading({super.key});

  @override
  State<ListVerticalLoading> createState() => _ListVerticalLoadingState();
}

class _ListVerticalLoadingState extends State<ListVerticalLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 10; i++)
            ShimmerEffect(
              child: SizedBox(
                height: 120,
                child: Card(
                  margin: const EdgeInsets.all(15),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
