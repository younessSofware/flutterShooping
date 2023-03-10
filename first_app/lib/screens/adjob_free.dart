import 'dart:convert';

import 'package:first_app/_shared/themes/colors.dart';
import 'package:first_app/_shared/themes/text_styles.dart';
import 'package:first_app/models/ad.dart';
import 'package:first_app/screens/list_v_loading.dart';
import 'package:flutter/material.dart';

class AdJobFree extends StatefulWidget {
  const AdJobFree({super.key});

  @override
  State<AdJobFree> createState() => _AdJobFreeState();
}

class _AdJobFreeState extends State<AdJobFree> {
  List<Ad> adsFree = [];
  int page = 1;
  final _scrollController = ScrollController();
  var loadingData = false;
  var moreLoadingData = false;
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
      print(34);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          page += 1;
          moreLoadingData = true;
        });

        getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: adsFree.isEmpty && !loadingData
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                  child: Text(
                'No ads special here',
                style: AppTextStyles.headerSmall
                    .copyWith(color: AppColors.primary),
              )),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 300,
                    child: adsFree.isNotEmpty
                        ? ListView.separated(
                            controller: _scrollController,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              if (index < adsFree.length) {
                                return ListDataItem(adsFree[index]);
                              } else {
                                if (moreLoadingData) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 32),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return Container();
                              }
                            }),
                            itemCount: adsFree.length + 1,
                          )
                        : ListVerticalLoading(),
                  ),
                ],
              ),
            ),
    );
  }

  getData() {
    var ad = Ad();
    var response;
    setState(() {
      if (page == 1) {
        loadingData = true;
      } else {
        moreLoadingData = true;
      }
    });
    ad.getAds(page, false).then((value) => {
          if (value.statusCode == 200 || value.statusCode == 201)
            {
              response = jsonDecode(value.body),
              setState(() {
                if (page == 1) {
                  loadingData = false;
                } else {
                  moreLoadingData = false;
                }
                for (var elm in response['Result']['data']) {
                  var newAd = Ad();
                  newAd.init(elm);
                  adsFree.add(newAd);
                }
              })
            }
        });
  }
}

class ListDataItem extends StatelessWidget {
  Ad ad;
  String test = '';
  ListDataItem(this.ad);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      ad.user.photo,
                      height: 72,
                      width: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ad.title,
                        style: AppTextStyles.titleBold.copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ad.description.length >= 20
                          ? '${ad.description.substring(0, 20)}...'
                          : ad.description,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              child: Text('${ad.workTime} hours',
                  maxLines: 2, style: AppTextStyles.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}
