$(function(data, textStatus) {
    new MediaElement('faronplayer', {
        // shows debug errors on screen
        enablePluginDebug: false,
        // remove or reorder to change plugin priority
        plugins: ['flash', 'silverlight'],
        // specify to force MediaElement to use a particular video or audio type
        type: '',
        // path to Flash and Silverlight plugins
        pluginPath: './',
        // name of flash file
        flashName: 'flashmediaelement.swf',
        // name of silverlight file
        silverlightName: 'silverlightmediaelement.xap',
        // default if the <video width> is not specified
        defaultVideoWidth: 320,
        // default if the <video height> is not specified     
        defaultVideoHeight: 240,
        // overrides <video width>
        pluginWidth: -1,
        // overrides <video height>       
        pluginHeight: -1,
        // rate in milliseconds for Flash and Silverlight to fire the timeupdate event
        // larger number is less accurate, but less strain on plugin->JavaScript bridge
        timerRate: 250,
        // method that fires when the Flash or Silverlight object is ready
        success: function(mediaElement, domObject) {

            // add event listener
            mediaElement.addEventListener('timeupdate', function(e) {

                document.getElementById('current-time').innerHTML = mediaElement.currentTime;

            }, false);

            // call the play method
            mediaElement.play();

        },
        // fires when a problem is detected
        error: function() {

        }
    });

    $('audio,video').mediaelementplayer({
        // auto-select this language (instead of starting with "None")
        startLanguage: 'en',
        // automatically translate into these languages
        // translations: ['es', 'ar', 'zh', 'ru'],
        // enable the dropdown list of languages
        translationSelector: true
        // features: ['playpause', 'progress', 'volume', 'sourcechooser']
    });

    // END CUSTOM SCRIPTING //
}); // end function