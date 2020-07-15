#include "SwitchStyleController.h"
#include <spawn.h>


#define _plistfile @"/var/mobile/Library/Preferences/com.crazymind90.switchstyle.plist"


@interface UIApplication ()

- (void) launchApplicationWithIdentifier:(NSString*)identifier suspended:(BOOL)suspended;



@end

@implementation SwitchStyleController


-(void)loadView {
    [super loadView];
    
    
    // To Create up middle icon
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/SwitchStyle.bundle/icon.png"]];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/SwitchStyle.bundle/icona@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped)];
    

}

- (void)shareTapped {

    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/CrazyMind90"] options:@{} completionHandler:nil];
    
}


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


-(void) ApplyChanges {
    
    pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    
}

-(void) CrazyTwitter {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/CrazyMind90"] options:@{} completionHandler:nil];
    
}

@end
