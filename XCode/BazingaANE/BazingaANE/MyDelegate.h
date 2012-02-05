//
//  Created by David Flatley on 1/28/12.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

#include "FlashRuntimeExtensions.h"
#import "GameCenterManager.h"

@class GameCenterManager;

@interface MyDelegate : UIViewController <UIApplicationDelegate, UIActionSheetDelegate, GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate> 
{
    GameCenterManager *gameCenterManager;
	
	int64_t currentScore;
	
	NSString* currentLeaderBoard;
    
    FREContext context;
}

@property (nonatomic, strong) GameCenterManager *gameCenterManager;
@property (nonatomic, strong) NSString* currentLeaderBoard;

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UIViewController *viewController;


- (void) showLeaderboard;
- (void) showAchievements;
- (void) loginUser;

-(void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController;
-(void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;

@end
