import 'package:cibus/logic/auth/auth_bloc.dart';
import 'package:cibus/logic/auth/auth_event.dart';
import 'package:cibus/presentation/auth/widgets/rounded_input.dart';
import 'package:cibus/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

class UserInfoPage extends StatefulWidget {
  final String uid;
  const UserInfoPage({Key? key, required this.uid}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    animationController.forward();
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController orgNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cardWidth = math.min(MediaQuery.of(context).size.width * 0.75, 360.0);
    const cardPadding = 16.0;
    final textFieldWidth = cardWidth - cardPadding * 2;

    Interval? _nameTextFieldLoadingAnimationInterval = const Interval(0, .85);

    List<DropdownMenuItem<String>> organizationItems = [
      DropdownMenuItem(child: Text("Donor"), value: "Donor"),
      DropdownMenuItem(child: Text("Reciever"), value: "Reciever"),
    ];

    String? selectedItem = "Donor";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.green.withOpacity(0.9),
            Colors.white.withOpacity(0),
          ],
        )),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                InputField(
                  label: "Name",
                  hintText: "Name",
                  controller: nameController,
                  typeOfInput: InputType.Regular,
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                    label: "Organization",
                    hintText: "Organization Name",
                    controller: orgNameController,
                    typeOfInput: InputType.Regular,
                    icon: Icons.place),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonFormField(
                    hint: Text("Type of Organization"),
                    disabledHint: Text("Type of Organization"),
                    value: selectedItem,
                    items: organizationItems,
                    onChanged: (item) {
                      selectedItem = item.toString();
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(SubmitSignUp(
                        name: nameController.text,
                        orgName: orgNameController.text,
                        orgType: selectedItem));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Container(
                    height: 50,
                    width: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // TextButton(
                //     onPressed: () {
                //       BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                //     },
                //     child: Text("Loggouy")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
