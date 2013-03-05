/*
 * Single Window Application Template:
 * A basic starting point for your application.  Mostly a blank canvas.
 * 
 * In app.js, we generally take care of a few things:
 * - Bootstrap the application with any data we need
 * - Check for dependencies like device type, platform version or network connection
 * - Require and open our top-level UI component
 *  
 */

//bootstrap and check dependencies
if (Ti.version < 1.8 ) {
	alert('Sorry - this application template requires Titanium Mobile SDK 1.8 or later');	  	
}
// This is a single context application with multiple windows in a stack
(function() {
	//render appropriate components based on the platform and form factor
	var osname = Ti.Platform.osname,
		version = Ti.Platform.version,
		height = Ti.Platform.displayCaps.platformHeight,
		width = Ti.Platform.displayCaps.platformWidth;
	
	//considering tablet to have one dimension over 900px - this is imperfect, so you should feel free to decide
	//yourself what you consider a tablet form factor for android
	var isTablet = osname === 'ipad' || (osname === 'android' && (width > 899 || height > 899));
	var Window;
	if (isTablet) {
		Window = require('ui/tablet/ApplicationWindow');
	}
	else {
		// Android uses platform-specific properties to create windows.
		// All other platforms follow a similar UI pattern.
		if (osname === 'android') {
			Window = require('ui/handheld/android/ApplicationWindow');
		}
		else {
			Window = require('ui/handheld/ApplicationWindow');
		}
	}
	var window = new Window();
	window.open();
	
	// Get the titanium module
	var tftModule = require('com.tapfortap.ti');
    Ti.API.info("module is => " + tftModule);

    // Create the Tap for Tap prozy class
	var tft = tftModule.createTapForTap();
	// Initialize with Tap for Tap
	tft.initializeWithApiKey("acb9e550dda1679b29401d26edb4f23b")
 
    // Create a Tap for Tap AdView
	var adView = tftModule.createAdView({
		width: 320,
		height: 50,
		top: 0,
		left: 0
	});
	
	// Subscribe to the Tap for Tap AdView events
	adView.addEventListener("tap", function(d) {
		Ti.API.info("Banner was tapped");
	});
	
	adView.addEventListener("receive", function(d) {
		Ti.API.info("Banner was received");
	});
	
	adView.addEventListener("error", function(d) {
		Ti.API.info("Failed to receive banner because ", JSON.stringify(d, null, 2));
	});
	
	window.add(adView);
	
	var showAppWallButton = Ti.UI.createButton({
    	title:"Show AppWall",
    	top:80 + 50,
    	height: 50,
    	width: 300
	});

	showAppWallButton.addEventListener("click",function(){
		// Create an app wall
	    var appWall = tftModule.createAppWall();
	    // Subscribe to the app wall dismiss event
		appWall.addEventListener("dismiss", function(d) {
			Ti.API.info("AppWall dismissed");
		});
		// Show the app wall
		appWall.show();
	});
	window.add(showAppWallButton);
	
	var showInterstitialButton = Ti.UI.createButton({
    	title:"Show Interstitial",
    	top:80 + 50 + 50 + 10,
    	height: 50,
    	width: 300
	});

	showInterstitialButton.addEventListener("click",function(){
		// Create an interstitial
		var interstitial = tftModule.createInterstitial();
		// Subscribe to the interstital dismiss event
		interstitial.addEventListener("dismiss", function(d) {
			Ti.API.info("Interstitial dismissed");
		});
		// Show the app wall
		interstitial.show();
	});
	window.add(showInterstitialButton);

})();




