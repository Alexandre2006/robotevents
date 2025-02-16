import 'dart:convert';

import 'package:robotevents/robotevents.dart';

RobotEvents robotEvents = RobotEvents();
// CURRENT TEST EVENT: 55729
// CURRENT TEST DIVISION: 1

void main() {
  robotEvents.getEventRankings(55729, 1, limit: 250).then((rankings) {
    rankings.data?.forEach((ranking) {
      print(
          "#${ranking.rank} ${ranking.team?.name}: ${ranking.wins}W - ${ranking.losses}L - ${ranking.ties}T (${ranking.wp} WP, ${ranking.ap} AP, ${ranking.sp} SP)");
    });
  });
}

// void main() {
//   robotEvents.getEventMatches(55729, 1, limit: 250).then((matches) {
//     matches.data?.forEach((match) {
//       // Get red teams
//       List<String> redTeams = match.alliances
//               ?.firstWhere((alliance) => alliance.color == AllianceColor.red)
//               .teams
//               .map((team) => team.team?.name ?? "Unknown")
//               .toList() ??
//           [];
//       List<String> blueTeams = match.alliances
//               ?.firstWhere((alliance) => alliance.color == AllianceColor.blue)
//               .teams
//               .map((team) => team.team?.name ?? "Unknown")
//               .toList() ??
//           [];
//       int redScore = match.alliances
//               ?.firstWhere((alliance) => alliance.color == AllianceColor.red)
//               .score ??
//           0;

//       int blueScore = match.alliances
//               ?.firstWhere((alliance) => alliance.color == AllianceColor.blue)
//               .score ??
//           0;

//       print(
//           "${redTeams.join(", ")} (RED) vs ${blueTeams.join(", ")} (BLUE): $redScore - $blueScore");
//     });
//   });
// }

// void main() {
//   robotEvents.getEventSkills(55729, limit: 250).then((skills) {
//     // For each skills, store the driver and programming scores
//     Map<String, int> driverScores = {};
//     Map<String, int> programmingScores = {};
//     skills.data?.forEach((skill) {
//       if (skill.type == SkillType.driver) {
//         driverScores[skill.team?.name ?? "Unknown"] = skill.score ?? 0;
//       } else if (skill.type == SkillType.programming) {
//         programmingScores[skill.team?.name ?? "Unknown"] = skill.score ?? 0;
//       }
//     });

//     // For each team, calculate the total score
//     Map<String, int> totalScores = {};
//     driverScores.forEach((team, score) {
//       totalScores[team] = (totalScores[team] ?? 0) + score;
//     });

//     programmingScores.forEach((team, score) {
//       totalScores[team] = (totalScores[team] ?? 0) + score;
//     });

//     // Sort the teams by total score
//     List<MapEntry<String, int>> sortedScores = totalScores.entries.toList()
//       ..sort((a, b) => b.value.compareTo(a.value));

//     // Print out all of the teams and their scores
//     sortedScores.forEach((entry) {
//       print(
//           "#${sortedScores.indexOf(entry)} ${entry.key}: ${entry.value} (${driverScores[entry.key] ?? 0} driver, ${programmingScores[entry.key] ?? 0} programming)");
//     });
//   });
// }
