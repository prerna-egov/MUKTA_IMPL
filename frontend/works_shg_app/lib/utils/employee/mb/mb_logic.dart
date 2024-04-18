// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:collection/collection.dart';

import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../models/employee/mb/mb_inbox_response.dart';

enum MBScreen { create, update}
class MBLogic {
// start experiment

  static List<FilteredMeasurements> formContract(
      {required MBDetailResponse mbDetailResponse}) {
    List<FilteredMeasurementsContract> s = getContract(
      mbDetailResponse!.contract!.lineItems!.first.contractLineItemRef!,
      mbDetailResponse,
    );
    FilteredMeasurements sata = FilteredMeasurements(
      totalAmount: 0.0,
      totalNorSorAmount: 0.0,
      totalSorAmount: 0.0,
      musterRollNumber: null,
      mbNumber: null,
      wfStatus: mbDetailResponse.estimate!.wfStatus,
      tenantId: null,
      endDate: 0,
      startDate: 0,
      entryDate: 0,
      referenceId: null,
      id: null,
      physicalRefNumber: null,
      measures: s.map((e) {
        FilteredMeasurementsMeasure filteredMeasurementsMeasure =
            FilteredMeasurementsMeasure(
              contracts: s,
                length: double.parse(  e.estimates!.first.length!.toString()) ?? 0.0,
                breath:double.parse( e.estimates!.first.width.toString() )?? 0.0,
                height:double.parse(  e.estimates!.first.height.toString() )?? 0.0,
                numItems: 0.0,
                cumulativeValue: 0.0,
                currentValue: 0.0,
                tenantId:
                    mbDetailResponse!.contract!.lineItems!.first.tenantId!,
                mbAmount: 0.0,
                targetId: e.contractLineItemRef,
                isActive: null,
                id: null,
                measureLineItems: e!.estimates!?.map((e) {
                  MeasureLineItem sk = MeasureLineItem(
                    width: e.width ?? 0.0,
                    height: e.height ?? 0.0,
                    length: e.length ?? 0.0,
                    number: 0.0,
                    quantity: 0.0,
                    measurelineitemNo: 0,
                  );

                  return sk;
                }).toList());


        return filteredMeasurementsMeasure;
      }).toList(),
      documents: null
    );

    return [sata];
  }

// end
  static List<FilteredMeasurements> getMeasureList(
      {required MBDetailResponse mbDetailResponse}) {
    final List<Measurement> allMeasurements =
       mbDetailResponse.allMeasurements is List?  mbDetailResponse.allMeasurements
    .map<Measurement>((dynamic item) {
      if (item is Measurement) {
        return item;
      } else {
        // Assuming there's a conversion method or constructor for Measurement
        return Measurement.fromJson(item); // Adjust this based on your actual implementation
      }
    })
    .toList()   : [];

    final data = allMeasurements.map((e) {
      FilteredMeasurements datak = FilteredMeasurements(
          documents: e.documents?.map((e) => e).toList(),
          id: e.id,
          totalSorAmount: e.additionalDetail?.sorAmount ?? 0.0,
          totalNorSorAmount: e.additionalDetail?.nonSorAmount ?? 0.0,
          totalAmount: e.additionalDetail?.totalAmount ?? 0.0,
          endDate: e.additionalDetail?.endDate ??
              (mbDetailResponse.period?.endDate ?? 00),
          startDate: e.additionalDetail?.startDate ??
              (mbDetailResponse.period?.startDate ?? 00),
          entryDate: e.entryDate,
          physicalRefNumber: e.physicalRefNumber,
          referenceId: e.referenceId,
          // to be chnaged
          //musterRollNumber: e.additionalDetail?.musterRollNumber ?? "",
          // musterRollNumber: mbDetailResponse.musterRolls?.first.musterRollNumber??"",
          musterRollNumber: mbDetailResponse.musterRolls is List
              ? mbDetailResponse.musterRolls?.first["musterRollNumber"] ?? ""
              : "",
          mbNumber: e.measurementNumber,
          wfStatus: e.wfStatus,
          tenantId: e.tenantId,
          measures: e.measures?.map((e) {
            FilteredMeasurementsMeasure filteredMeasurementsMeasure =
                FilteredMeasurementsMeasure(
              mbAmount: e.measureAdditionalDetails?.mbAmount,
              type: e.measureAdditionalDetails?.type,
              length: e.length,
              breath: e.breadth,
              height: e.height,
              numItems: e.numItems,
              currentValue: e.currentValue,
              cumulativeValue: e.cumulativeValue,
              tenantId: null,
              targetId: e.targetId,
              isActive: e.isActive,
              id: e.id,
              contracts: getContract(
                e.targetId!,
                mbDetailResponse,
              ),
              measureLineItems: e.measureAdditionalDetails != null
                  ? (e.measureAdditionalDetails!.measureLineItems != null &&
                          e.measureAdditionalDetails!.measureLineItems!
                              .isNotEmpty)
                      ? e.measureAdditionalDetails!.measureLineItems!
                      // testing null pre[null]
                      : [
                          MeasureLineItem(
                            width: e.breadth,
                            height: e.height,
                            length: e.length,
                            number: e.numItems,
                            quantity: e.currentValue,
                            measurelineitemNo: 0,
                          ),
                        ]
                  // end
                  : null,
            );

            return filteredMeasurementsMeasure;
          }).toList());

      return datak;
    }).toList();

    // print(data);
    return data.whereNotNull().toList() ?? [];
  }

