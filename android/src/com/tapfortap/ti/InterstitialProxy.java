/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ti;

import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;

import com.tapfortap.Interstitial;
import com.tapfortap.Interstitial.InterstitialListener;

@Kroll.proxy(creatableInModule = TapForTapTitaniumModule.class)
public class InterstitialProxy extends KrollProxy implements InterstitialListener {
	private Interstitial interstitial;
	
	private Interstitial getInterstitial() {
		if (interstitial == null) {
			interstitial = Interstitial.create(getActivity(), this);
		}
		return interstitial;
	}
	
	
	@Kroll.method
	public void prepare() {
		getInterstitial().load();
	}

	@Kroll.method
	public void show() {
		getInterstitial().showAndLoad();
	}

	public void onReceiveAd() {
		fireEvent("receive", null);
	}

	@Override
	public void interstitialOnReceive(Interstitial interstitial) {
		fireEvent("receive", null);
	}
	
	@Override
	public void interstitialOnFail(Interstitial interstitial, String reason, Throwable throwable) {
		fireEvent("fail", reason);
	}

	@Override
	public void interstitialOnShow(Interstitial interstitial) {
		fireEvent("show", null);
	}

	@Override
	public void interstitialOnTap(Interstitial interstitial) {
		fireEvent("tap", null);
	}
	
	@Override
	public void interstitialOnDismiss(Interstitial interstitial) {
		fireEvent("dismiss", null);
	}
}
