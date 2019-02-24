// TODO: add networking functionality
/*
class ContestantData {

}
*/

//TODO: setters and getters (after networking)
class TournamentEvent {
  DateTime startTime;
  // args list depends on type
  // provides information to UI
  List<String> _judges, _debaters, _args;
  String location, type;

  TournamentEvent(
      this.startTime,
      this._judges,
      this._debaters,
      this._args,
      this.location,
      this.type);

  get judges {
    String judges = '';
    if (_judges != null) {
      for (final judge in _judges) {
        judges += judge + ', ';
      }
    }
    return judges.substring(0, judges.length - 2);
  }

  get debaters {
    String debaters = '';
    if (_debaters != null) {
      for (final judge in _debaters) {
        debaters += judge + ', ';
      }
    }
    return debaters.substring(0, debaters.length - 2);
  }
}