  static List<FilteredMeasurementsContract> getContract(
      String targetId, MBDetailResponse mb) {
    final alldata = mb.contract?.lineItems?.map((e) {
      if (e.contractLineItemRef == targetId) {
        FilteredMeasurementsContract filteredMeasurementsContract =
            FilteredMeasurementsContract(
                contractAdditionalDetails: mb.contract?.additionalDetails,
                estimateId: e.estimateId,
                estimateLineItemId: e.estimateLineItemId,
                contractLineItemRef: e.contractLineItemRef,
                unitRate: e.unitRate,
                status: e.status,
                estimates: getEstimate(e.estimateLineItemId!, mb));

        return filteredMeasurementsContract;
      }
    }).toList();
    return alldata!.whereNotNull().toList() ?? [];
  }

  // estimate

  static List<FilteredMeasurementsEstimate> getEstimate(
      String contractLineItemRef, MBDetailResponse mb) {
    final alldata = mb.estimate?.estimateDetails?.map((e) {
      if (e.id == contractLineItemRef) {
        FilteredMeasurementsEstimate filteredMeasurementsEstimate =
            FilteredMeasurementsEstimate(
          id: e.id,
          sorId: e.sorId,
          category: e.category,
          name: e.name,
          description: e.description,
          unitRate: e.unitRate,
          noOfunit: e.noOfunit != null
              ? double.parse((e.noOfunit!.toDouble()).toStringAsFixed(2))
              : 0,
          uom: e.uom,
          length: e.length != null ? e.length!.toInt() : 0,
          width: e.width != null ? e.width!.toInt() : 0,
          height: e.height != null ? e.height!.toInt() : 0,
          quantity: e.quantity != null ? e.quantity!.toInt() : 0,
          isDeduction: e.isDeduction,
        );

        return filteredMeasurementsEstimate;
      }
    }).toList();

    return alldata!.whereNotNull().toList() ?? [];
  }

// old
//   static List<List<List<SorObject>>> getSors(List<FilteredMeasurements> s) {
//     // List<FilteredMeasurementsMeasure> sor = [];
//     // List<FilteredMeasurementsMeasure> nonSor = [];
//     List<List<List<SorObject>>> mark=[];
//     final k = s!.first!.measures;

//     for (int a = 0; a < s.length; a++) {
//       List<FilteredMeasurementsMeasure> sor = [];
//       List<FilteredMeasurementsMeasure> nonSor = [];

//       for (int i = 0; i < s[a].measures!.length; i++) {
//         if (s[a].measures![i].contracts!.first.estimates!.first.category == "SOR") {
//           sor.add(s[a].measures![i]);
//         } else {
//           nonSor.add(s[a].measures![i]);
//         }
//       }

//       List<SorObject> listSors = [];
//       List<SorObject> listNonSors = [];

//       bool isObjectExists(String objectId) {
//         return listSors.any((obj) => obj.sorId == objectId);
//       }

//       void addObjectOrModify(
//           String objectId, FilteredMeasurementsMeasure newobj, String type) {
//         if (type == "NonSOR") {
//           if (isObjectExists(objectId)) {
//             SorObject existingObject =
//                 listNonSors.firstWhere((obj) => obj.sorId == objectId);

//             existingObject.filteredMeasurementsMeasure.add(newobj);
//           } else {
//             listNonSors.add(
//               SorObject(
//                 filteredMeasurementsMeasure: [newobj],
//                 id: newobj.contracts!.first.estimates!.first.id,
//                 sorId: newobj.contracts!.first.estimates!.first.sorId,
//               ),
//             );
//           }
//         } else {
//           if (isObjectExists(objectId)) {
//             SorObject existingObject =
//                 listSors.firstWhere((obj) => obj.sorId == objectId);

//             existingObject.filteredMeasurementsMeasure.add(newobj);
//           } else {
//             listSors.add(
//               SorObject(
//                 filteredMeasurementsMeasure: [newobj],
//                 id: newobj.contracts!.first.estimates!.first.id,
//                 sorId: newobj.contracts!.first.estimates!.first.sorId,
//               ),
//             );
//           }
//         }
//       }

//       for (var obj in sor) {
//         String mValue = obj!.contracts!.first.estimates!.first.sorId!;

//         addObjectOrModify(mValue, obj, "SOR");
//       }

//       //

// //get nonSors

//       for (var obj in nonSor) {
//         String mValue = obj!.contracts!.first.estimates!.first.sorId!;

//         addObjectOrModify(mValue, obj, "NonSOR");
//       }

// //
//       //return [listSors, listNonSors];
//       mark.add([listSors, listNonSors]);
//     }
//   return mark;
// }

// //

