@import UIKit;
#import <spawn.h>
#import <rootless.h>

@interface DownloadsTableViewController : UIViewController
@end

@interface DownloadConfirmButton : UIButton
@end

void respring() {
	extern char **environ;
	pid_t pid;

	const char *args_sb[] = {"killall", "SpringBoard", NULL};
	posix_spawn(&pid, ROOT_PATH("/usr/bin/killall"), NULL, NULL, (char *const *)args_sb, environ);

	const char *args_sileo[] = {"killall", "Sileo", NULL};
	posix_spawn(&pid, ROOT_PATH("/usr/bin/killall"), NULL, NULL, (char *const *)args_sileo, environ);
}