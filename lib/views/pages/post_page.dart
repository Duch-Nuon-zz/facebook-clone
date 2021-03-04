import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:social_media/models/photo_model.dart';
import 'package:social_media/repositories/photo_repository.dart';
import 'package:social_media/views/pages/view_photo.dart';

// ignore: must_be_immutable
class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Future<List<PhotoModel>> photoList;
  PhotoRepository _photoRepository;
  @override
  void initState() {
    _photoRepository = PhotoRepository();
    photoList = _photoRepository.photoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PhotoModel>>(
      future: photoList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green[300],
            ),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length +
                1, // +1 because you are showing one extra widget
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 10),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      NetworkImage(snapshot.data[1].url),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    child: FlatButton(
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'What\'s on your mind?',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey,
                                              width: 0.5,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 1, height: 0.1),
                      Container(
                        height: 35,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.switch_video_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(' Live'),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            VerticalDivider(thickness: 1, width: 0.1),
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.photo_outlined,
                                      color: Colors.green,
                                    ),
                                    Text(' Photo'),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                            VerticalDivider(thickness: 1, width: 0.1),
                            Expanded(
                              child: TextButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.video_call_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(' Room'),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 5, top: 5, bottom: 5),
                                    child: Container(
                                      width: 120,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                            blurRadius: 7,
                                          ),
                                        ],
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle_outline,
                                              size: 35,
                                            ),
                                            Text(
                                              'Create a Story',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[800],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                index = index - 1; // index of actual post.
                                var data = snapshot.data[index];
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: GestureDetector(
                                    onTap: () {
                                      ViewPhoto.url1 = data.url;
                                      return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewPhoto(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(data.url),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            offset: Offset(3,
                                                0), // changes position of shadow
                                            blurRadius: 7,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              index = index - 1; // index of actual post.
              var data = snapshot.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data.url),
                            radius: 24,
                          ),
                          title: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Duch Nuon',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.1,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10 h ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                    Icon(
                                      Icons.group_outlined,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.more_horiz_outlined, size: 30),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ViewPhoto.url1 = data.url;
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewPhoto(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Image.network(
                          data.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Colors.white,
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("500  Likes"),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text('100  Comments'),
                                  SizedBox(width: 15),
                                  Text("50  Shares"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(height: 0.1, thickness: 1),
                    Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              label: Text('Like'),
                              icon: Icon(Icons.thumb_up_alt_outlined),
                              onPressed: () {},
                            ),
                          ),
                          VerticalDivider(width: 0.1),
                          Expanded(
                            child: TextButton.icon(
                              label: Text('Comment'),
                              icon: Expanded(
                                  child: Icon(Icons.mode_comment_outlined)),
                              onPressed: () {},
                            ),
                          ),
                          VerticalDivider(width: 0.1),
                          Expanded(
                            child: TextButton.icon(
                              label: Text('Share'),
                              icon: Icon(Icons.share_outlined),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600],
            highlightColor: Colors.grey[200],
            child: Container(
              child: Center(
                child: Text(
                  'Your Connection Fail',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