  static List<List<List<SorObject>>> getSors(List<FilteredMeasurements> s) {
    List<List<List<SorObject>>> mark = [];

    for (int a = 0; a < s.length; a++) {
      List<FilteredMeasurementsMeasure> sor = [];
      List<FilteredMeasurementsMeasure> nonSor = [];

      for (int i = 0; i < s[a].measures!.length; i++) {
        if (s[a].measures![i].contracts!.first.estimates!.first.category ==
            "SOR") {
          sor.add(s[a].measures![i]);
        } else {
          nonSor.add(s[a].measures![i]);
        }
      }

      List<SorObject> listSors = [];
      List<SorObject> listNonSors = [];

      bool isObjectExists(String objectId, String type) {
        List<SorObject> list = type == "NonSOR" ? listNonSors : listSors;
        return list.any((obj) => obj.sorId == objectId);
      }

      void addObjectOrModify(
          String objectId, FilteredMeasurementsMeasure newobj, String type) {
        List<SorObject> list = type == "NonSOR" ? listNonSors : listSors;
        if (isObjectExists(objectId, type)) {
          SorObject existingObject =
              list.firstWhere((obj) => obj.sorId == objectId);
          List<FilteredMeasurementsMeasure> mutableList =
              List.from(existingObject.filteredMeasurementsMeasure);
          mutableList.add(newobj);
          int index = list.indexWhere((obj) => obj.sorId == objectId);
          // list[index] = existingObject.updateFilteredMeasurementsMeasure(mutableList);
          list[index] = SorObject(
            sorId: existingObject.sorId,
            id: existingObject.id,
            filteredMeasurementsMeasure: mutableList,
          );
        } else {
          list.add(
            SorObject(
              filteredMeasurementsMeasure: [newobj],
              id: newobj.contracts!.first.estimates!.first.id,
              sorId: newobj.contracts!.first.estimates!.first.sorId,
            ),
          );
        }
      }

      for (var obj in sor) {
        String mValue = obj.contracts!.first.estimates!.first.sorId!;
        addObjectOrModify(mValue, obj, "SOR");
      }

      for (var obj in nonSor) {
        String mValue = obj.contracts!.first.estimates!.first.sorId!;
        addObjectOrModify(mValue, obj, "NonSOR");
      }

      mark.add([listSors, listNonSors]);
    }
    return mark;
  }

