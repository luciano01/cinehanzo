String convertMinutesToHoursMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;
  return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
}
