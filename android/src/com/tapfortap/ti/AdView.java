/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ti;

import org.appcelerator.titanium.proxy.TiViewProxy;
import org.appcelerator.titanium.view.TiUIView;

import com.tapfortap.Banner;
import com.tapfortap.Banner.BannerListener;

public class AdView extends TiUIView implements BannerListener {
	public AdView(TiViewProxy proxy) {
		super(proxy);
		createAdView();
	}

	public void createAdView() {
		Banner banner = Banner.create(proxy.getActivity());
		banner.setListener(this);
		setNativeView(banner);
	}

	@Override
	public void bannerOnReceive(Banner banner) {
		proxy.fireEvent("receive", null);
	}
	
	@Override
	public void bannerOnFail(Banner banner, String reason, Throwable throwable) {
		proxy.fireEvent("error", reason);
	}

	@Override
	public void bannerOnTap(Banner banner) {
		proxy.fireEvent("tap", null);
	}
}