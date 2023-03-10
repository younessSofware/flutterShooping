import 'package:first_app/_shared/widgets/shimmer_page.dart';
import 'package:flutter/material.dart';

class ListHorizontalLoading extends StatefulWidget {
  const ListHorizontalLoading({super.key});

  @override
  State<ListHorizontalLoading> createState() => _ListHorizontalLoadingState();
}

class _ListHorizontalLoadingState extends State<ListHorizontalLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 2; i++)
            ShimmerEffect(
              child: SizedBox(
                height: 250.0,
                width: 300.0,
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
