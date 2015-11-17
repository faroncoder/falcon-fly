// ==UserScript==
// @id             apps.facebook.com-122604f2-4e14-43a9-a2b8-54fe529df1b3@Faron_Falcon
// @name           Falcon_Faron
// @version        1.0
// @namespace      Faron_Falcon
// @author         Faron Ledger
// @description    Faron_Falcon_11
// @include        https://apps.facebook.com/nordsheroes/*
// @require	http://f6.faron.ca/.jsc/external/jq-2.1.4.js
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
// @run-at         document-end
// ==/UserScript==

var $;

// Add jQuery
(function () {
	GM_wait();
})();
// Check if jQuery's loaded
function GM_wait() {
	if (typeof unsafeWindow.jQuery == 'undefined') {
		window.setTimeout(GM_wait, 100);
	} else {
		$ = unsafeWindow.jQuery.noConflict(true);
		letsJQuery();
	}
}

function letsJQuery() {
	$('#rightCol').html('');
	$('#game').css('top', '-100px;');
	//alert($().jquery); // check jQuery version
}