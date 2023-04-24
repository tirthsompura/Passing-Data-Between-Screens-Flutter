import 'dart:io';

import 'package:flutter/material.dart';

class GetDataScreen extends StatefulWidget {
  String name, email, number;
  File userImage;

  GetDataScreen(
      {super.key, required this.name, required this.email, required this.number,required this.userImage});

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Get Image
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.file(widget.userImage,fit: BoxFit.cover,
                ),
                ),
              ),
              const SizedBox(height: 30),

              //Get Name
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 15),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text(
                        "Name :",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              //Get Email
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 15),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text(
                        "Email :",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                     widget.email,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              //Get Number
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5), blurRadius: 15),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text(
                        "Number :",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.number,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
