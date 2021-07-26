import 'dart:html';

import 'common_func.dart';

fullscreenWebCallback(fullscreen) {
  if (fullscreen) {
    document.exitFullscreen();
  } else {
    document.documentElement?.requestFullscreen();
  }
}

BrowserType getBrowserType() {
  var userAgent = window.navigator.userAgent;
  if (userAgent.indexOf('msie') != -1 || userAgent.indexOf('trident') != -1) {
    return BrowserType.ie;
  } else if (userAgent.indexOf('edge') != -1) {
    return BrowserType.edge;
  } else if (userAgent.indexOf('chrome') != -1) {
    return BrowserType.chrome;
  } else if (userAgent.indexOf('safari') != -1) {
    return BrowserType.safari;
  } else if (userAgent.indexOf('firefox') != -1) {
    return BrowserType.firefox;
  } else if (userAgent.indexOf('opera') != -1) {
    return BrowserType.opera;
  } else {
    return BrowserType.others;
  }
}
