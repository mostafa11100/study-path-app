import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Location",
          style: TextStyleConst.textStyleconst20,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                //  child: locationpicker(),
              ),
              // SizedBox(height: 20.h),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Currently",
              //         style: TextStyleConst.textStyleconst17,
              //       ),
              //       SizedBox(height: 10.h),
              //       Text(
              //         "Egypt,eldakahlia,aga",
              //         style: TextStyleConst.textStyleconst15!
              //             .copyWith(color: ColorApp.neturalcolor11),
              //       ),
              //       SizedBox(height: 24.h),
              //       Text(
              //         "Edditing",
              //         style: TextStyleConst.textStyleconst17,
              //       ),
              //       TextField(
              //         decoration: InputDecoration(
              //             border: UnderlineInputBorder(
              //                 borderSide:
              //                     BorderSide(color: ColorApp.primarycolor6)),
              //             hintText: "Please Enter another addres",
              //             hintStyle: TextStyleConst.textStyleconst11!
              //                 .copyWith(color: ColorApp.neturalcolor10)),
              //       ),
              //       SizedBox(height: 40.h),
              //       SizedBox(
              //           height: 42.h,
              //           width: MediaQuery.of(context).size.width,
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 5.0),
              //             child: ElevatedButton(
              //                 style: ElevatedButton.styleFrom(
              //                     backgroundColor: ColorApp.primarycolor6),
              //                 onPressed: () {},
              //                 child: Text(
              //                   "Save Changes",
              //                   style: TextStyleConst.textStyleconst16!
              //                       .copyWith(color: Colors.white),
              //                 )),
              //           )),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget locationpicker() {
//   return FlutterLocationPicker(
//       initPosition: LatLong(23, 89),
//       selectLocationButtonStyle: ButtonStyle(
//         backgroundColor: WidgetStateProperty.all(Colors.blue),
//       ),
//       selectedLocationButtonTextStyle: const TextStyle(fontSize: 18),
//       selectLocationButtonText: 'Set Current Location',
//       selectLocationButtonLeadingIcon: const Icon(Icons.check),
//       initZoom: 11,
//       minZoomLevel: 5,
//       maxZoomLevel: 16,
//       trackMyPosition: true,
//       onError: (e) => print(e),
//       onPicked: (pickedData) {
//         print(pickedData.latLong.latitude);
//         print(pickedData.latLong.longitude);
//         print(pickedData.address);
//         print(pickedData.addressData['country']);
//       },
//       onChanged: (pickedData) {
//         print(pickedData.latLong.latitude);
//         print(pickedData.latLong.longitude);
//         print(pickedData.address);
//         print(pickedData.addressData);
//       });
// }
