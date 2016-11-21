#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
 newscript="// ==UserScript==
// @name         {NAME}
// @namespace    https://openuserjs.org/install/faroncoder/NEWNAME.user.js
// @version      0.1
// @description  DESCRIPTION
// @author       Faroncoder
// @match        https://www.example.com/*
// @updateURL    https://openuserjs.org/meta/faroncoder/{NAME}.meta.js
// @require      http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js
// @run-at      document-end
// @grant       GM_getValue
// @grant       unsafeWindow
// @grant       GM_deleteValue
// @grant       GM_getValue
// @grant       GM_setValue
// @grant       GM_listValues
// @grant       GM_addStyle
// @grant       GM_xmlhttpRequest
// @grant       GM_log
// @grant       GM_registerMenuCommand
// ==/UserScript==


(function() {
    'use strict';

    // Add jQuery, unless it already exists
    if(typeof jQuery === 'undefined'|| !jQuery){
        (function(){
            var s=document.createElement('script');
            s.setAttribute('src','http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js');
            if(typeof jQuery=='undefined'){
                document.getElementsByTagName('head')[0].appendChild(s);
            }
        })();
    }

    var intervalInt = window.setInterval(function(){
            if(typeof jQuery !== 'undefined' && jQuery){
                // Clear this interval
                window.clearInterval(intervalInt);
	///////////// BEGIN


           ///////////// END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.greasemonkey.sh  [ACTIVE] y

