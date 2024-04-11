import 'package:flutter/material.dart';
import 'package:flutter_responsive/subscribe.dart';
import 'package:flutter_responsive/user_controller.dart';
import 'package:flutter_responsive/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FacebookLoginResponsiveUI extends StatefulWidget {
  const FacebookLoginResponsiveUI({super.key});

  @override
  State<FacebookLoginResponsiveUI> createState() =>
      _FacebookLoginResponsiveUIState();
}

class _FacebookLoginResponsiveUIState extends State<FacebookLoginResponsiveUI> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 235, 232),
      body: SingleChildScrollView(
        child: SafeArea(
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 893) {
              return Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  facebookname(),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: responsiveCard(),
                  ),
                  lastPage()
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w / 2.2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [facebookname()],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w / 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 170),
                    child: Column(
                      children: [
                        responsiveCard(),
                        lastPage(),
                      ],
                    ),
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }

// now we can you this method multiple time .
  Row lastPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Create a Page",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          "for a celebrity, brand or bussiness.",
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }

  Card responsiveCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      shadowColor: Colors.black,
      child: Container(
        height: 400.h,
        width: 400.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 174, 204, 228),
                    hoverColor: Colors.black,
                    hintText: "Email or phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  controller: _pass,
                  decoration: InputDecoration(
                    focusColor: const Color.fromARGB(255, 174, 204, 228),
                    hoverColor: Colors.black,
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 60.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 1, 115, 207),
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7))),
                  onPressed: () async {
                    final newUser = UserModel(
                      email: _email.text.trim(),
                      password: _pass.text.trim(),
                    );
                    await userController.createUser(newUser).then((value) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const Subscribe()));
                      _email.clear();
                      _pass.clear();
                    });
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Color.fromARGB(255, 1, 115, 207),
                  ),
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 95, 94, 94),
                thickness: 0.3,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 73, 194, 2),
                    minimumSize: const Size(250, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () {},
                child: const Text(
                  "Create new account",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox facebookname() {
    return SizedBox(
      width: 550.w,
      child: Column(
        children: [
          Image(
            image: const AssetImage("img/fb.png"),
            height: 70.h,
            width: 250.w,
          ),
          SizedBox(
            height: 13.h,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Connect with friends and the world around you on Facebook.",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
