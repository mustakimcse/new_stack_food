import 'package:flutter/material.dart';
import 'package:stack_food/util/consttants.dart';
import 'package:stack_food/util/responsiveSize.dart';
import 'package:stack_food/widgets/custom_button.dart';

class RequestVerificationScreen extends StatefulWidget {
  const RequestVerificationScreen({super.key});

  @override
  State<RequestVerificationScreen> createState() =>
      _RequestVerificationScreenState();
}

class _RequestVerificationScreenState
    extends State<RequestVerificationScreen> {
  String selectedDocument = "Driver License";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Color(0xfff6f6f6)
            ),
            child: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text("Request Verification"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "First Name",
                style: TextStyle(fontWeight: FontWeight.bold,color: mrTextTitleColor),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your first name",
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for enabled state
                      width: 1.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for focused state
                      width: 1.0, // Border width
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Last Name",
                style: TextStyle(fontWeight: FontWeight.bold,color: mrTextTitleColor),
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your last name",
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Color(0xffc4c4c4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for enabled state
                      width: 1.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for focused state
                      width: 1.0, // Border width
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Select an Identification Document",
                style: TextStyle(fontWeight: FontWeight.bold,color: mrTextTitleColor),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  RadioListTile(
                    title: const Text("Driver License"),
                    value: "Driver License",
                    groupValue: selectedDocument,
                    onChanged: (value) {
                      setState(() {
                        selectedDocument = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Local ID"),
                    value: "Local ID",
                    groupValue: selectedDocument,
                    onChanged: (value) {
                      setState(() {
                        selectedDocument = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Passport"),
                    value: "Passport",
                    groupValue: selectedDocument,
                    onChanged: (value) {
                      setState(() {
                        selectedDocument = value.toString();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),


              Center(
                child: CustomButton(
                  padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, 0.08, 0).height,vertical: 10),
                  radius: 30,
                  color: Colors.black,
                  leading: const Icon(Icons.upload_file,color: Colors.white,),
                    child: Text("Upload Image Of Document",style: TextStyle(color: Colors.white),),
                    onPressed: (){}
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Current Address",
                style: TextStyle(fontWeight: FontWeight.bold,color: mrTextTitleColor),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Enter your current address",
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for enabled state
                      width: 1.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    borderSide: const BorderSide(
                      color: Color(0xffeeeeee), // Border color for focused state
                      width: 1.0, // Border width
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Center(
                child: CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, 0.08, 0).height,vertical: 10),
                    radius: 30,
                    color: Colors.black,
                    leading: const Icon(Icons.upload_file,color: Colors.white,),
                    child: Text("Upload Image Of Yourself",style: TextStyle(color: Colors.white),),
                    onPressed: (){}
                ),
              ),
              const SizedBox(height: 32),


              Center(
                child: CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: responsiveSize(context, 0.08, 0).height,vertical: 10),
                    radius: 30,
                    color: Colors.redAccent,
                    leading: const Icon(Icons.upload_file,color: Colors.white,),
                    child: Text("Request now",style: TextStyle(color: Colors.white),),
                    onPressed: (){}
                ),
              ),

              const SizedBox(height: 32),


            ],
          ),
        ),
      ),
    );
  }
}
