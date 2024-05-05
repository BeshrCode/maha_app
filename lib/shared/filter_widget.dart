import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final _isAgeRangeExpanded = Rxn<bool>(false); // State for age range expansion
  final _isGenderExpanded = Rxn<bool>(false); // State for gender expansion
  final _isAnxietyExpanded = Rxn<bool>(false); // State for anxiety expansion
  final _isLevelExpanded = Rxn<bool>(false); // State for level expansion
  final _selectedGender = Rxn<String>('none'); // Selected gender
  final _selectedLevel = Rxn<String>('none'); // Selected gender
  final _selectedDate = Rxn<String>('none'); // Selected date filter
  final _ageRange = Rxn<RangeValues>(const RangeValues(13.0, 17.0)); // Age range
  final _selectedAnxiety = Rxn<String>('none'); // Selected anxiety level

  // Accessors for filter selections
  bool get isAgeRangeExpanded => _isAgeRangeExpanded.value ?? false;
  bool get isGenderExpanded => _isGenderExpanded.value ?? false;
  bool get isAnxietyExpanded => _isAnxietyExpanded.value ?? false;
  bool get isLevelExpanded => _isLevelExpanded.value ?? true;

  String get selectedGender => _selectedGender.value ?? 'none';
  String get selectedDate => _selectedDate.value ?? 'none';
  RangeValues get ageRange => _ageRange.value ?? const RangeValues(13.0, 17.0);
  String get selectedAnxiety => _selectedAnxiety.value ?? 'none';
  String get selectedLevel => _selectedAnxiety.value ?? 'none';

  // Methods to update filter selections
  void toggleAgeRangeExpansion() => _isAgeRangeExpanded.toggle();
  void toggleGenderExpansion() => _isGenderExpanded.toggle();
  void toggleAnxietyExpansion() => _isAnxietyExpanded.toggle();
  void toggleLevelExpansion() => _isLevelExpanded.toggle();

  void setSelectedGender(String value) => _selectedGender.value = value;
  void setSelectedDate(String value) => _selectedDate.value = value;
  void setAgeRange(RangeValues newRange) => _ageRange.value = newRange;
  void setSelectedAnxiety(String value) => _selectedAnxiety.value = value;
  void setSelectedLevel(String value) => _selectedLevel.value = value;
}

