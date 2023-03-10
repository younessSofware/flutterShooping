// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:first_app/models/ad.dart';
import 'package:first_app/screens/list_h_loading.dart';
import 'package:flutter/material.dart';

class AdJobSpecial extends StatefulWidget {
  const AdJobSpecial({super.key});

  @override
  State<AdJobSpecial> createState() => _AdJobSpecialState();
}

class _AdJobSpecialState extends State<AdJobSpecial> {
  List<Ad> adsSpecial = [];
  var loadingData = false;
  int page = 1;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _setupScrollDownToLoadMoreItems();
      getData();
    });
  }

  void _setupScrollDownToLoadMoreItems() {
    if (!_scrollController.hasClients) return;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          page += 1;
        });
        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return adsSpecial.isEmpty && !loadingData
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
                child: Text(
              'No ads special here',
              style:
                  AppTextStyles.headerSmall.copyWith(color: AppColors.primary),
            )),
          )
        : SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                    height: 250.0,
                    child: !loadingData
                        ? ListView.separated(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              if (index < adsSpecial.length) {
                                return ListDataItem(adsSpecial[index]);
                              } else {
                                if (adsSpecial.isEmpty) {}
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }
                            }),
                            itemCount: adsSpecial.length + 1,
                          )
                        : ListHorizontalLoading()),
              ],
            ),
          );
  }

  getData() {
    var ad = Ad();
    var response;
    setState(() {
      loadingData = true;
    });

    ad.getAds(page, true).then((value) => {
          if (value.statusCode == 200 || value.statusCode == 201)
            {
              response = jsonDecode(value.body),
              setState(() {
                loadingData = false;

                for (var elm in response['Result']['data']) {
                  var newAd = Ad();
                  newAd.init(elm);
                  adsSpecial.add(newAd);
                }
              })
            }
        });
  }
}

// ignore: must_be_immutable
class ListDataItem extends StatelessWidget {
  Ad ad;
  String test = '';
  ListDataItem(this.ad, {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, top: 10, bottom: 10, right: 100),
          child: Row(
            children: [
              Image.network(
                ad.user.photo,
                height: 72,
                width: 72,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  ad.user.username,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: Text(
            ad.title,
            style: AppTextStyles.titleBold,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("${ad.workTime} hours"),
                  Icon(
                    Icons.chair_alt_sharp,
                    color: AppColors.grey,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Text(ad.user.country.toString()),
                  Icon(
                    Icons.location_on,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
