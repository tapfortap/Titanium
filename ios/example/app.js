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
		Ti.API.info("Failed to receive banner because ", JSON.stringify(d, null, 2));
	});

	var showAppWallButton = Ti.UI.createButton({
    	title:"Show AppWall",
    	top:80 + 50,
    	height: 50,
    	width: 300
	});

	showAppWallButton.addEventListener("click",function(){
	    var appWall = tftModule.createAppWall();
		appWall.addEventListener("receive", function(d) {
			Ti.API.info("AppWall received");
		});

		appWall.addEventListener("show", function(d) {
			Ti.API.info("AppWall shown");
		});

		appWall.addEventListener("dismiss", function(d) {
			Ti.API.info("AppWall dismissed");
		});

		appWall.addEventListener("fail", function(d) {
			Ti.API.info("AppWall failed because: ",s JSON.stringify(d, null, 2));
		});
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
		var interstitial = tftModule.createInterstitial();
		interstitial.addEventListener("receive", function(d) {
			Ti.API.info("Interstitial received");
		});

		interstitial.addEventListener("show", function(d) {
			Ti.API.info("Interstitial shown");
		});

		interstitial.addEventListener("dismiss", function(d) {
			Ti.API.info("Interstitial dismissed");
		});

		interstitial.addEventListener("fail", function(d) {
			Ti.API.info("Interstitial dismissed failed because: ", JSON.stringify(d, null, 2));
		});
		interstitial.show();
	});
	window.add(showInterstitialButton);
}
