//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)returnInAFrame:(NSArray *)wordsToBeFramed
          frameConstructor:(NSString *)frameConstructor;

-(NSString *)pigLatinResult:(NSString *)englishString;

-(NSArray *)zip:(NSArray *)arrayOne
               :(NSArray *)arrayTwo;

-(NSArray *)numberArrayFromNumber:(NSUInteger)numberToSeperate;

-(NSString *)stringByReversingString:(NSString *)stringToReverse;

@end
