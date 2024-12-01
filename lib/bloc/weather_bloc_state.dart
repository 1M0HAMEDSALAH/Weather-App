part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocState {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

final class WeatherBlocLoading extends WeatherBlocState {}

final class WeatherBlocLoaded extends WeatherBlocState {
  final Weather weather;
  WeatherBlocLoaded(this.weather);

   @override
  List<Object> get props => [weather];
}

final class WeatherBlocError extends WeatherBlocState {}
