import 'package:flutter/material.dart';
import 'package:flutter_boss/common/config/config.dart';
import 'package:flutter_boss/model/job.dart';

// class JobItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         new Text('job_item'),
//       ],
//     );
//   }
// }
class JobItem extends StatelessWidget {
  final Job job;
  VoidCallback onPressed;

  JobItem({Key key, this.job, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {}
}
