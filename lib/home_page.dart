import 'package:flutter/material.dart';

import 'package:objetos_3d/view_images_objects.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();

  int _currentPage = 0;

  List<String> listObject = [
    "assets/Astronaut/Astronaut.obj",
    "assets/earth/earth_ball.obj",
    "assets/material/model.obj",
  ];

  List<String> listName = [
    "Astronauta",
    "Globo Terra",
    "Carro",
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Objetos 3D",
          style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: height,
              child: PageView.builder(
                controller: _pageController,
                itemCount: listObject.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, currentIndex) {
                  return ViewImagesObjects(
                    fileName: listObject[currentIndex],
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.chevron_left_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () async {
                    setState(() {
                      if(_currentPage==0){
                        _pageController.animateToPage(
                          (listObject.length-1),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                      }else{
                        _pageController.jumpToPage(_currentPage-1);
                      }
                    });
                  },
                ),
                const Spacer(),
                Text(
                  listName[_currentPage],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () async {
                    if(_currentPage==(listObject.length-1)){
                      _pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    }else{
                      _pageController.jumpToPage(_currentPage+1);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}