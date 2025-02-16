import 'package:intl/intl.dart';

final DateFormat formatString =
    DateFormat("yyyy-MM-ddTHH:mm:ss.SSSSSSSSS+00:00");

DateTime rfc3339ToDateTime(String rfc3339) {
  return DateTime.parse(rfc3339);
}

String dateTimeToRfc3339(DateTime dateTime) {
  return formatString.format(dateTime.toUtc());
}

String convertEventLevelToString(EventLevel eventLevel) {
  switch (eventLevel) {
    case EventLevel.world:
      return 'World';
    case EventLevel.national:
      return 'National';
    case EventLevel.regional:
      return 'Regional';
    case EventLevel.state:
      return 'State';
    case EventLevel.signature:
      return 'Signature';
    case EventLevel.other:
      return 'Other';
    default:
      throw ArgumentError('Invalid EventLevel: $eventLevel');
  }
}

String convertSkillTypeToString(SkillType skillType) {
  switch (skillType) {
    case SkillType.driver:
      return 'driver';
    case SkillType.programming:
      return 'programming';
    case SkillType.packageDeliveryTime:
      return 'package_delivery_time';
    default:
      throw ArgumentError('Invalid SkillType: $skillType');
  }
}

String convertGradeToString(Grade grade) {
  switch (grade) {
    case Grade.college:
      return 'College';
    case Grade.highSchool:
      return 'High School';
    case Grade.middleSchool:
      return 'Middle School';
    case Grade.elementarySchool:
      return 'Elementary School';
    default:
      throw ArgumentError('Invalid Grade: $grade');
  }
}

EventLevel convertStringToEventLevel(String eventLevel) {
  switch (eventLevel) {
    case 'World':
      return EventLevel.world;
    case 'National':
      return EventLevel.national;
    case 'Regional':
      return EventLevel.regional;
    case 'State':
      return EventLevel.state;
    case 'Signature':
      return EventLevel.signature;
    case 'Other':
      return EventLevel.other;
    default:
      throw ArgumentError('Invalid EventLevel: $eventLevel');
  }
}

SkillType convertStringToSkillType(String skillType) {
  switch (skillType) {
    case 'driver':
      return SkillType.driver;
    case 'programming':
      return SkillType.programming;
    case 'package_delivery_time':
      return SkillType.packageDeliveryTime;
    default:
      throw ArgumentError('Invalid SkillType: $skillType');
  }
}

Grade convertStringToGrade(String grade) {
  switch (grade) {
    case 'College':
      return Grade.college;
    case 'High School':
      return Grade.highSchool;
    case 'Middle School':
      return Grade.middleSchool;
    case 'Elementary School':
      return Grade.elementarySchool;
    default:
      throw ArgumentError('Invalid Grade: $grade');
  }
}
