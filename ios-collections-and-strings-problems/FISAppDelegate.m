//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSUInteger asciiCode = 9829;
    NSString *frame = [NSString stringWithFormat:@"%c", asciiCode];
    [self returnInAFrame:@[@"learn", @"love", @"code"] frameConstructor:frame];
    [self pigLatinResult:@"elephant"];
    [self pigLatinResult:@"trust"];
    [self zip:@[@"a",@"b",@"c"] :@[@"hello"]];
    [self zip:@[@"a",@"b",@"c",@"d",@"e"] :@[@"hello",@"a",@"b",@"c",@"d",@"e"]];
    [self numberArrayFromNumber:12345];
    [self stringByReversingString:@"BoolShit"];
    
    return YES;
}
-(NSString *)returnInAFrame:(NSArray *)wordsToBeFramed frameConstructor:(NSString *)frameConstructor{
    NSUInteger longestWord = 0;
    NSArray *wordsWithLeftFrame;
    for (NSString *word in wordsToBeFramed) {
        if ([word length] >= longestWord) {
            longestWord = [word length];
        }
    }
    NSMutableArray *updatedWordsInFrame = [[NSMutableArray alloc] initWithArray:wordsToBeFramed];
    for (NSString *word in wordsToBeFramed) {
        NSString *endingOfWordAndFrame = @"";
        NSUInteger addToWord = longestWord - [word length]+1;
        for (NSUInteger i = 0; i <= addToWord; i++){
            endingOfWordAndFrame = [endingOfWordAndFrame stringByAppendingString:@" "];
        }
        NSUInteger wordOfIndex = [wordsToBeFramed indexOfObject:word];
        [updatedWordsInFrame replaceObjectAtIndex:wordOfIndex withObject:[NSString stringWithFormat:@"%@  %@%@%@", frameConstructor, word, endingOfWordAndFrame, frameConstructor]];
        NSLog(@"%@ is the word in the frame", updatedWordsInFrame);
    }
    
    NSUInteger frameLength = longestWord+5;
    NSMutableString *topAndBottomOfFrameString = [NSMutableString new];
    topAndBottomOfFrameString = [@"" mutableCopy];
    for (NSUInteger i = 0; i <= frameLength; i++) {
        [topAndBottomOfFrameString appendString:frameConstructor];
    }
    NSString *stringWithFrames = [updatedWordsInFrame componentsJoinedByString:@"\n"];
    NSString *polishTheFrameWithString = [NSString stringWithFormat:@"\n%@\n%@\n%@",topAndBottomOfFrameString,stringWithFrames,topAndBottomOfFrameString];
    NSLog(@"%@", polishTheFrameWithString);
    return polishTheFrameWithString;
    
}

-(NSString *)pigLatinResult:(NSString *)englishString{
    //if first letter is a vowel take two letters if second letter is a vowel take two letters as well.
    //need a vowel array
    //ay string variable and method that appends it to the first or first two letters
    //NSString *theCharacter = [NSString stringWithFormat:@"%c", [originalString characterAtIndex:index-1]];
    NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u"];
    NSString *pigLatin = englishString;
    NSString *firstLetterLastSound =@"";
    NSUInteger howManyLettersToMove = 1; //1
    NSString *theFirstCharacter = [NSString stringWithFormat:@"%c", [englishString characterAtIndex:0]];
    NSLog(@"%@ is what I meant to say", englishString);
    if ([vowels containsObject:theFirstCharacter]) {
        NSString *secondLetter = [NSString stringWithFormat:@"%c", [englishString characterAtIndex:1]];
        theFirstCharacter = [theFirstCharacter stringByAppendingString:secondLetter];
        howManyLettersToMove = 2;
    }
    firstLetterLastSound = [firstLetterLastSound stringByAppendingString:theFirstCharacter];
    NSString *pigLatinAppendage = [NSString stringWithFormat:@"%@ay", firstLetterLastSound];
    if (englishString.length >= 3) {
        pigLatin = [pigLatin substringFromIndex:howManyLettersToMove];
        pigLatin = [pigLatin stringByAppendingString:pigLatinAppendage];
        
    }
    NSLog(@"%@ was that even english?", pigLatin);
    return pigLatin;
}

-(NSArray *)zip:(NSArray *)arrayOne :(NSArray *)arrayTwo{
    NSUInteger minLengthOfArrays = 0;
    if (arrayOne.count <= arrayTwo.count) {
        minLengthOfArrays = arrayOne.count;
    } else {
        minLengthOfArrays = arrayTwo.count;
    }
    NSMutableArray *zippedArray = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < minLengthOfArrays; i++) {
        [zippedArray addObject:arrayOne[i]];
        [zippedArray addObject:arrayTwo[i]];
    }
    NSLog(@"%@ zipped", zippedArray); 
    return zippedArray;
}

-(NSArray *)numberArrayFromNumber:(NSUInteger)numberToSeperate{
    NSString *numberWithStringValue = [NSString stringWithFormat:@"%lu", numberToSeperate];
    NSMutableArray *numberCharacterArray = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < numberWithStringValue.length; i++) {
        [numberCharacterArray addObject:[NSString stringWithFormat:@"%c", [numberWithStringValue characterAtIndex:i]]];
        //might have to be as a number ?
    }
    NSLog(@"%@", numberCharacterArray);
    return numberCharacterArray;

}

-(NSString *)stringByReversingString:(NSString *)stringToReverse{
    NSMutableString *reversedWord = [NSMutableString new];
    for (NSInteger i = [stringToReverse length]-1; 0 <= i; i--) {
        [reversedWord appendString:[NSString stringWithFormat:@"%C",[stringToReverse characterAtIndex:i]]];
    }
    NSLog(@"%@ = %@", stringToReverse, reversedWord);

    return reversedWord;
}


@end
