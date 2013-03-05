/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ti;

import org.appcelerator.titanium.proxy.TiViewProxy;
import org.appcelerator.titanium.view.TiUIView;

import com.tapfortap.AdView.AdViewListener;

public class AdView extends TiUIView implements AdViewListener {
	public AdView(TiViewProxy proxy) {
		super(proxy);
		createAdView();
	}

	public void createAdView() {
		com.tapfortap.AdView adView = new com.tapfortap.AdView(proxy.getActivity());
		adView.setListener(this);
		setNativeView(adView);
	}
	
	@Override
	public void onTapAd() {
		proxy.fireEvent("tap", null);
	}

	@Override
	public void onReceiveAd() {
		proxy.fireEvent("receive", null);
	}

	@Override
	public void onFailToReceiveAd(String reason) {
		proxy.fireEvent("error", reason);
	}
}