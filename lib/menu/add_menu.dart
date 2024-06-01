// // ignore_for_file: library_private_types_in_public_api
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:berry_happy/endpoints/endpoints.dart';

// class AddMenu extends StatefulWidget {
//   const AddMenu({Key? key}) : super(key: key);

//   @override
//   _AddMenuState createState() => _AddMenuState();
// }

// class _AddMenuState extends State<AddMenu> {
//   final _titleController = TextEditingController();
//   String _title = "";

//   final _descriptionController = TextEditingController();
//   String _description = "";

//   final _priceController = TextEditingController();
//   int _price = 0;

//   String? _selectedItem;
//   String? _selectedPriority;

//   File? galleryFile;
//   final picker = ImagePicker();

//   _showPicker({
//     required BuildContext context,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Photo Library'),
//                 onTap: () {
//                   getImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   getImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future getImage(
//     ImageSource img,
//   ) async {
//     final pickedFile = await picker.pickImage(source: img);
//     XFile? xfilePick = pickedFile;
//     setState(
//       () {
//         if (xfilePick != null) {
//           galleryFile = File(pickedFile!.path);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
//               const SnackBar(
//                   content:
//                       Text('Nothing is selected'))); //jika batal mengupload
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _titleController.dispose(); // Dispose of controller when widget is removed
//     _descriptionController.dispose();
//     _priceController.dispose();
//     super.dispose();
//   }

//   saveData() {
//     debugPrint(_title);
//     debugPrint(_description);
//   }

// //fungsi input
//   Future<void> _postDataWithImage(BuildContext context) async {
//     if (galleryFile == null) {
//       return; // Handle case where no image is selected
//     }

//     var request = MultipartRequest('POST', Uri.parse(Endpoints.cs));
//     request.fields['nim'] = _nimController.text;
//     request.fields['title_issues'] = _titleController.text;
//     request.fields['description_issues'] = _descriptionController.text;
//     request.fields['rating'] = _ratingController.text.toString();

//     var multipartFile = await MultipartFile.fromPath(
//       'image',
//       galleryFile!.path,
//     );
//     request.files.add(multipartFile);

//     request.send().then((response) {
//       // Handle response (success or error)
//       if (response.statusCode == 201) {
//         debugPrint('Issue posted successfully!');
//         Navigator.pushReplacementNamed(context, '/cs-screen');
//       } else {
//         debugPrint('Error posting issue: ${response.statusCode}');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 255, 65, 158),

//       appBar: AppBar(
//         title: null,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.white), // recolor the icon
//       ),
//       // ignore: sized_box_for_whitespace
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Add Menu",
//                     style: GoogleFonts.poppins(
//                       fontSize: 32,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     "Fill the form below to add menu!",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(60))),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 10),
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: const [
//                                 BoxShadow(
//                                     color: Color.fromRGBO(225, 95, 27, .3),
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10))
//                               ]),
//                           child: Column(
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey.shade200))),
//                                 child: TextField(
//                                   controller: _titleController,
//                                   decoration: const InputDecoration(
//                                       hintText: "Title",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _title = value;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               //issues description
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                         bottom: BorderSide(
//                                             color: Colors.grey.shade200))),
//                                 child: TextField(
//                                   controller: _descriptionController,
//                                   decoration: const InputDecoration(
//                                       hintText: "Description",
//                                       hintStyle: TextStyle(color: Colors.grey),
//                                       border: InputBorder.none),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _description = value;
//                                     });
//                                   },
//                                 ),
//                               ),

//                               //image
//                               GestureDetector(
//                                 onTap: () {
//                                   _showPicker(context: context);
//                                 },
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       border: Border(
//                                           bottom: BorderSide(
//                                               color: Colors.grey.shade200))),
//                                   width: double.infinity,
//                                   height: 150,
//                                   child: galleryFile == null
//                                       ? Center(
//                                           child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             const Icon(
//                                                 Icons
//                                                     .add_photo_alternate_outlined,
//                                                 color: Colors.grey,
//                                                 size: 50),
//                                             Text('Pick your Image here',
//                                                 style: GoogleFonts.poppins(
//                                                   fontSize: 14,
//                                                   color: const Color.fromARGB(
//                                                       255, 124, 122, 122),
//                                                   fontWeight: FontWeight.w500,
//                                                 )),
//                                           ],
//                                         ))
//                                       : Center(
//                                           child: Image.file(galleryFile!),
//                                         ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 250),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromARGB(255, 88, 161, 209),
//         tooltip: 'Save',
//         onPressed: () {
//           _postDataWithImage(context);
//         },
//         child: const Icon(Icons.save, color: Colors.white, size: 28),
//       ),
//     );
//   }
// }
