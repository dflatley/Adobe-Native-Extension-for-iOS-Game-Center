//
//
//  Created by David Flatley on 1/28/12

#include "FlashRuntimeExtensions.h"
#import "MyDelegate.h"

MyDelegate *myDelegate = nil;

FREObject loginUser(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) 
{
    if (myDelegate) 
    {
        
    }
    else {
        myDelegate = [[MyDelegate alloc] init];
    }   
    
    [myDelegate loginUser];
    
    return NULL;
}


FREObject showAchievements(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) 
{
    [myDelegate showAchievements];
    return NULL;
}

FREObject showLeader(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) 
{
    [myDelegate showLeaderboard];
    
    return NULL;
}


// required methods, list your custom functions here
void ContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) 
{
    
	*numFunctionsToTest = 3;
    
	FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*3);
	func[0].name = (const uint8_t*)"showAchievements";
	func[0].functionData = NULL;
	func[0].function = &showAchievements;
    
    func[1].name = (const uint8_t*)"showLeader";
	func[1].functionData = NULL;
	func[1].function = &showLeader;
    
    func[2].name = (const uint8_t*)"loginUser";
	func[2].functionData = NULL;
	func[2].function = &loginUser;
    
	*functionsToSet = func;
    
}

void ContextFinalizer(FREContext ctx) 
{
    [myDelegate release];
    myDelegate = nil;
   	return;
}

void ExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
	*extDataToSet = NULL;
	*ctxInitializerToSet = &ContextInitializer;
	*ctxFinalizerToSet = &ContextFinalizer;
}

void ExtFinalizer(void* extData) {
	return;
}

