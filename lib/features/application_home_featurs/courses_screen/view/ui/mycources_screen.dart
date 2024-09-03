import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MycourcesScreen extends StatefulWidget {
  MycourcesScreen({super.key});

  @override
  State<MycourcesScreen> createState() => _MycourcesScreenState();
}

class _MycourcesScreenState extends State<MycourcesScreen> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 200.h),
            child: Column(
              children: [
                AnimatedContainer(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: visible ? 100 : 0,
                  duration: const Duration(milliseconds: 800),
                )
              ],
            )),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              visible = !visible;
            });
          },
          child: Text("click"),
        ),
      ),
    );
  }
}
