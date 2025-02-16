import 'dart:convert';

import 'package:robotevents/robotevents.dart';

RobotEvents robotEvents = RobotEvents(
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2Y0MjEzMmE2ZTVhMjBjZDE0MDBlMjgwMGJjZTlmYzAzZTRiYzgxNzU2MmExZWFjMmNkNzY0ODU3MWQ4YmNkODg0OGE1YWE2ZmE4ODRlZTkiLCJpYXQiOjE3MzkwNDg2MzIuNzQ2MDUxMSwibmJmIjoxNzM5MDQ4NjMyLjc0NjA1MiwiZXhwIjoyNjg1NzMzNDMyLjczNTgxNzksInN1YiI6IjE0MzgwOCIsInNjb3BlcyI6W119.GEe3TorV_V3x1cDxq6ckgyVafi0QDSskLAWz3hh9oQxNcrZ2Knc0oGxQ2R2MGHAfUVK4Tqu2f_dIPvcQ9ayH9RHhXSSDo7zcOlBJuujsbJH0ZvKxKQhy8aBFTL_TrMFqTorctxheX5ygz1ljD8WIe4FVXixT73T_M6g23U1wML9wG3rMQb-ozJkQR2Xued4bAzcXl92K8RQkS5t2JrQNugnlL8OWeO-pys4qnE6FT5V6sX-IQ-q9QO8e2OKjjen3m6tfR1WFQIsRdJ62KxxeoA13NhTQdFaKTKRwAgkqAXSLMQ_ax3aqmfP81Wmo-7hlRc8HTmgrs8vIVA9uoDS1CtsSnXDut6oP4zIYLQHnmZ9eZ4nZW7zMej-Njc9lAdo7-7x79y4stF3pmoL74u2idf_HRM6vil7ytICA386zoCMSmyTaTl1HE3zL7PS72_w4QlLpWRgvJTg91KXk6m3dCkzm9nJvj9dn60KglvybJjhLN7BAD3uigxXOH5ae4D7VRSBut0OFkTtmtC4qxLEsEd0WnXRscjnNYA0k8iPnovu5IKexh2aB6wZuqNTiylThDvM3V9Opg2eI1Yku-Ujgr8IHSnI8d-vjjq4p1_iv3HQIvS52ScbS3Y65xHaLT4dV3Zw7I5tCawKx7doXXCJ45lb60ooharm8rwyQk54RpmY");

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
