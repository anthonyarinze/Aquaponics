// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:aquaponics/services/application_bloc.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>
    with SingleTickerProviderStateMixin {
  DateTime currentTime = DateTime.now();
  late TabController _tabController;

  @override
  void initState() {
    info();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  var client = ApplicationBloc();
  // ignore: prefer_typing_uninitialized_variables
  var data;

  info() async {
    var position = await ApplicationBloc().determinePosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    String formatter = DateFormat('Hm').format(now);
    String result = Jiffy(currentTime).format('MMMM dd yyyy');
    return SafeArea(
      child: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFdfdfdf), Color(0xFF26005f)],
                  stops: [0.5, 0.5],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          "${data?.cityName}",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xFF26005f),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          result,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF26005f),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.grey,
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.0),
                                color: const Color(0xFF26005f),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: const Color(0xFF26005f),
                              tabs: const [
                                Tab(text: "Forecast"),
                                Tab(text: "Air Quality"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              //First tab bar view widget
                              Column(
                                children: [
                                  Image.network(
                                    'https:${data?.icon}',
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text("Error");
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BuildTempConditions(
                                          title: "Temp",
                                          content: "${data?.temp}°C",
                                        ),
                                        BuildTempConditions(
                                          title: "Wind",
                                          content: "${data?.wind}km/h",
                                        ),
                                        BuildTempConditions(
                                          title: "Humidity",
                                          content: "${data?.humidity}%",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BuildTempConditions(
                                          title: "Pressure",
                                          content: "${data?.pressure}",
                                        ),
                                        BuildTempConditions(
                                          title: "Precipitation",
                                          content: "${data?.precipitation}mm",
                                        ),
                                        BuildTempConditions(
                                          title: "Last Updated",
                                          content: "${data?.lastUpdate}",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              //Second tab bar view widget
                              const Center(
                                child: Text("Air Quality"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class BuildHourlyUpdate extends StatelessWidget {
  final String title;
  final String content;
  final String source;
  const BuildHourlyUpdate({
    Key? key,
    required this.title,
    required this.content,
    required this.source,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width / 3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.network(
            source,
            errorBuilder: (context, error, stackTrace) {
              return const Text("Error");
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text("$content°C"),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildTempConditions extends StatelessWidget {
  final String title;
  final String content;
  const BuildTempConditions({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width / 3.2,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
