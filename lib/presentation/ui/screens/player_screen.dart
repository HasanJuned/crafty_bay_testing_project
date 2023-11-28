import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          backgroundColor: Colors.white24,
          title: const Text('Player Screen'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Image.asset('assets/images/stadium.jpg'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          color: Colors.yellowAccent, width: 3),
                                    ),
                                    child: Image.asset(
                                      'assets/images/th.jpg',
                                      height: 110,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Tamim Iqbal',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Bangladesh',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '24k',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Followers',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '220k',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Following',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 200,
                            child: ListTile(
                              tileColor: Colors.white,
                              trailing: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white24,
                                    side:
                                        const BorderSide(color: Colors.yellowAccent)),
                                child: const Text('Follow'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                readOnly: true,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  hintText: 'Analyse Your Game Performence',
                                  hintStyle: TextStyle(color: Colors.white, letterSpacing: 0.9),
                                  border:
                                      OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow),
                              child: const Text(
                                'Insights',
                                  style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const Column(
                    children: [
                       TabBar(
                        isScrollable: true,
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.yellowAccent,
                          labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          tabs: [
                            Tab(
                              text: 'Info',
                            ),
                            Tab(
                              text: 'Stats',
                            ),
                            Tab(
                              text: 'Awards',
                            ),
                            Tab(
                              text: 'Badges',
                            ),
                            Tab(
                              text: 'Photos',
                            ),
                          ]),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Expanded(
                          child: TabBarView(
                            children: [
                              Center(
                                child: Text('Info'),
                              ),
                              Center(
                                child: Text('Stats'),
                              ),
                              Center(
                                child: Text('Awards'),
                              ),
                              Center(
                                child: Text('Badges'),
                              ),
                              Center(
                                child: Text('Photos'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  for(int i=0; i<11; i++)
                    ElevatedButton(onPressed: (){}, child: const Text('Scroll')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
