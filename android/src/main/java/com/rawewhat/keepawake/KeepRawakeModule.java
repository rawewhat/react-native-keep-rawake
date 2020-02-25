package com.rawewhat.keepawake;

import android.app.Activity;
import android.view.WindowManager;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class KeepRawakeModule extends ReactContextBaseJavaModule {

	public KeepRawakeModule(ReactApplicationContext reactContext) {
		super(reactContext);
	}

	@Override
	public String getName() {
		return "KeepRawake";
	}

	@ReactMethod
	public void activate(final Promise promise) {
		try {
			final Activity activity = getCurrentActivity();

			if (activity != null) {
				activity.runOnUiThread(new Runnable() {
					@Override
					public void run() {
						activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
						promise.resolve(true);
					}
				});

			}
		} catch (Exception e) {
			promise.reject(e.getMessage());
		}
	}

	@ReactMethod
	public void deactivate(final Promise promise) {
		try {
			final Activity activity = getCurrentActivity();

			if (activity != null) {

				activity.runOnUiThread(new Runnable() {
					@Override
					public void run() {
						activity.getWindow().clearFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
						promise.resolve(false);
					}
				});
			}
		} catch (Exception e) {
			promise.reject(e.getMessage());
		}
	}
}
