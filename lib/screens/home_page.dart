import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_clone/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 24,
            height: 24,
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
        elevation: 0,
        backgroundColor: Color(0xff1C1F2E),
        centerTitle: false,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      barrierColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: DraggableScrollableSheet(
                            initialChildSize: 0.4,
                            minChildSize: 0.2,
                            maxChildSize: 0.7,
                            builder: (context, controler) {
                              return ShareBottomSheet(controller: controler);
                            },
                          ),
                        );
                      });
                },
                child: Text('Open BottomSheet'),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    _getPostHeader(),
                    SizedBox(
                      height: 21,
                    ),
                    _getPost('post_covermain'),
                  ],
                );
              }, childCount: 4),
            )
          ],
        ),
      ),
    );
  }

  //Widget have Written Below

  Widget _getPostListView() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: 21,
            ),
            _getPostHeader(),
            SizedBox(
              height: 21,
            ),
            _getPost('post_covermain'),
          ],
        );
      },
    );
  }

  Widget _getPost(String photoOfpost) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Container(
            height: 440,
            width: 394,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    child: Image.asset('images/$photoOfpost.png'),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Image.asset('images/icon_video.png'),
                  ),
                  Positioned(
                    bottom: 17,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.5),
                                Color.fromRGBO(255, 255, 255, 0.2)
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Row(
                                children: [
                                  Image.asset('images/icon_heart.png'),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '3.5 K',
                                    style: TextStyle(
                                        fontFamily: 'GB',
                                        fontSize: 14,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Row(
                                children: [
                                  Image.asset('images/icon_comments.png'),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '1.4 K',
                                    style: TextStyle(
                                        fontFamily: 'GB',
                                        fontSize: 14,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              Image.asset('images/icon_share.png'),
                              SizedBox(
                                width: 60,
                              ),
                              Image.asset('images/icon_save.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          _getDottedBorder(), //4pixels padding+2 pixels stroke= 44-6=38
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Erfan Izadi',
                  style: TextStyle(
                      fontFamily: 'GB', color: Colors.white, fontSize: 15),
                ),
                Text(
                  'عرفان ایزدی - برنامه نویس فلاتر',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png')
        ],
      ),
    );
  }

  Widget _getDottedBorder() {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: Color(0xffF35383),
      dashPattern: [40, 10],
      strokeWidth: 2,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(16.5),
        ),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset('images/user.png'),
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _getStoryBox() : _getStoryListBox();
        },
      ),
    );
  }

  Widget _getStoryBox() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                child: Image.asset('images/icon_plus.png'),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Text(
            'Your Story',
            style:
                TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'GM'),
          )
        ],
      ),
    );
  }
}

Widget _getStoryListBox() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    child: Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          color: Color(0xffF35383),
          dashPattern: [40, 10],
          strokeWidth: 2,
          radius: Radius.circular(17),
          padding: EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(16.5),
            ),
            child: Container(
              height: 60,
              width: 60,
              child: Image.asset('images/user.png'),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Erfan',
          style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'GM'),
        )
      ],
    ),
  );
}
