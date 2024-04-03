import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/employee/emp_hrms/emp_hrms.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_crud.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/employee/mb/mb_detail_response.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/models/file_picker_data.dart';
import 'package:works_shg_app/utils/notifiers.dart';
import 'package:works_shg_app/widgets/mb/multi_image.dart';
import 'package:works_shg_app/widgets/molecules/file_picker.dart';

import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../models/employee/mb/role_based_hrms.dart';
import '../../models/file_store/file_store_model.dart';
import '../../models/muster_rolls/muster_workflow_model.dart';
import '../../utils/common_methods.dart';
import '../../utils/employee/mb/mb_logic.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class MBTypeConfirmationPage extends StatefulWidget {
  final NextActions nextActions;
  final String? contractNumber;
  final String? mbNumber;
  const MBTypeConfirmationPage({
    super.key,
    required this.nextActions,
    this.contractNumber,
    this.mbNumber,
  });

  @override
  State<MBTypeConfirmationPage> createState() => _MBTypeConfirmationPageState();
}

class _MBTypeConfirmationPageState extends State<MBTypeConfirmationPage> {
  List<String>? photo;
List<WorkFlowSupportDocument> supportDocument=[];
  HRMSEmployee? selectedAssignee;
  var comment = TextEditingController();

  @override
  void initState() {
    FilePickerData.imageFile = null;
    FilePickerData.bytes = null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocListener<MeasurementCrudBloc, MeasurementCrudState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            // Navigator.of(context).popUntil((route) => route is HomeRoute);
            context.read<MusterGetWorkflowBloc>().add(
                  //hard coded
                  FetchMBWorkFlowEvent(
                      tenantId: 'od.testing', mbNumber: widget.mbNumber!),
                );
            context.read<MeasurementDetailBloc>().add(
                  MeasurementDetailBookBlocEvent(
                    contractNumber: widget.contractNumber!,
                    measurementNumber: widget.mbNumber!,
                    tenantId: '',
                  ),
                );
            //context.router.push(const HomeRoute());
            // context.router.push( MBDetailRoute(contractNumber: widget.contractNumber!, mbNumber: widget.mbNumber!));
            Navigator.of(context).pop();
          },
          loading: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            Loaders.showLoadingDialog(context);
          },
          error: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            Notifiers.getToastMessage(
              context,
              // AppLocalizations.of(context)
              //     .translate(i18.login.invalidOTP),
              'ERROR',
              "something went wrong",
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const DigitColors().white,
        appBar: AppBar(
          titleSpacing: 0,
          title: const AppBarLogo(),
        ),
        drawer: DrawerWrapper(
          Drawer(
            child: SideBar(
              module: CommonMethods.getLocaleModules(),
            ),
          ),
        ),
        body: BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              loaded: (value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScrollableContent(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    footer: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: DigitOutLineButton(
                              label: "Cancel",
                              onPressed: () {
                                context.router.pop();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DigitElevatedButton(
                              child: Text(
                                widget.nextActions.action == "EDIT/RE-SUBMIT"
                                    ? "Forward"
                                    : t.translate(
                                        "WF_MODAL_SUBMIT_MB_${widget.nextActions.action!}"),
                              ),
                              onPressed: () {
                                List<List<SorObject>> sorList = [
                                  value.sor!,
                                  value.nonSor!
                                ];
                                MBDetailResponse kkk =
                                    MBLogic.getMbPayloadUpdate(
                                        data: value.data,
                                        sorList: sorList,
                                        workFlow: WorkFlow(
                                          action: widget.nextActions.action,
                                          comment: comment.text,
                                          assignees: [
                                            selectedAssignee?.uuid ?? ""
                                          ],
                                          documents: supportDocument,
                                        ));

                                context.read<MeasurementCrudBloc>().add(
                                      MeasurementUpdateBlocEvent(
                                        measurement: kkk.measurement!,
                                        tenantId: '',
                                        workFlow: WorkFlow(
                                          action: widget.nextActions.action,
                                          comment: comment.text,
                                          assignees: [selectedAssignee?.uuid ?? ""],
                                          documents: supportDocument,
                                        ),
                                      ),
                                    );
                                // Navigator.of(context)
                                //     .popUntil((route) => route is HomeRoute);
                                // context.router.push(const HomeRoute());
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              icon: const Icon(Icons.close)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              t.translate(
                                  "WF_MB_ACTION_${widget.nextActions.action}"),
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.headlineLarge,
                            ),
                          ),
                        ],
                      ),
                      BlocBuilder<EmpHRMSBloc, EmpHRMsState>(
                        builder: (context, state) {
                          return state.maybeMap(
                            orElse: () => const SizedBox.shrink(),
                            loaded: (value) {
                              // HRMSEmployee selectedAssignee = HRMSEmployee(
                              //   id: value.hrmsEmployee!.first.id,
                              //   uuid: value.hrmsEmployee!.first.uuid,
                              //   code: value.hrmsEmployee!.first.code,
                              //   isActive: value.hrmsEmployee!.first.isActive,
                              //   dateOfAppointment:
                              //       value.hrmsEmployee!.first.dateOfAppointment,
                              //   employeeType:
                              //       value.hrmsEmployee!.first.employeeType,
                              // );

                              //    selectedAssignee=selectedAssignee;

                              return DigitDropdown<HRMSEmployee>(
                                onChanged: (value) {
                                  setState(() {
                                    selectedAssignee = value!;
                                  });
                                },
                                value: selectedAssignee ??
                                    value.hrmsEmployee!.first,
                                label: t.translate("WF_MODAL_APPROVER"),
                                menuItems:
                                    value.hrmsEmployee!.map((e) => e).toList(),
                                valueMapper: (value) {
                                  return t.translate(value.code.toString());
                                  // return value.toString();
                                },
                              );
                            },
                            error: (value) {
                              return const SizedBox.shrink();
                            },
                          );
                        },
                      ),
                      DigitTextField(
                        label: t.translate("WF_MODAL_COMMENTS"),
                        maxLines: 6,
                        controller: comment,
                      ),
                      // SizedBox(
                      //   height: 300,
                      //   child: SHGFilePicker(
                      //     callBack: (List<FileStoreModel>? fileStore) {
                      //       if (fileStore != null && fileStore.isNotEmpty) {
                      //         // setState(() {
                      //         photo = fileStore!
                      //             .map((e) => e.fileStoreId!)
                      //             .toList();
                      //         // });
                      //       } else {
                      //         setState(() {
                      //           photo = [];
                      //         });
                      //       }
                      //     },
                      //     extensions: const ['jpg', 'png', 'jpeg'],
                      //     moduleName: 'works',
                      //     label: t.translate("CLICK_TO_ADD_PHOTO"),
                      //   ),
                      // ),
                      SizedBox(
                        height: 300,
                        child: FilePickerDemo(
                          callBack: (List<FileStoreModel>? g,
                              List<WorkflowDocument>? l) {
                            final supportDocumentData= l!.map((e) {
                            return  WorkFlowSupportDocument(
                              documentType: e.documentType,
                              documentUid: e.fileStore,
                              fileName: e.documentAdditionalDetails?.fileName,
                              fileStoreId: e.fileStore,
                              tenantId: e.tenantId,
                            );
                           },).toList();
                           supportDocument.addAll(supportDocumentData);
                            print(supportDocument);
                          },
                          extensions: const ['jpg', 'png', 'jpeg'],
                          moduleName: 'works',
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (value) {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