  // to get

  static List<Measure> getList(List<SorObject> sorObjects) {
    List<Measure> measureList = [];

    for (SorObject sorObject in sorObjects) {
      for (FilteredMeasurementsMeasure measure
          in sorObject.filteredMeasurementsMeasure) {
        measureList.add(Measure(
          description: measure.contracts?.first.estimates?.first.description,
          comments:
              null, // You can set comments to the appropriate value if available
          targetId: measure.targetId,
          breadth: measure.breath,
          length: measure.length,
          height: measure.height,
          isActive: measure.isActive,
          referenceId: measure.referenceId,
          numItems: measure.numItems,
          id: measure.id,
          cumulativeValue: measure.cumulativeValue,
          currentValue: measure.currentValue,
          measureAdditionalDetails: MeasureAdditionalDetails(
            type: measure.type,
            mbAmount: measure.mbAmount,
            measureLineItems: measure.measureLineItems,
          ),
        ));
      }
    }

    return measureList;
  }

// form payload for update MB

  static MBDetailResponse getMbPayloadUpdate({
    required List<FilteredMeasurements> data,
    required List<List<SorObject>> sorList,
    required WorkFlow workFlow,
  }) {
    MBDetailResponse sa = MBDetailResponse(
      measurement: Measurement(
        documents: data.first.documents?.map((e) => e).toList(),
        id: data.first.id,
        tenantId: data.first.tenantId,
        measurementNumber: data.first.mbNumber,
        physicalRefNumber: data.first.physicalRefNumber,
        referenceId: data.first.referenceId,
        entryDate: data.first.entryDate,
        isActive: true,
        wfStatus: data.first.wfStatus,
        workflow: workFlow,
        additionalDetail: MeasurementAdditionalDetail(
          endDate: data.first.endDate,
          sorAmount: data.first.totalSorAmount,
          nonSorAmount: data.first.totalNorSorAmount,
          startDate: data.first.startDate,
          musterRollNumber: [data.first.musterRollNumber.toString()],
          totalAmount: data.first.totalAmount,
        ),
        measures: MBLogic.getList(
          sorList.expand((element) => element).toList(),
        ),
      ),
    );

    return sa;
  }

// to map

