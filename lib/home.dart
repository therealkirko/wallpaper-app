import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wallpaper/detail.dart';
import 'package:wallpaper/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  List<String> wallpapers = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,20,16,10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/profile.png'),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Brooklyn',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Brooklyn',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const[
                          Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '8 Photos',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: size.height * 0.48,
                        child: ListView.builder(
                          itemCount: wallpapers.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailPage(wallpaper: wallpapers[index]))
                                ),
                                child: Container(
                                  height: 100,
                                  width: size.width * .6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage(wallpapers[index]),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Center(
                        child: SizedBox(
                          width: size.width * .4,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Load all'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(primaryColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder> (
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2.0
                                  )
                                )
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const[
                          Icon(
                            MdiIcons.waterOutline,
                            color: Colors.white,
                            size: 25,
                          ),
                          CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Icon(
                              MdiIcons.adjust,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            MdiIcons.commentOutline,
                            color: Colors.white,
                            size: 20
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}