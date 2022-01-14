import 'package:flutter/material.dart';

import '../../../api_services/api_services.dart';
import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/helper_imports.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List listData = [];
  bool isLoading = false;

  _fetchApiData() async {
    listData = await ApiServices.fetchData();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    _fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.fetchDataFromApi),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: isLoading
          ? Container(
              padding: PaddingConstants.screen,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(Dimensions.px8),
                    decoration: BoxDecoration(color: ColorConstants.alto),
                    child: Column(
                      children: [
                        Container(
                          height: Dimensions.px90,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.px30),
                            child: Image.network(
                                '${listData[index]['download_url']}'),
                          ),
                        ),
                        SizeHelper.h05(),
                        Text(
                          'ID:' '${listData[index]['id']}',
                          style: TextStyle(fontSize: Dimensions.px16),
                        ),
                        SizeHelper.h05(),
                        Text(
                          'Author:' '${listData[index]['author']}',
                          style: TextStyle(fontSize: Dimensions.px16),
                        ),
                      ], //just for testing, will fill with image later
                    ),
                  );
                },
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
