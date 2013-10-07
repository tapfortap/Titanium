/*
 * Licensed under the MIT license
 * http://htmlpreview.github.com/?https://github.com/tapfortap/Documentation/blob/master/License.html
 * Copyright (c) 2013 Tap for Tap
 */

package com.tapfortap.ti;

import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;

import com.tapfortap.AppWall;
import com.tapfortap.AppWall.AppWallListener;

@Kroll.proxy(creatableInModule = TapForTapTitaniumModule.class)
public class AppWallProxy extends KrollProxy implements AppWallListener {
	private AppWall appWall;
	
	private AppWall getAppWall() {
		if (appWall == null) {
			appWall = AppWall.create(getActivity(), this);
		}
		return appWall;
	}
	
	@Kroll.method
	public void prepare() {
		getAppWall().load();
	}

	@Kroll.method
	public void show() {
		getAppWall().showAndLoad();
	}

	@Override
	public void appWallOnReceive(AppWall appWall) {
		fireEvent("receive", null);
	}
	
	@Override
	public void appWallOnFail(AppWall appWall, String reason, Throwable throwable) {
		fireEvent("fail", reason);
	}

	@Override
	public void appWallOnShow(AppWall appWall) {
		fireEvent("show", null);
	}

	@Override
	public void appWallOnTap(AppWall appWall) {
		fireEvent("tap", null);
	}
	
	@Override
	public void appWallOnDismiss(AppWall appWall) {
		fireEvent("dismiss", null);
	}
}
