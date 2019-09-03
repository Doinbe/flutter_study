import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerImagePage extends StatefulWidget {
  final String title;
  const PickerImagePage(this.title,{Key key}) : super(key: key);
  @override
  _PickerImagePageState createState() => _PickerImagePageState();
}

class _PickerImagePageState extends State<PickerImagePage> {
  var _imageFiles = <File>[];

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _imageFiles.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickerImageBottomSheet,
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('这是image_picker第三方库，提供获取原生端图片的两种方式（拍照，相册）'),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: _imageWidgets(),
            )
          ],
        ),
      ),
    );
  }

  _pickerImageBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext corext) {
          return Container(
            height: 150,
            child: Column(
              children: <Widget>[
                _pickerImageItem('拍照', true),
                _pickerImageItem('相册', false),
              ],
            ),
          );
        });
  }

  _pickerImageItem(String title, bool isTakePhoto) {
    return GestureDetector(
      onTap: () {
        getImage(isTakePhoto);
      },
      child: ListTile(
        title: Text(title),
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
      ),
    );
  }

  _imageWidgets() {
    return _imageFiles.isNotEmpty
        ? _imageFiles.map((file) {
            return Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Container(
                    child: Image.file(
                      file,
                      width: 160,
                      height: 90,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    right: 5,
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _imageFiles.remove(file);
                        });
                      },
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(color: Colors.black54),
                          child:
                              Icon(Icons.close, size: 18, color: Colors.white),
                        ),
                      ),
                    ))
              ],
            );
          }).toList()
        : <Widget>[
            Center(
              child: Text('图片集合数量0'),
            )
          ];
  }
}