class FilterWidget extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff00000040),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0
          )
        ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
          // Date filter radio buttons
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                 SizedBox(width: 20,),
                Text('Date',style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                )),
              ],
            ),
            Obx(() => RadioListTile<String>(
              title:  Text('Latest request date',style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                color: filterController.selectedDate=='latest'?Color(0xff6251A2):Colors.black
              ),),
              value: 'latest',
              groupValue: filterController.selectedDate,
              onChanged: (value) => filterController.setSelectedDate(value!),
            )),
            Obx(() => RadioListTile<String>(
              title:  Text('Oldest request date',style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: filterController.selectedDate=='oldest'?Color(0xff6251A2):Colors.black
              )),
              value: 'oldest',
              groupValue: filterController.selectedDate,
              onChanged: (value) => filterController.setSelectedDate(value!),
            )),
          ],
        ),

        // Age range expansion panel
            Obx(
                  () => Container(
                color: Colors.white, // Set the desired background color here
                child: ExpansionPanelList(
                  elevation: 0,
                  expansionCallback: (int index, bool isExpanded) =>
                      filterController.toggleAgeRangeExpansion(),
                  children: [
                    ExpansionPanel(
                      backgroundColor: Colors.white,
                      headerBuilder: (context, isExpanded) => const ListTile(
                        title: Text('Age'),
                      ),
                      isExpanded: filterController.isAgeRangeExpanded,
                      body: Row(
                        children: [
                          RangeSlider(
                            values: filterController.ageRange,
                            min: 13,
                            max: 17,
                            onChanged: (values) => filterController.setAgeRange(values),
                          ),
                          Text(
                            '${filterController.ageRange.start.round()} - ${filterController.ageRange.end.round()}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 0.3),

        // Gender expansion panel
        Obx(
                () => ExpansionPanelList(
                  elevation: 0,


                  expansionCallback: (int index, bool isExpanded) =>
                    filterController.toggleGenderExpansion(),
                children: [
                ExpansionPanel(
                  backgroundColor: Colors.white,

                  headerBuilder: (context, isExpanded) => const ListTile(
        title: Text('Gender'),
            ),
            isExpanded: filterController.isGenderExpanded,
            body: Column(
            children: [
        Obx(() => RadioListTile<String>(
          title: const Text('Male'),
          value: 'male',
          groupValue: filterController.selectedGender,
          onChanged: (value) => filterController.setSelectedGender(value!),
        )),
        Obx(() => RadioListTile<String>(
          title: const Text('Female'),
          value: 'female',
          groupValue: filterController.selectedGender,
          onChanged: (value) => filterController.setSelectedGender(value!),
        )),
            ],
            ),
                ),
                ],
                ),
        ),
            const Divider(thickness: 0.3),
            // Anxiety expansion panel
        Obx(
                  () => ExpansionPanelList(
                    elevation: 0,

                    expansionCallback: (int index, bool isExpanded) =>
                    filterController.toggleAnxietyExpansion(),
                children: [
                  ExpansionPanel(
                    backgroundColor: Colors.white,
                    headerBuilder: (context, isExpanded) => const ListTile(
                      title: Text('Anxiety Type'),
                    ),
                    isExpanded: filterController.isAnxietyExpanded,
                    body: Column(
                      children: [
                        Obx(() => RadioListTile<String>(
                          title: const Text('General Anxiety Disorder or GAD'),
                          value: 'General Anxiety Disorder or GAD',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedAnxiety(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('Social Anxiety'),
                          value: 'Social Anxiety',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedAnxiety(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('Specific Phobia'),
                          value: 'Specific Phobia',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedAnxiety(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('Panic Disorder'),
                          value: 'Panic Disorder',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedAnxiety(value!),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.3),
        Obx(() => ExpansionPanelList(
          elevation: 0,

          expansionCallback: (int index, bool isExpanded) =>
                    filterController.toggleLevelExpansion(),
                children: [
                  ExpansionPanel(
                    backgroundColor: Colors.white,

                    headerBuilder: (context, isExpanded) => const ListTile(
                      title: Text('Level'),
                    ),
                    isExpanded: filterController.isLevelExpanded,
                    body: Column(
                      children: [
                        Obx(() => RadioListTile<String>(
                          title: const Text('Low Anxiety'),
                          value: 'low',
                          groupValue: filterController.selectedLevel,
                          onChanged: (value) => filterController.setSelectedLevel(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('Moderate Anxiety'),
                          value: 'moderate',
                          groupValue: filterController.selectedLevel,
                          onChanged: (value) => filterController.setSelectedLevel(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('High Anxiety'),
                          value: 'high',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedLevel(value!),
                        )),
                        Obx(() => RadioListTile<String>(
                          title: const Text('Severe Anxiety'),
                          value: 'severe',
                          groupValue: filterController.selectedAnxiety,
                          onChanged: (value) => filterController.setSelectedLevel(value!),
                        )),
                      ],
                    ),
                  ),
                ],
              ),),

            // Apply button
            const SizedBox(height: 10,),
        InkWell(
          onTap: () {
            // Access filter selections using filterController properties
            if (kDebugMode) {
              print('Selected gender: ${filterController.selectedGender}');
              print('Age range: ${filterController.ageRange.start.round()} - ${filterController.ageRange.end.round()}');
              print('Selected anxiety: ${filterController.selectedAnxiety}');
              Get.back();
            }
          },
          child: Container(
            width: 110,

            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(colors: [
                Color(0xffB699F4),
                Color(0xffD7C4FC),
              ])
            ),
           child: const Center(child: Text('Apply',style: TextStyle(
             color: Colors.white,
             fontFamily: 'Inter',
             fontSize: 16,
             fontWeight: FontWeight.w600
           ),)),
              ),
        ),
          ],
        ),
      ),
    );
  }
}

