import 'package:flutter/material.dart';
import 'info_helper.dart';

const bg_color = Color(0xff709aa8);
const accent_color = Color(0xff709aa8);

// main method that displays DebateMonkey as home
void main() => runApp(DebateMonkey());

// main page class that uses MaterialApp as a widget
class DebateMonkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DebateMonkey',
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: DebateMonkeyHome(),
    );
  }
}

// main home widget
// provides a Scaffold layout
class DebateMonkeyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        //title: Text('DebateMonkey'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        children: <Widget>[
          Container(
            child: Center(child: CurrentRound(),
            ),
          ),
          Expanded(
            child: Container(
              child: CurrentTournamentEvents(),
            ),
          ),
        ],
      )
    );
  }
}

class CurrentTournamentEventsState extends State<CurrentTournamentEvents> {
  // TODO: remove sample data
  // call fetch ??
  final List<TournamentEvent> _events = <TournamentEvent>[
    TournamentEvent(DateTime.now(), ['Tyler', 'Danish'], ['Sam', 'Yehna'], null, '2902 Shadow Creek Drive', 'pf'),
    TournamentEvent(DateTime.now(), ['Vasa', 'Eric'], ['Ella', 'Sara'], null, 'SEEC', 'ld')];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.separated(
      itemCount: _events.length,
      itemBuilder: (BuildContext _context, int i) => _buildRow(_events[i]),
      separatorBuilder: (BuildContext _context, int i) => Divider(),
    );
  }

  Widget _buildRow(TournamentEvent event) {
    return new ListTile(
      title: Text(event.type.toUpperCase() + " debate on " + event.startTime.toString() + ""),
      subtitle: Text("Judges: " + event.judges),
    );
  }
}

class CurrentRoundState extends State<CurrentRound> {

  final TournamentEvent _event = TournamentEvent(DateTime.now(), ['dunk', 'dl'], ['george', 'jeff'], null, 'the white house', 'pf');
  //final TournamentEvent _event = null;
  @override
  Widget build(BuildContext context) {
    return _roundInfo();
  }

  Widget _roundInfo() {
    if (_event == null) {
      return new Container();
    }

    else {
      return new Container(
        height: 40.0,
        child: new Text("Your " + _event.type.toUpperCase() + " debate at " + _event.location + " is ready!" + _event.judges),
      );
    }
  }
}

// overrides StatefulWidget createState method to route to
// custom CurrentTournamentEventsState widget
class CurrentTournamentEvents extends StatefulWidget {
  @override
  CurrentTournamentEventsState createState() => new CurrentTournamentEventsState();
}

class CurrentRound extends StatefulWidget {
  @override
  CurrentRoundState createState() => new CurrentRoundState();
}