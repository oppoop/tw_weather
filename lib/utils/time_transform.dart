class TimeTransform {
  static String transMDY(String date) {
    if (date.length != 0) {
      return '${date.substring(5, 7)}月${date.substring(8, 10)}日 , ${date.substring(0, 4)}';
    } else {
      return '';
    }
  }

  static String transMD(String date) {
    if (date.length != 0) {
      return '${date.substring(5, 7)}月${date.substring(8, 10)}日';
    } else {
      return '';
    }
  }

  static String transHM(String date) {
    if (date.length != 0) {
      return '${date.substring(11, 13)} : ${date.substring(14, 16)}';
    } else {
      return '';
    }
  }
}
