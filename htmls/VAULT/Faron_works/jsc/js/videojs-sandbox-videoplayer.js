/*! videojs-sandbox-videoplayer - v0.0.0 - 2014-11-2
 * Copyright (c) 2014 faroncoder
 * Licensed under the Apache-2.0 license. */
(function(window, videojs) {
  'use strict';

  var defaults = {
        option: true
      },
      sandboxVideoplayer;

  /**
   * Initialize the plugin.
   * @param options (optional) {object} configuration for the plugin
   */
  sandboxVideoplayer = function(options) {
    var settings = videojs.util.mergeOptions(defaults, options),
        player = this;

    // TODO: write some amazing plugin code
  };

  // register the plugin
  videojs.plugin('sandboxVideoplayer', sandboxVideoplayer);
})(window, window.videojs);
