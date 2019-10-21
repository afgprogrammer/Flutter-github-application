import 'package:flutter/material.dart';
import 'package:github_following/providers/following_provider.dart';
import 'package:github_following/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FollowingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FollowingProvider followingProvider = Provider.of<FollowingProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              brightness: Brightness.light,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.grey,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.white,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(userProvider.user.avatar_url),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(userProvider.user.login, style: TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 600,
                  child:
                  !followingProvider.loading ?
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: followingProvider.users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[200]))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(followingProvider.users[index].avatar_url),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text(followingProvider.users[index].login, style: TextStyle(fontSize: 20, color: Colors.grey[700]),),
                              ],
                            ),
                            Text('Following', style: TextStyle(color: Colors.blue),)
                          ],
                        ),
                      );
                    },
                  ) :
                  Container(child: Align(child: Text('Data is loading ...'))),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}