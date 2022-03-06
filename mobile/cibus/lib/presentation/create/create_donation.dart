import 'dart:io';

import 'package:cibus/data/providers/create_provider.dart';
import 'package:cibus/data/repositories/create_repository.dart';
import 'package:cibus/logic/create/create_bloc.dart';
import 'package:cibus/logic/create/create_event.dart';
import 'package:cibus/logic/create/create_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePageRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createRepository =
        new CreateRepository(createProvider: new CreateProvider());

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<CreateBloc>(
        create: (context) => CreateBloc(createRepository),
        child: CreatePage(),
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateBloc, CreateState>(
      listener: (context, state) {
        if (state is DonationCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Created Donation Post"))
          );
        }
      },
      builder: (context, state) {
        return CreateForm();
      },
    );
  }
}

class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  var imageFile;
  int _activeStepIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  // define some controllers
  TextEditingController title = new TextEditingController();
  TextEditingController body = new TextEditingController();
  TextEditingController weight = new TextEditingController();
  TextEditingController location = new TextEditingController();

  List<Step> createSteps() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Basic Info'),
          content: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Donation Title',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: body,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Donation Body',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weight,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight Value',
                  ),
                ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Location'),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    controller: location,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Add an Image'),
            content: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      XFile? pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                        maxWidth: 1800,
                        maxHeight: 1800,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imageFile = File(pickedFile.path);
                        });
                      } else {
                        return;
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "Choose Image From Gallery",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      XFile? pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        maxWidth: 1800,
                        maxHeight: 1800,
                      );
                      if (pickedFile != null) {
                        setState(() {
                          imageFile = File(pickedFile.path);
                        });
                      } else {
                        return;
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "Take an Photo",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.file(imageFile),
                        )
                      : Center(
                          child: Text("No Image Selected"),
                        ),
                ],
              ),
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Confirm'),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Title: ${title.text}'),
                Text('Body: ${body.text}'),
                Text('Weight: ${weight.text}'),
                Text('Location : ${location.text}'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text("Image: "),
                ),
                imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.file(imageFile),
                      )
                    : Text("No Image Selected"),
              ],
            )))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Create",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: const Color(0xffFFFFFF)),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Container(
            child: Center(
              child: Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Colors.green,
                  ),
                ),
                child: Stepper(
                  type: StepperType.vertical,
                  currentStep: _activeStepIndex,
                  steps: createSteps(),
                  onStepContinue: () {
                    if (_activeStepIndex < (createSteps().length - 1)) {
                      setState(() {
                        _activeStepIndex += 1;
                      });
                    } else {
                      BlocProvider.of<CreateBloc>(context).add(CreateDonation(
                        title: title.text,
                        body: body.text,
                        weight: double.parse(weight.text),
                        image: imageFile,
                        location: location.text,
                      ));
                    }
                  },
                  onStepCancel: () {
                    if (_activeStepIndex == 0) {
                      return;
                    }
                    setState(() {
                      _activeStepIndex -= 1;
                    });
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _activeStepIndex = index;
                    });
                  },
                  controlsBuilder: (context, controlDetails) {
                    final isLastStep =
                        _activeStepIndex == createSteps().length - 1;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: controlDetails.onStepContinue,
                                child: (isLastStep)
                                    ? const Text('Submit')
                                    : const Text('Next'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            if (_activeStepIndex > 0)
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: controlDetails.onStepCancel,
                                  child: const Text('Back'),
                                ),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
