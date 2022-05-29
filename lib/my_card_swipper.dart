import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_test_app/pet_models.dart';
import './banner_image_model.dart';

class MyCardSwiper extends StatelessWidget {
  const MyCardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var names = ["Parrot", "Dog", "Cat", "Bird", "Fish", "Lion"];
    final List<String> images = [
      'https://cdn.pixabay.com/photo/2019/08/07/14/11/dog-4390885__340.jpg',
      'https://cdn.pixabay.com/photo/2014/10/30/02/52/macaw-508877__340.jpg',
      'https://cdn.pixabay.com/photo/2020/01/18/15/43/parakeet-4775591__340.jpg',
      'https://cdn.pixabay.com/photo/2020/10/28/14/43/cattle-5693737__340.jpg'
    ];
    List<Pet> pets = [
      Pet(
        name: "Cat",
        image: images[0],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        price: 100,
        category: names[0],
      ),
      Pet(
        name: "Dog",
        image: images[1],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        price: 100,
        category: names[1],
      ),
      Pet(
        name: "Parrot",
        image: images[2],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        price: 100,
        category: names[2],
      ),
      Pet(
        name: "Bird",
        image: images[3],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        price: 100,
        category: names[3],
      ),
      Pet(
        name: "Fish",
        image: images[3],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        price: 100,
        category: names[3],
      ),
    ];
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text('Pet Market'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Swiper(
                itemCount: sliderItems.length,
                autoplay: true,
                autoplayDelay: 5000,
                curve: Curves.easeIn,
                layout: SwiperLayout.DEFAULT,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.black54,
                  ),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    semanticContainer: true,
                    elevation: 1,
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      left: 10,
                      right: 10,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: BannerImageModel(
                      sliderItems[index],
                      fit: BoxFit.cover,
                      width: 200,
                      height: 300,
                    ),
                  );
                },
              ),
            ),
            // category list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...names.map((e) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            // grid view of pets
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
              ),
              itemCount: pets.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Card(
                semanticContainer: true,
                elevation: 1,
                color: Colors.pink[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        pets[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pets[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Text(
                            pets[index].price.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
