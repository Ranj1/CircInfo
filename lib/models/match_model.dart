import 'dart:convert';

MatchDetail matchDetailFromJson(String str) => MatchDetail.fromJson(json.decode(str));

String matchDetailToJson(MatchDetail data) => json.encode(data.toJson());

class MatchDetail {
  Matchdetail matchdetail;
  List<String> nuggets;
  List<Inning> innings;
  Map<String, Team> teams;
  Map<String, List<String>> notes;

  MatchDetail({
    required this.matchdetail,
    required this.nuggets,
    required this.innings,
    required this.teams,
    required this.notes,
  });

  factory MatchDetail.fromJson(Map<String, dynamic> json) => MatchDetail(
    matchdetail: Matchdetail.fromJson(json["Matchdetail"]),
    nuggets: List<String>.from(json["Nuggets"].map((x) => x)),
    innings: List<Inning>.from(json["Innings"].map((x) => Inning.fromJson(x))),
    teams: Map.from(json["Teams"]).map((k, v) => MapEntry<String, Team>(k, Team.fromJson(v))),
    notes: Map.from(json["Notes"]).map((k, v) => MapEntry<String, List<String>>(k, List<String>.from(v.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "Matchdetail": matchdetail.toJson(),
    "Nuggets": List<dynamic>.from(nuggets.map((x) => x)),
    "Innings": List<dynamic>.from(innings.map((x) => x.toJson())),
    "Teams": Map.from(teams).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "Notes": Map.from(notes).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
  };
}

class Inning {
  String number;
  String battingteam;
  String total;
  String wickets;
  String overs;
  String runrate;
  String byes;
  String legbyes;
  String wides;
  String noballs;
  String penalty;
  String allottedOvers;
  List<InningBatsman> batsmen;
  PartnershipCurrent partnershipCurrent;
  List<Bowler> bowlers;
  List<FallofWicket> fallofWickets;
  PowerPlay powerPlay;
  String? target;

  Inning({
    required this.number,
    required this.battingteam,
    required this.total,
    required this.wickets,
    required this.overs,
    required this.runrate,
    required this.byes,
    required this.legbyes,
    required this.wides,
    required this.noballs,
    required this.penalty,
    required this.allottedOvers,
    required this.batsmen,
    required this.partnershipCurrent,
    required this.bowlers,
    required this.fallofWickets,
    required this.powerPlay,
    this.target,
  });

  factory Inning.fromJson(Map<String, dynamic> json) => Inning(
    number: json["Number"],
    battingteam: json["Battingteam"],
    total: json["Total"],
    wickets: json["Wickets"],
    overs: json["Overs"],
    runrate: json["Runrate"],
    byes: json["Byes"],
    legbyes: json["Legbyes"],
    wides: json["Wides"],
    noballs: json["Noballs"],
    penalty: json["Penalty"],
    allottedOvers: json["AllottedOvers"],
    batsmen: List<InningBatsman>.from(json["Batsmen"].map((x) => InningBatsman.fromJson(x))),
    partnershipCurrent: PartnershipCurrent.fromJson(json["Partnership_Current"]),
    bowlers: List<Bowler>.from(json["Bowlers"].map((x) => Bowler.fromJson(x))),
    fallofWickets: List<FallofWicket>.from(json["FallofWickets"].map((x) => FallofWicket.fromJson(x))),
    powerPlay: PowerPlay.fromJson(json["PowerPlay"]),
    target: json["Target"],
  );

  Map<String, dynamic> toJson() => {
    "Number": number,
    "Battingteam": battingteam,
    "Total": total,
    "Wickets": wickets,
    "Overs": overs,
    "Runrate": runrate,
    "Byes": byes,
    "Legbyes": legbyes,
    "Wides": wides,
    "Noballs": noballs,
    "Penalty": penalty,
    "AllottedOvers": allottedOvers,
    "Batsmen": List<dynamic>.from(batsmen.map((x) => x.toJson())),
    "Partnership_Current": partnershipCurrent.toJson(),
    "Bowlers": List<dynamic>.from(bowlers.map((x) => x.toJson())),
    "FallofWickets": List<dynamic>.from(fallofWickets.map((x) => x.toJson())),
    "PowerPlay": powerPlay.toJson(),
    "Target": target,
  };
}

class InningBatsman {
  String batsman;
  String runs;
  String balls;
  String fours;
  String sixes;
  String dots;
  String strikerate;
  String dismissal;
  String howout;
  String bowler;
  String fielder;
  bool? isonstrike;

  InningBatsman({
    required this.batsman,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.dots,
    required this.strikerate,
    required this.dismissal,
    required this.howout,
    required this.bowler,
    required this.fielder,
    this.isonstrike,
  });

  factory InningBatsman.fromJson(Map<String, dynamic> json) => InningBatsman(
    batsman: json["Batsman"],
    runs: json["Runs"],
    balls: json["Balls"],
    fours: json["Fours"],
    sixes: json["Sixes"],
    dots: json["Dots"],
    strikerate: json["Strikerate"],
    dismissal: json["Dismissal"],
    howout: json["Howout"],
    bowler: json["Bowler"],
    fielder: json["Fielder"],
    isonstrike: json["Isonstrike"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Runs": runs,
    "Balls": balls,
    "Fours": fours,
    "Sixes": sixes,
    "Dots": dots,
    "Strikerate": strikerate,
    "Dismissal": dismissal,
    "Howout": howout,
    "Bowler": bowler,
    "Fielder": fielder,
    "Isonstrike": isonstrike,
  };
}

class Bowler {
  String bowler;
  String overs;
  String maidens;
  String runs;
  String wickets;
  String economyrate;
  String noballs;
  String wides;
  String dots;
  bool? isbowlingtandem;
  bool? isbowlingnow;
  List<ThisOver>? thisOver;

  Bowler({
    required this.bowler,
    required this.overs,
    required this.maidens,
    required this.runs,
    required this.wickets,
    required this.economyrate,
    required this.noballs,
    required this.wides,
    required this.dots,
    this.isbowlingtandem,
    this.isbowlingnow,
    this.thisOver,
  });

  factory Bowler.fromJson(Map<String, dynamic> json) => Bowler(
    bowler: json["Bowler"],
    overs: json["Overs"],
    maidens: json["Maidens"],
    runs: json["Runs"],
    wickets: json["Wickets"],
    economyrate: json["Economyrate"],
    noballs: json["Noballs"],
    wides: json["Wides"],
    dots: json["Dots"],
    isbowlingtandem: json["Isbowlingtandem"],
    isbowlingnow: json["Isbowlingnow"],
    thisOver: json["ThisOver"] == null ? [] : List<ThisOver>.from(json["ThisOver"]!.map((x) => ThisOver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Bowler": bowler,
    "Overs": overs,
    "Maidens": maidens,
    "Runs": runs,
    "Wickets": wickets,
    "Economyrate": economyrate,
    "Noballs": noballs,
    "Wides": wides,
    "Dots": dots,
    "Isbowlingtandem": isbowlingtandem,
    "Isbowlingnow": isbowlingnow,
    "ThisOver": thisOver == null ? [] : List<dynamic>.from(thisOver!.map((x) => x.toJson())),
  };
}

class ThisOver {
  String t;
  String b;

  ThisOver({
    required this.t,
    required this.b,
  });

  factory ThisOver.fromJson(Map<String, dynamic> json) => ThisOver(
    t: json["T"],
    b: json["B"],
  );

  Map<String, dynamic> toJson() => {
    "T": t,
    "B": b,
  };
}

class FallofWicket {
  String batsman;
  String score;
  String overs;

  FallofWicket({
    required this.batsman,
    required this.score,
    required this.overs,
  });

  factory FallofWicket.fromJson(Map<String, dynamic> json) => FallofWicket(
    batsman: json["Batsman"],
    score: json["Score"],
    overs: json["Overs"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Score": score,
    "Overs": overs,
  };
}

class PartnershipCurrent {
  String runs;
  String balls;
  List<PartnershipCurrentBatsman> batsmen;

  PartnershipCurrent({
    required this.runs,
    required this.balls,
    required this.batsmen,
  });

  factory PartnershipCurrent.fromJson(Map<String, dynamic> json) => PartnershipCurrent(
    runs: json["Runs"],
    balls: json["Balls"],
    batsmen: List<PartnershipCurrentBatsman>.from(json["Batsmen"].map((x) => PartnershipCurrentBatsman.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Runs": runs,
    "Balls": balls,
    "Batsmen": List<dynamic>.from(batsmen.map((x) => x.toJson())),
  };
}

class PartnershipCurrentBatsman {
  String batsman;
  String runs;
  String balls;

  PartnershipCurrentBatsman({
    required this.batsman,
    required this.runs,
    required this.balls,
  });

  factory PartnershipCurrentBatsman.fromJson(Map<String, dynamic> json) => PartnershipCurrentBatsman(
    batsman: json["Batsman"],
    runs: json["Runs"],
    balls: json["Balls"],
  );

  Map<String, dynamic> toJson() => {
    "Batsman": batsman,
    "Runs": runs,
    "Balls": balls,
  };
}

class PowerPlay {
  String pp1;
  String pp2;

  PowerPlay({
    required this.pp1,
    required this.pp2,
  });

  factory PowerPlay.fromJson(Map<String, dynamic> json) => PowerPlay(
    pp1: json["PP1"],
    pp2: json["PP2"],
  );

  Map<String, dynamic> toJson() => {
    "PP1": pp1,
    "PP2": pp2,
  };
}

class Matchdetail {
  String teamHome;
  String teamAway;
  Match match;
  Series series;
  Venue venue;
  Officials officials;
  String weather;
  String tosswonby;
  String status;
  String statusId;
  String playerMatch;
  String result;
  String winningteam;
  String winmargin;
  String equation;

  Matchdetail({
    required this.teamHome,
    required this.teamAway,
    required this.match,
    required this.series,
    required this.venue,
    required this.officials,
    required this.weather,
    required this.tosswonby,
    required this.status,
    required this.statusId,
    required this.playerMatch,
    required this.result,
    required this.winningteam,
    required this.winmargin,
    required this.equation,
  });

  factory Matchdetail.fromJson(Map<String, dynamic> json) => Matchdetail(
    teamHome: json["Team_Home"],
    teamAway: json["Team_Away"],
    match: Match.fromJson(json["Match"]),
    series: Series.fromJson(json["Series"]),
    venue: Venue.fromJson(json["Venue"]),
    officials: Officials.fromJson(json["Officials"]),
    weather: json["Weather"],
    tosswonby: json["Tosswonby"],
    status: json["Status"],
    statusId: json["Status_Id"],
    playerMatch: json["Player_Match"],
    result: json["Result"],
    winningteam: json["Winningteam"],
    winmargin: json["Winmargin"],
    equation: json["Equation"],
  );

  Map<String, dynamic> toJson() => {
    "Team_Home": teamHome,
    "Team_Away": teamAway,
    "Match": match.toJson(),
    "Series": series.toJson(),
    "Venue": venue.toJson(),
    "Officials": officials.toJson(),
    "Weather": weather,
    "Tosswonby": tosswonby,
    "Status": status,
    "Status_Id": statusId,
    "Player_Match": playerMatch,
    "Result": result,
    "Winningteam": winningteam,
    "Winmargin": winmargin,
    "Equation": equation,
  };
}

class Match {
  String livecoverage;
  String id;
  String code;
  String league;
  String number;
  String type;
  String date;
  String time;
  String offset;
  String daynight;

  Match({
    required this.livecoverage,
    required this.id,
    required this.code,
    required this.league,
    required this.number,
    required this.type,
    required this.date,
    required this.time,
    required this.offset,
    required this.daynight,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    livecoverage: json["Livecoverage"],
    id: json["Id"],
    code: json["Code"],
    league: json["League"],
    number: json["Number"],
    type: json["Type"],
    date: json["Date"],
    time: json["Time"],
    offset: json["Offset"],
    daynight: json["Daynight"],
  );

  Map<String, dynamic> toJson() => {
    "Livecoverage": livecoverage,
    "Id": id,
    "Code": code,
    "League": league,
    "Number": number,
    "Type": type,
    "Date": date,
    "Time": time,
    "Offset": offset,
    "Daynight": daynight,
  };
}

class Officials {
  String umpires;
  String referee;

  Officials({
    required this.umpires,
    required this.referee,
  });

  factory Officials.fromJson(Map<String, dynamic> json) => Officials(
    umpires: json["Umpires"],
    referee: json["Referee"],
  );

  Map<String, dynamic> toJson() => {
    "Umpires": umpires,
    "Referee": referee,
  };
}

class Series {
  String id;
  String name;
  String status;
  String tour;
  String tourName;

  Series({
    required this.id,
    required this.name,
    required this.status,
    required this.tour,
    required this.tourName,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: json["Id"],
    name: json["Name"],
    status: json["Status"],
    tour: json["Tour"],
    tourName: json["Tour_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Status": status,
    "Tour": tour,
    "Tour_Name": tourName,
  };
}

class Venue {
  String id;
  String name;

  Venue({
    required this.id,
    required this.name,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["Id"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
  };
}

class Team {
  String nameFull;
  String nameShort;
  Map<String, Player> players;

  Team({
    required this.nameFull,
    required this.nameShort,
    required this.players,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    nameFull: json["Name_Full"],
    nameShort: json["Name_Short"],
    players: Map.from(json["Players"]).map((k, v) => MapEntry<String, Player>(k, Player.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "Name_Full": nameFull,
    "Name_Short": nameShort,
    "Players": Map.from(players).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Player {
  String position;
  String nameFull;
  Batting batting;
  Bowling bowling;
  bool? iscaptain;
  bool? iskeeper;

  Player({
    required this.position,
    required this.nameFull,
    required this.batting,
    required this.bowling,
    this.iscaptain,
    this.iskeeper,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    position: json["Position"],
    nameFull: json["Name_Full"],
    batting: Batting.fromJson(json["Batting"]),
    bowling: Bowling.fromJson(json["Bowling"]),
    iscaptain: json["Iscaptain"],
    iskeeper: json["Iskeeper"],
  );

  Map<String, dynamic> toJson() => {
    "Position": position,
    "Name_Full": nameFull,
    "Batting": batting.toJson(),
    "Bowling": bowling.toJson(),
    "Iscaptain": iscaptain,
    "Iskeeper": iskeeper,
  };
}

class Batting {
  Style style;
  String average;
  String strikerate;
  String runs;

  Batting({
    required this.style,
    required this.average,
    required this.strikerate,
    required this.runs,
  });

  factory Batting.fromJson(Map<String, dynamic> json) => Batting(
    style: styleValues.map[json["Style"]]!,
    average: json["Average"],
    strikerate: json["Strikerate"],
    runs: json["Runs"],
  );

  Map<String, dynamic> toJson() => {
    "Style": styleValues.reverse[style],
    "Average": average,
    "Strikerate": strikerate,
    "Runs": runs,
  };
}

enum Style {
  LHB,
  RHB
}

final styleValues = EnumValues({
  "LHB": Style.LHB,
  "RHB": Style.RHB
});

class Bowling {
  String style;
  String average;
  String economyrate;
  String wickets;

  Bowling({
    required this.style,
    required this.average,
    required this.economyrate,
    required this.wickets,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) => Bowling(
    style: json["Style"],
    average: json["Average"],
    economyrate: json["Economyrate"],
    wickets: json["Wickets"],
  );

  Map<String, dynamic> toJson() => {
    "Style": style,
    "Average": average,
    "Economyrate": economyrate,
    "Wickets": wickets,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
