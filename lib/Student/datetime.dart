// // lib/widgets/datetime_picker_example.dart

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DateTimePickerExample extends StatefulWidget {
//   const DateTimePickerExample({super.key});

//   @override
//   State<DateTimePickerExample> createState() => _DateTimePickerExampleState();
// }

// class _DateTimePickerExampleState extends State<DateTimePickerExample> {
//   DateTime? selectedDateTime;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             final pickedDate = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(2000),
//               lastDate: DateTime(2100),
//             );

//             final pickedTime = await showTimePicker(
//               context: context,
//               initialTime: TimeOfDay.now(),
//             );

//             if (pickedDate != null && pickedTime != null) {
//               setState(() {
//                 selectedDateTime = DateTime(
//                   pickedDate.year,
//                   pickedDate.month,
//                   pickedDate.day,
//                   pickedTime.hour,
//                   pickedTime.minute,
//                 );
//               });
//             }
//           },
//           child: Text("Pick Date & Time"),
//         ),
//         if (selectedDateTime != null)
//           Text(
//             DateFormat('yyyy-MM-dd – hh:mm a').format(selectedDateTime!),
//             style: TextStyle(fontSize: 16),
//           ),
//       ],
//     );
//   }
// }