  static Map<String, dynamic> measurementToMap(Measurement measurement) {
    Map<String, dynamic> data = {
      "documents": measurement.documents!=null?
      measurement.documents!.map((e) {
        return {
          "fileStore": e.fileStore,
          "id": e.id,
          "documentUid": e.documentUid,
          "documentType": e.documentType,
          "additionalDetails": {
            "fileName": e.documentAdditionalDetails != null
                ? e.documentAdditionalDetails!.fileName ?? ''
                : '',
            "fileType": e.documentAdditionalDetails != null
                ? e.documentAdditionalDetails!.fileType ?? ''
                : '',
            "tenantId": e.documentAdditionalDetails != null
                ? e.documentAdditionalDetails!.tenantId ?? ''
                : ''
          }
        };
      }).toList():[],

      'id': measurement.id??"",
      'tenantId': measurement.tenantId,
      'measurementNumber': measurement.measurementNumber??"",
      'entryDate': measurement.entryDate,
      'isActive': measurement.isActive,
      'wfStatus': measurement.wfStatus,
      'referenceId': measurement.referenceId,
      'physicalRefNumber': measurement.physicalRefNumber,
      'workflow': {
        'action': measurement.workflow?.action,
        'comment': measurement.workflow?.comment,
        'assignees': measurement.workflow?.assignees,
        'documents': measurement.workflow?.documents!.map((e) {
          return {
            "documentType": e.documentType,
            "documentUid": e.documentUid,
            "fileName": e.fileName,
            "fileStoreId": e.fileStoreId,
            "tenantId": e.tenantId
          };
        }).toList()
      },
      'additionalDetails': {
        'endDate': measurement.additionalDetail?.endDate,
        'sorAmount': measurement.additionalDetail?.sorAmount,
        'startDate': measurement.additionalDetail?.startDate,
        'totalAmount': measurement.additionalDetail?.totalAmount,
        'nonSorAmount': measurement.additionalDetail?.nonSorAmount,
        'musterRollNumber': [measurement.additionalDetail?.musterRollNumber],
      },
      'measures': measurement.measures!.map((measure) {
        return {
          'description': measure.description,
          'comments': measure.comments,
          'targetId': measure.targetId,
          'breadth': measure.breadth,
          'length': measure.length,
          'isActive': measure.isActive,
          'referenceId': measure.referenceId,
          'numItems': measure.numItems,
          'id': measure.id,
          'cumulativeValue': measure.cumulativeValue,
          'currentValue': measure.currentValue,
          'additionalDetails': {
            'type': measure.measureAdditionalDetails?.type,
            'mbAmount': measure.measureAdditionalDetails?.mbAmount,
            'measureLineItems':
                measure.measureAdditionalDetails!.measureLineItems?.map((item) {
              return {
                'width': item.width,
                'height': item.height,
                'length': item.length,
                'number': item.number,
                'quantity': item.quantity,
                'measurelineitemNo': item.measurelineitemNo,
              };
            }).toList(),
          },
        };
      }).toList(),
    };

    return data;
  }

  // copywith

  static List<SorObject> updateMeasurementLine(
      List<SorObject> sorObjects,
      String sorId,
      String filteredMeasurementsMeasureId,
      int measurementLineIndex,
      MeasureLineItem updatedMeasurementLine) {
    return sorObjects.map((sorObject) {
      if (sorObject.sorId == sorId) {
        final List<FilteredMeasurementsMeasure>
            updatedFilteredMeasurementsMeasureList = sorObject
                .filteredMeasurementsMeasure
                .map((filteredMeasurementsMeasure) {
          if (filteredMeasurementsMeasure.id == filteredMeasurementsMeasureId) {
            final List<MeasureLineItem> updatedMeasurementLineList =
                filteredMeasurementsMeasure.measureLineItems!
                    .map((measurementLine) {
              if (measurementLine.measurelineitemNo == measurementLineIndex) {
                // MeasureLineItem ml= MeasureLineItem(
                //   width:
                // );

                return updatedMeasurementLine;
              }
              return measurementLine;
            }).toList();

            return filteredMeasurementsMeasure.copyWith(
              measureLineItems: updatedMeasurementLineList,
            );
          }
          return filteredMeasurementsMeasure;
        }).toList();

        return sorObject.copyWith(
          filteredMeasurementsMeasure: updatedFilteredMeasurementsMeasureList,
        );
      }
      return sorObject;
    }).toList();
  }

