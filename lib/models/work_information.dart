import 'package:freezed_annotation/freezed_annotation.dart';

enum EnterYear {
  year2020(displayName: 2020),
  year2021(displayName: 2021),
  year2022(displayName: 2022),
  year2023(displayName: 2023),
  undefined(displayName: 0);

  final int displayName;
  const EnterYear({required this.displayName});
}

class EnterYearEnumConverter implements JsonConverter<EnterYear, int> {
  const EnterYearEnumConverter();
  @override
  EnterYear fromJson(int json) {
    final EnterYear enterYear = EnterYear.values.firstWhere(
        (element) => element.displayName == json,
        orElse: () => EnterYear.undefined);
    return enterYear;
  }
  @override
  int toJson(EnterYear object) => object.displayName;
}

enum EventName {
  localLearning(
    displayName: '信州学',
  ),
  individualTankyu(
    displayName: '個人探究',
  ),
  undefined(
    displayName: '指定なし',
  );

  final String displayName;

  const EventName({required this.displayName});
}

class EventNameEnumConverter implements JsonConverter<EventName, String> {
  const EventNameEnumConverter();

  @override
  EventName fromJson(String json) {
    final EventName eventName = EventName.values.firstWhere(
        (element) => element.name == json,
        orElse: () => EventName.undefined);
    return eventName;
  }

  @override
  String toJson(EventName object) => object.name;
}

enum Course {
  tankyu(
    displayName: '探究科',
  ),
  general(
    displayName: '普通科',
  ),
  undefined(
    displayName: '指定なし',
  );

  final String displayName;
  const Course({required this.displayName});
}

class CourseEnumConverter implements JsonConverter<Course, String> {
  const CourseEnumConverter();

  @override
  Course fromJson(String json) {
    final Course course = Course.values.firstWhere(
        (element) => element.name == json,
        orElse: () => Course.undefined);
    return course;
  }

  @override
  String toJson(Course object) => object.name;
}
