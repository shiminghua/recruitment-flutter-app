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
    List<Job> jobList = List<Job>();
    Response<Map<String, dynamic>> response =
        await HttpUtil().get('/api/jobs/list/1');
    if (response.statusCode == 200) {
      Map<String, dynamic> result = response.data;
      for (dynamic data in result['data']['jobs']) {
        Job jobData = Job.fromJson(data);
        jobList.add(jobData);
      }
    }
    return jobList;
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
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.error) {
                return new Text('Error: ${snapshot.error}');
              } else {
                return _createListView(context, snapshot);
              }
          }
        },
      )),
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
