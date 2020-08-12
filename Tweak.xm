
// Dev. @CrazyMind90


#pragma GCC diagnostic ignored "-Wunused-variable"



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "libcolorpicker.h"



#define PLIST_PATH @"/var/mobile/Library/Preferences/com.crazymind90.switchstyle.plist"



id ObjectForKeys(NSString *Key) {

	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	NSString *Keys = [settings objectForKey:Key];

  return Keys;

}





%hook UISwitchModernVisualElement

%group EnableStyle
-(UIImage *) _effectiveThumbImage {


	 return NULL; //[UIImage imageNamed:@"/var/CC@2x.png"];

}
%end


%group Customizer
-(UIColor *) _effectiveOnTintColor {

    // Switch is ON

	 NSString *BackGroundPref = ObjectForKeys(@"ONBackGround");

	 UIColor *BackGroundColors = LCPParseColorString(BackGroundPref, @"#ff0000");

   return BackGroundColors;

}


-(UIColor *) _effectiveTintColor {

    // Switch is OFF

	 NSString *BackGroundPref =  ObjectForKeys(@"OFFBackGround");

	 UIColor *BackGroundColors = LCPParseColorString(BackGroundPref, @"#ff0000");


   return BackGroundColors;

}

%end
%end







%ctor {


	NSString *PlistPath = @"/var/mobile/Library/Preferences/com.crazymind90.switchstyle.plist";

	NSMutableDictionary *MutDoction = [[NSMutableDictionary alloc] initWithContentsOfFile:PlistPath];

	bool EnableStyle = [[MutDoction objectForKey:@"EnableStyle"] boolValue];
	bool Customizer = [[MutDoction objectForKey:@"Customizer"] boolValue];


	if (EnableStyle)
		%init(EnableStyle);

		if (Customizer)
			%init(Customizer);


}











//
