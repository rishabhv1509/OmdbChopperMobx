import 'package:chopperexample/models/mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:async_loader/async_loader.dart';

class Post extends StatelessWidget {
  final myController = TextEditingController();
  final MobXData mobXData = MobXData();
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      GlobalKey<AsyncLoaderState>();

  final GlobalKey<AsyncLoaderState> _asyncLoaderState1 =
      GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async =>
          await mobXData.onPressed(myController.text, context),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) => new Text('No movie found'),
      renderSuccess: ({data}) => Container(),
    );

    var _asyncLoader1 = new AsyncLoader(
      key: _asyncLoaderState1,
      initState: () async =>
          await mobXData.onPressed(myController.text, context),
      renderLoad: () => new CircularProgressIndicator(),
      renderError: ([error]) => new Text('No movie found'),
      renderSuccess: ({data}) => Container(
            color: Colors.blue,
            child: Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('OMDB Api with MobX and Chopper'),
        actions: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: _asyncLoader1,
          )
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          print("object");
          return ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ),
                            hintText: "Type movie name",
                            hintStyle: TextStyle(color: Colors.blue),
                            fillColor: Colors.white),
                        controller: myController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          if (myController.text.length >= 3) {
                            // print(myController.text);
                            _asyncLoaderState.currentState
                                .reloadState()
                                .whenComplete(() => print('finished reload'));
                            _asyncLoaderState1.currentState
                                .reloadState()
                                .whenComplete(() => print('finished reload'));
                            await mobXData.onPressed(
                                myController.text, context);

                            myController.clear();
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text('Enter atlest 3 characters'),
                                  );
                                });
                          }
                        },
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                )),
              ),
              Center(
                child:
                    // mobXData.isObjectEmpty()
                    //     ? _asyncLoader
                    // :
                    Column(
                  children: <Widget>[
                    _asyncLoader,
                    (mobXData.apiDataItem.title == null)
                        ? Container(
                            child: Text('No movie found'),
                          )
                        : Column(
                            children: <Widget>[
                              (mobXData.apiDataItem.response == "False")
                                  ? Center(
                                      child: Text('Movie not found'),
                                    )
                                  : Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.network((mobXData
                                                  .apiDataItem ==
                                              null)
                                          ? ""
                                          : "${mobXData.apiDataItem.poster}"),
                                    ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((mobXData.apiDataItem == null)
                                    ? ""
                                    : "Title: ${mobXData.apiDataItem.title}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((mobXData.apiDataItem == null)
                                    ? ""
                                    : "Director: ${mobXData.apiDataItem.director}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((mobXData.apiDataItem == null)
                                    ? ""
                                    : "Released: ${mobXData.apiDataItem.released}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((mobXData.apiDataItem == null)
                                    ? ""
                                    : "Plot: ${mobXData.apiDataItem.plot}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text((mobXData.apiDataItem == null)
                                    ? ""
                                    : "Rated: ${mobXData.apiDataItem.rated}"),
                              ),
                            ],
                          ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
