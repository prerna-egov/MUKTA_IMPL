import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_reactive_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/localization/app_localization.dart';
import '../../widgets/atoms/radio_button_list.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class IndividualSubDetailPage extends StatefulWidget {
 final List<String> relationship;
 final     List<String> gender;
 final     List<String> socialCategory;
 final     List<String> skills;
  final    String? photo;
  const IndividualSubDetailPage({super.key, 
   required this.relationship,
   required this.gender, 
   required this.photo,
   required this.skills,
   required this.socialCategory,
   });

  @override
  State<IndividualSubDetailPage> createState() => _IndividualSubDetailPageState();
}

class _IndividualSubDetailPageState extends State<IndividualSubDetailPage> {

String genderController = '';
  String fatherNameKey = 'fatherName';
  String aadhaarNoKey = 'aadhaarNo';
  String relationshipKey = 'relationship';
  String dobKey = 'dob';
  String genderKey = 'gender';
  String socialCategoryKey = 'socialCategory';
  String mobileKey = 'mobileNo';



  @override
  Widget build(BuildContext context) {
     final t = AppLocalizations.of(context);
   
    return ReactiveFormBuilder(
     
      form:detailBuildForm,
      builder: (contextt, form1, child) {
       
        return GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DigitCard(
                //margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Individual's Personal Details",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.displayMedium
                          ?.apply(color: const DigitColors().black),
                    ),
                    Column(children: [
                      DigitDateFormPicker(
                        label: t.translate(i18.common.dateOfBirth),
                        isRequired: true,
                        cancelText: t.translate(i18.common.cancel),
                        fieldHintText: 'dd/mm/yyyy',
                        confirmText: t.translate(i18.common.oK),
                        icon: Icons.info_outline_rounded,
                        toolTipMsg: t.translate(i18.wageSeeker.ageValidation),
                        formControlName: dobKey,
                        autoValidation: AutovalidateMode.always,
                        requiredMessage:
                            t.translate(i18.wageSeeker.dobRequired),
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.dobRequired,
                              ),
                          'max': (_) =>
                              t.translate(i18.wageSeeker.ageValidation)
                        },
                      ),
                      StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return DigitRadioButtonList<String>(
                          labelText: t.translate(i18.common.gender),
                          formControlName: genderKey,
                          options: widget.gender.map((e) => e.toString()).toList(),
                          isRequired: true,
                          valueMapper: (value) => t.translate(value),
                          onValueChange: (value) {
                            genderController = value;
                          },
                        );
                      }),
                      DigitTextFormField(
                        formControlName: fatherNameKey,
                        isRequired: true,
                        label: t.translate(i18.common.guardianName),
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.fatherNameRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minFatherNameCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxFatherNameCharacters,
                              ),
                        },
                      ),
                      DigitReactiveDropdown<String>(
                        label: t.translate(i18.common.relationship),
                        menuItems:
                           widget. relationship.map((e) => e.toString()).toList(),
                        isRequired: true,
                        formControlName: relationshipKey,
                        valueMapper: (value) =>
                            t.translate('CORE_COMMON_$value'),
                        onChanged: (value) {},
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.relationshipRequired,
                              ),
                        },
                      ),
                      DigitTextFormField(
                        label: t.translate(i18.common.mobileNumber),
                        formControlName: mobileKey,
                        isRequired: true,
                        minLength: 10,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.mobileRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minMobileCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxMobileCharacters,
                              ),
                          'min': (_) => t.translate(
                                i18.wageSeeker.validMobileCharacters,
                              ),
                          'max': (_) => t.translate(
                                i18.wageSeeker.validMobileCharacters,
                              ),
                        },
                      ),
                      DigitReactiveDropdown<String>(
                        label: t.translate(i18.common.socialCategory),
                        menuItems:
                           widget. socialCategory.map((e) => e.toString()).toList(),
                        formControlName: socialCategoryKey,
                        valueMapper: (value) =>
                            t.translate('COMMON_MASTERS_SOCIAL_$value'),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ]),
                    Center(
                      child: DigitElevatedButton(
                          onPressed: () {
                            
                             
                            
                          },
                          child: Center(
                            child: Text(t.translate(i18.common.next)),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  FormGroup detailBuildForm() => fb.group(<String, Object>{
      
       
        genderKey: FormControl<String>(value: null),
        fatherNameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        relationshipKey:
            FormControl<String>(value: null, validators: [Validators.required]),
        dobKey: FormControl<DateTime>(
          value:  DateTime.now(),
          validators: [
            Validators.required,
            Validators.max(DateTime(DateTime.now().year - 18,
                DateTime.now().month, DateTime.now().day))
          ],
        ),
        socialCategoryKey: FormControl<String>(value: null),
        mobileKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(10),
          Validators.min('5999999999'),
          Validators.max('9999999999'),
          Validators.maxLength(10)
        ]),
     
      });
}