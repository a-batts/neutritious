// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:neutritious/db/database_service.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/enums/menu_category.dart';

class NewFormDialog extends StatefulWidget {
  const NewFormDialog({super.key, required this.category});

  final MenuCategory category;
  

  @override
  State<NewFormDialog> createState () => _NewFormDialogState();
}

class _NewFormDialogState extends State<NewFormDialog> {
  String _newTitle = "";
  String _newDescription = "";
  String _newImageURL = "";
  bool _loading = false;
  // FilePickerResult? _newImage;

  // uploadFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();

  //   setState(() {
  //     _newImage = result;
  //   });
  // }

  close() {
    if (mounted) {
      Navigator.pop(context);
    }

    setState(() {
      _newTitle = "";
      _newDescription = "";
      _newImageURL = "";
    });
  }

  addItem() async {
    var db = DatabaseService();

    setState(() {
      _loading = true;
    });

    await db.createUserMenuItem(UserMenuItem(
      title: _newTitle,
      content: _newDescription,
      imageURL: _newImageURL
    ));

    setState(() {
      _loading = false;
    });

    close();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Add to ${widget.category.name}",
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: close,
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    const SizedBox(height: 15, width: 600),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      onChanged: (String newVal) {
                        setState(() {
                          _newTitle = newVal;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 12,
                      minLines: 4,
                      onChanged: (String newVal) {
                        setState(() {
                          _newDescription = newVal;
                        });
                      },
                    ),
                    // Text(_newTitle),
                    // const SizedBox(height: 15),
                    // FilledButton(
                    //     onPressed: _newImage == null ? uploadFile : null,
                    //     child: const Text("Upload image")),
                    const SizedBox(height: 15),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cover Image URL',
                      ),
                      onChanged: (String newVal) {
                        setState(() {
                          _newImageURL = newVal;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: !_loading &&
                                  _newTitle.characters.isNotEmpty &&
                                  _newDescription.characters.isNotEmpty
                                  // _newImageURL.characters.isNotEmpty
                                  // _newImage != null
                              ? addItem
                              : null,
                          child: Text(_loading ? 'Loading' : 'Save'),
                        ),
                      ],
                    )
                  ],
                ),
              );
  }
}