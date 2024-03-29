class CurrentCityDataModel {
  String _cityName;
  var _lon;
  var _lat;
  String _main;
  String _description;
  var _temp;
  var _tempMin;
  var _tempMax;
  var _pressure;
  var _humidity;
  var _windSpeed;
  var _dataTime;
  String _country;
  var _sunRise;
  var _sunSet;

  CurrentCityDataModel(
      this._cityName,
      this._lon,
      this._lat,
      this._main,
      this._description,
      this._temp,
      this._tempMin,
      this._tempMax,
      this._pressure,
      this._humidity,
      this._windSpeed,
      this._dataTime,
      this._country,
      this._sunRise,
      this._sunSet);

      
  get sunSet => _sunSet;
  get sunRise => _sunRise;
  String get country => _country;
  get dataTime => _dataTime;
  get windSpeed => _windSpeed;
  get humidity => _humidity;
  get pressure => _pressure;
  get tempMax => _tempMax;
  get tempMin => _tempMin;
  get temp => _temp;
  String get description => _description;
  String get main => _main;
  get lat => _lat;
  get lon => _lon;
  String get cityName => _cityName;
}
