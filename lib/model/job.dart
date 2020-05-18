import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

class Job {
  final String id;
  final String title;
  final String salary;
  final String company;
  final String info;
  final String category;
  final String head;
  final String publish;

  Job({
    this.id,
    this.title,
    this.salary,
    this.company,
    this.info,
    this.category,
    this.head,
    this.publish,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}

/**
{ title: '测试1',
  salary: '5000',
  company: '百度',
  info: '来得及法律大富科技按劳动法吉安市领导',
  head: 'https://seopic.699pic.com/photo/40011/0709.jpg_wh1200.jpg',
  publish: 'adaaaaaa',
}
*/
