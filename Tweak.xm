
// Dev. @CrazyMind90


#pragma GCC diagnostic ignored "-Wunused-variable"



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "libcolorpicker.h"



#define PLIST_PATH @"/var/mobile/Library/Preferences/com.crazymind90.switchstyle.plist"

inline bool GetPrefBool(NSString *key) {

		return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];

}



id ObjectForKeys(NSString *Key) {

	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	NSString *Keys = [settings objectForKey:Key];

  return Keys;

}





%hook UISwitchModernVisualElement
-(UIImage *) _effectiveThumbImage {

  if(GetPrefBool(@"EnableStyle")) {

	 return NULL; //[UIImage imageNamed:@"/var/CC@2x.png"];

}

 return %orig;

}


-(UIColor *) _effectiveOnTintColor {

  if (GetPrefBool(@"Customizer")) {
   // Switch is ON

	 NSString *BackGroundPref = ObjectForKeys(@"ONBackGround");

	 UIColor *BackGroundColors = LCPParseColorString(BackGroundPref, @"#ff0000");

   return BackGroundColors;

    }

   return %orig;
}

-(UIColor *) _effectiveTintColor {

  if (GetPrefBool(@"Customizer")) {
   // Switch is OFF

	 NSString *BackGroundPref =  ObjectForKeys(@"OFFBackGround");

	 UIColor *BackGroundColors = LCPParseColorString(BackGroundPref, @"#ff0000");

   return BackGroundColors;

    }

   return %orig;
}


%end
