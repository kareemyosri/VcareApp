

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/booking/screens/booking_screen.dart';
import 'package:my_app/util/model/doctor.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DoctorItem extends StatelessWidget {
  final Doctors doctor;
  const DoctorItem({super.key, required this.doctor, });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(doctor.photo.toString()
      ,      fit: BoxFit.cover,
        ),
      ),
      title: Text(
        doctor.name.toString() ,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
      subtitle:  Row(
        children: [
          Text(
            doctor.specialization!.name.toString() ,
           //"Mike",
            style:const TextStyle(
              color: Colors.black,
            ),
          ),
        
        const   Spacer(flex: 1,),
          Text(
           "City ${doctor.city!.governrate!.name}",
        //   'City',
            style:const  TextStyle(
              color: Colors.black,
            ),
          ),
           SizedBox(
            width: 3.w
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: BookingScreen(doctor: doctor,),
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,);
        },
        icon: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
     ),
);
}
}

