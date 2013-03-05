// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var tftModule = require('com.tapfortap.ti');
Ti.API.info("module is => " + tftModule);

var tft = tftModule.createTapForTap();
tft.setEnvironment = "development";
tft.initializeWithApiKey("ACB9E550DDA1679B29401D26EDB4F23B")

if (Ti.Platform.name == "android") {
	var adView = tftModule.createAdView({
		width: 320,
		height: 50,
		top: 75,
		left: 75
	});
	
	adView.on("tap", function(d) {
			Ti.API.info("Banner was tapped");
	});

	adView.on("receive", function(d) {
			Ti.API.info("Banner was received");
	});

	adView.on("error", function(d) {
			Ti.API.info("Failed to receive banenr because ", JSON.stringify(d, null, 2));
	});

	win.add(adView);

	var interstitial = tftModule.createInterstitial();
	interstitial.on("dismiss", function(d) {
		Ti.API.info("Interstitial dismissed");
	});
	interstitial.show();

	var appWall = tftModule.createAppWall();
	appWall.on("dismiss", function(d) {
		Ti.API.info("AppWall dismissed");
	});

	appWall.show();
}
