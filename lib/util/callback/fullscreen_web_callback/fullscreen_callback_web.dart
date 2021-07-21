import 'dart:html';

fullscreenWebCallback(fullscreen) {
  if (fullscreen) {
    document.exitFullscreen();
  } else {
    document.documentElement?.requestFullscreen();
  }
}
