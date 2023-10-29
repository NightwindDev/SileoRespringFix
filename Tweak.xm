/*
 * Copyright (c) 2023 Nightwind. All rights reserved.
 *
 * References:
 *  [1] - https://github.com/Sileo/Sileo/blob/18e0ac2c90e8658ed9b787dca25a4c7c34edf93a/Sileo/Sileo/en-UD.lproj/Localizable.strings#L213
 *  [2] - https://github.com/Sileo/Sileo/blob/18e0ac2c90e8658ed9b787dca25a4c7c34edf93a/Sileo/UI/DownloadsViewController/DownloadsTableViewController.swift#L422
 */

#import "Headers.h"

%hook DownloadsTableViewController

- (void)completeButtonTapped:(DownloadConfirmButton *)sender {
	// Reference: [1]
	NSString *localizedText = [NSBundle.mainBundle localizedStringForKey:@"After_Install_Respring" value:nil table:nil];

	if (![sender.currentTitle isEqualToString:localizedText]) {
		%orig;
		return;
	}

	// Reference: [2]
	UIWindow *window = UIApplication.sharedApplication.windows.firstObject;

	[self setNeedsStatusBarAppearanceUpdate];

	[UIView animateWithDuration:0.2 animations:^{
		window.alpha = 0;
		window.transform = CGAffineTransformMakeScale(0.9, 0.9);
	} completion:^(BOOL finished) {
		if (finished) {
			respring();
		}
	}];
}

%end

%ctor {
	%init(
		DownloadsTableViewController = NSClassFromString(@"Sileo.DownloadsTableViewController"),
		DownloadConfirmButton = NSClassFromString(@"Sileo.DownloadConfirmButton")
	);
}