  static List<SorObject> addMeasurementLine(
    List<SorObject> sorObjects,
    String sorId,
    String filteredMeasurementsMeasureId,
    int measurementLineIndex,
    List<MeasureLineItem> updatedMeasurementLine,
  ) {
    return sorObjects.map((sorObject) {
      if (sorObject.sorId == sorId) {
        final List<FilteredMeasurementsMeasure>
            updatedFilteredMeasurementsMeasureList = sorObject
                .filteredMeasurementsMeasure
                .map((filteredMeasurementsMeasure) {
          if (filteredMeasurementsMeasure.id == filteredMeasurementsMeasureId) {
            final List<MeasureLineItem> updatedMeasurementLineItems =
                List.from(filteredMeasurementsMeasure.measureLineItems ?? [])
                  ..addAll(updatedMeasurementLine);

            return filteredMeasurementsMeasure.copyWith(
              measureLineItems: updatedMeasurementLineItems,
            );
          }
          return filteredMeasurementsMeasure;
        }).toList();

        return sorObject.copyWith(
          filteredMeasurementsMeasure: updatedFilteredMeasurementsMeasureList,
        );
      }
      return sorObject;
    }).toList();
  }

// Function to calculate total quantity and skip object at specified index
  static double calculateTotalQuantityAndSkip(
    List<SorObject> sorObjects,
    String sorId,
    String filteredMeasurementsMeasureId,
    int measurementLineIndex,
  ) {
    double totalQuantity = 0.0; // Initialize total quantity

    for (var sorObject in sorObjects) {
      if (sorObject.sorId == sorId) {
        for (var filteredMeasurementsMeasure
            in sorObject.filteredMeasurementsMeasure) {
          if (filteredMeasurementsMeasure.id == filteredMeasurementsMeasureId) {
            for (var measurementLine
                in filteredMeasurementsMeasure.measureLineItems!) {
              if (measurementLine.measurelineitemNo != measurementLineIndex) {
                // Add quantity to totalQuantity
                totalQuantity +=
                    double.parse(measurementLine.quantity.toString());
              }
            }
          }
        }
      }
    }

    // Return totalQuantity
    return totalQuantity.toDouble();
  }

// Function to calculate total quantity and  object at specified index
  static TotalEstimate calculateTotalQuantity(
    List<SorObject> sorObjects,
    String sorId,
    String filteredMeasurementsMeasureId,
    int measurementLineIndex,
  ) {
    List<SorObject> updatedSorObjects = [];
    double totalAmount = 0.0;
    for (SorObject sorObject in sorObjects) {
      List<FilteredMeasurementsMeasure> updatedMeasures = [];
      for (FilteredMeasurementsMeasure measure
          in sorObject.filteredMeasurementsMeasure) {
        double sum = 0.0;
        for (int j = 0; j < measure.measureLineItems!.length; j++) {
          sum += double.parse(measure.measureLineItems![j].quantity.toString());
        }
        // Create a new instance of FilteredMeasurementsMeasure with updated numItems
        FilteredMeasurementsMeasure updatedMeasure =
            FilteredMeasurementsMeasure(
          length: measure.length,
          breath: measure.breath,
          height: measure.height,
          numItems: sum,
          cumulativeValue: measure.cumulativeValue,
          currentValue: measure.currentValue,
          tenantId: measure.tenantId,
          mbAmount: double.parse(
              (sum * measure.contracts!.first.unitRate!).toString()),
          type: measure.type,
          targetId: measure.targetId,
          isActive: measure.isActive,
          id: measure.id,
          referenceId: measure.referenceId,
          measureLineItems: measure.measureLineItems,
          contracts: measure.contracts,
        );
        totalAmount = totalAmount +
            double.parse((sum * measure.contracts!.first.unitRate!).toString());
        updatedMeasures.add(updatedMeasure);
      }
      // Create a new SorObject instance with the updated list
      SorObject updatedSorObject = SorObject(
        // Copy other properties from sorObject if necessary
        id: sorObject.id,
        sorId: sorObject.sorId,
        filteredMeasurementsMeasure: updatedMeasures,
        // Add other properties from sorObject if necessary
      );
      updatedSorObjects.add(updatedSorObject);
    }
    // return updatedSorObjects;

    return TotalEstimate(totalAmount, updatedSorObjects);
  }
}

class TotalEstimate {
  final double totalAmount;
  final List<SorObject> sorObjectList;
  const TotalEstimate(this.totalAmount, this.sorObjectList);
}