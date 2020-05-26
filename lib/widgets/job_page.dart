import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boss/common/utils/http_util.dart';
import 'package:flutter_boss/model/job.dart';
import 'package:flutter_boss/widgets/job/job_item.dart';

// class JobPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text(
//           'job',
//           textDirection: TextDirection.ltr,
//         ),
//       ),
//     );
//   }
// }

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() => new _JobPageState();
}

class _JobPageState extends State<JobPage> with AutomaticKeepAliveClientMixin {
  Future<List<Job>> _fetchJobList() async {
    return Future.delayed(
      new Duration(seconds: 2),
      () => [
        new Job.fromJson({
          'id': '111',
          'title': '222222',
          'salary': '33333',
          'company': '44444',
          'info': '55555',
          'category': '66666',
          'head': '77777',
          'publish': '88888',
        }),
        new Job.fromJson({
          'id': '111',
          'title': '222222',
          'salary': '33333',
          'company': '44444',
          'info': '55555',
          'category': '66666',
          'head': '77777',
          'publish': '88888',
        }),
      ],
    );
    // print(333333);
    // List<Job> jobList = List<Job>();
    // print(4444);
    // print(jobList);
    // Response<Map<String, dynamic>> response =
    //     await HttpUtil().get('/jobs/list/1/');
    // print(11111);
    // print(response);
    // if (response.statusCode == 200) {
    //   Map<String, dynamic> result = response.data;
    //   for (dynamic data in result['data']['jobs']) {
    //     Job jobData = Job.fromJson(data);
    //     jobList.add(jobData);
    //   }
    // }
    // return jobList;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          '职位',
          style: new TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: new Center(
        child: new FutureBuilder(
          future: _fetchJobList(),
          builder: (context, AsyncSnapshot snapshot) {
            print(snapshot.connectionState);
            print(11111111111);
            print(snapshot.data.toString());
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  print(3333333);
                  return new Text('Error: ${snapshot.error}');
                } else {
                  print(222222222);
                  return _createListView(context, snapshot);
                }
            }
          },
        ),
      ),
    );
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Job> jobList = snapshot.data;
    return ListView.builder(
      key: PageStorageKey('job-list'),
      itemCount: jobList.length,
      itemBuilder: (BuildContext context, int index) {
        return new JobItem(
          onPressed: () {},
          job: jobList[index],
        );
      },
    );
  }
}
