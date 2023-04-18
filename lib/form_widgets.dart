import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'get_data_from_field.dart';

class FormWidgetScreen extends StatefulWidget {
  const FormWidgetScreen({Key? key}) : super(key: key);

  @override
  State<FormWidgetScreen> createState() => _FormWidgetScreenState();
}

class _FormWidgetScreenState extends State<FormWidgetScreen> {
  File? pickedImage;

  var nameText = TextEditingController();
  var emailText = TextEditingController();
  var numberText = TextEditingController();
  var passwordText = TextEditingController();
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
                child: Text(
              "Please submit the form with correct data !!",
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),

            const SizedBox(height: 20),
            //Add Image
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                //Set Image
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "https://www.kasandbox.org/programming-images/avatars/aqualine-ultimate.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                //BottomSheet
                Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15),
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Select Image From",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    //CAMERA
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pickImageFromYouWant(
                                                ImageSource.camera);
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.camera,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Camera",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18)),
                                          ],
                                        )),

                                    //Gallery
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            pickImageFromYouWant(
                                                ImageSource.gallery);
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.image,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("Gallery",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18)),
                                          ],
                                        )),
                                    //Cancel
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          height: 40,
                                          margin: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          decoration: const BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Cancel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18)),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text('UPLOAD IMAGE')),
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),
            //Enter Name
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4), blurRadius: 13),
                ],
              ),
              child: TextField(
                controller: nameText,
                keyboardType: TextInputType.name,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 1,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Name",
                    hintStyle: TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide:
                            BorderSide(color: Colors.orangeAccent, width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                    prefixIcon: Icon(Icons.abc_rounded),
                    suffixIcon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(height: 10),

            //Enter Email
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4), blurRadius: 13),
                ],
              ),
              child: TextField(
                controller: emailText,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 1,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Email",
                    hintStyle: TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide:
                            BorderSide(color: Colors.orangeAccent, width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(height: 10),

            //Enter Number
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4), blurRadius: 13),
                ],
              ),
              child: TextField(
                controller: numberText,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 1,
                maxLength: 10,
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    counterText: "",
                    hintText: "Enter Number",
                    hintStyle: TextStyle(fontSize: 16),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        borderSide:
                            BorderSide(color: Colors.orangeAccent, width: 1.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                    prefixText: "+91 - ",
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            const SizedBox(height: 10),

            //Enter Password
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4), blurRadius: 13),
                ],
              ),
              child: TextField(
                controller: passwordText,
                keyboardType: TextInputType.name,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 1,
                obscuringCharacter: "*",
                obscureText: obscureText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  counterText: "",
                  hintText: "Enter Password",
                  hintStyle: const TextStyle(fontSize: 16),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide:
                          BorderSide(color: Colors.orangeAccent, width: 1.5)),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: obscureText
                        ? const Icon(
                            Icons.visibility_off,
                          )
                        : const Icon(
                            Icons.visibility,
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            //Submit Button
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    if (pickedImage == null) {
                      _showToast(context, "Please select your image");
                    } else if (nameText.text.isEmpty) {
                      _showToast(context, "Enter your name");
                    } else if (emailText.text.isEmpty) {
                      _showToast(context, "Enter your email");
                    } else if (numberText.text.isEmpty) {
                      _showToast(context, "Enter your number");
                    }else if (numberText.text.length <= 9) {
                      _showToast(context, "Number must be at list 10 char");
                    } else if (passwordText.text.isEmpty) {
                      _showToast(context, "Enter your password");
                    } else if (passwordText.text.length <= 8) {
                      _showToast(context, "Password must be at list 8 char");
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GetDataScreen(
                          name: nameText.text.toString(),
                          email: emailText.text.toString(),
                          number: numberText.text.toString(),
                          userImage: pickedImage!,
                        ),
                      ));
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  pickImageFromYouWant(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
