import 'package:flutter/material.dart';

class JobScreenPage extends StatefulWidget {
  JobScreenPage({Key? key}) : super(key: key);

  @override
  State<JobScreenPage> createState() => _JobScreenPageState();
}

class _JobScreenPageState extends State<JobScreenPage> {
  List<String> citysList = [
    'Erbil',
    'Duhok',
    'Slemmany',
    'Karkuk',
    'Zakho',
    'Halabja'
  ];

  List<String> typeList = [
    'Full Time',
    'Part Time',
    'Work From Home',
    'Temporary',
    'At Will',
    'Internship',
    'Seasonal'
  ];

  List<String> categoryList = [
    'Accounting and Consulting',
    'Admin Support',
    'Customer Service',
    'Data Science and Analysis',
    'Design and Creative',
    'IT and Networking',
    'Web Development',
    'Mobile Development',
    'Software Development'
  ];
  String? selectedtypeOfJob = 'Full Time';
  String? selectdCity = 'Erbil';
  String? selectedCatigory = 'Accounting and Consulting';
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Image.asset('assets/images/job.png'),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: Text(
                  'JOB INFO',
                  style: headerTextStyle(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //* Type of the Job
                  //header.
                  headerInformationOfInputs(name: 'Type'),
                  // space between header and Input.
                  spaceBetweenHeaderAndInput(),
                  // DropDown Button for Type of Jobs.
                  dropDownButton(
                      selectedItem: selectedtypeOfJob, itemsList: typeList),

                  ///
                  ///
                  ///

                  //* Title of the Job
                  // space between header and Input.
                  spaceBetweenHeaderAndInput(),
                  // TextField for title of the job
                  textField(
                      name: 'Title',
                      textController: titleTextEditingController),

                  ///
                  ///
                  ///

                  //* Description of Job
                  // space between header and input widget
                  spaceBetweenHeaderAndInput(),
                  // DropDown Button for city
                  textField(
                      textController: descriptionTextEditingController,
                      name: 'Description'),

                  ///
                  ///
                  ///

                  //* Organization
                  // space between header and input widget
                  spaceBetweenHeaderAndInput(),
                  // DropDown Button for city
                  textField(
                      textController: descriptionTextEditingController,
                      name: 'Organization'),

                  ///
                  ///
                  ///

                  //* City
                  // Space between 2 input Widget
                  spaceBetweenHeaderAndInput(),
                  // header
                  headerInformationOfInputs(name: 'City'),
                  // space between header and input widget
                  spaceBetweenHeaderAndInput(),
                  // DropDown Button for city
                  dropDownButton(
                      selectedItem: selectdCity, itemsList: citysList),

                  ///
                  ///
                  ///

                  //* Category
                  // Space between 2 input Widget
                  spaceBetweenHeaderAndInput(),
                  // header
                  headerInformationOfInputs(name: 'Category'),
                  // space between header and input widget
                  spaceBetweenHeaderAndInput(),
                  // DropDown Button for city
                  dropDownButton(
                      selectedItem: selectedCatigory, itemsList: categoryList),
                  spaceBetweenHeaderAndInput(),

                  ///
                  ///
                  ///
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this is the style of header text
  TextStyle headerTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
  }

  // Style of text inside Drop Down Button
  TextStyle dropDownItemStyle() {
    return TextStyle(
      fontSize: 15,
    );
  }

  // Information Header Text Style [ City , Category , ... etc]
  TextStyle informationHeaderOfInputsTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  // Drop Down Button
  Widget dropDownButton(
      {required String? selectedItem, required List<String> itemsList}) {
    return SizedBox(
      width: 350,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3,
                  ))),
          value: selectedItem,
          items: itemsList
              .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: dropDownItemStyle(),
                  )))
              .toList(),
          onChanged: (item) => setState(() {
                selectedItem = item;
              })),
    );
  }

  // this is the header of the text field and drop down button.
  Widget headerInformationOfInputs({required String name}) {
    return Container(
      margin: EdgeInsets.only(right: 290, left: 24),
      child: Text(
        name,
        style: informationHeaderOfInputsTextStyle(),
      ),
    );
  }

  // space between the header and input widget
  Widget spaceBetweenHeaderAndInput() {
    return SizedBox(
      height: 15,
    );
  }

  // space between 2 input widget
  Widget spaceBetweenTwoInput() {
    return SizedBox(
      height: 40,
    );
  }

  // text field
  Widget textField(
      {required TextEditingController textController, required String name}) {
    return Container(
      width: 340,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(label: Text(name)),
      ),
    );
  }
}
