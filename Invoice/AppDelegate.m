//
//  AppDelegate.m
//  Invoice
//
//  Created by 杨帅 on 2018/3/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DengluViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(denglu) name:kNotificationDenglu object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tuichudenglu) name:kNotificationTuiChuDenglu object:nil];
    [self updatamodel];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav;
    Me = [[MeModel SharedModel] ADDvalue];

    if (Me.token.length >0) {
        [self yanzhengjym];
        nav = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];

    }else{
        Me.token = @"";
        nav = [[UINavigationController alloc] initWithRootViewController:[[DengluViewController alloc] init]];
    }
    nav.navigationBar.translucent = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
 
    return YES;
}

- (void)yanzhengjym{
    NSString * url = [NSString stringWithFormat:@"%@%@",ZSFWQ,JK_TOKENJY];
    NSDictionary * dic = @{@"token":Me.token};
    //
    [[BaseAppRequestManager manager] getNormaldataURL:url dic:dic andBlock:^(id responseObject, NSError *error) {
        if (responseObject) {
            HomeModel * model = [HomeModel mj_objectWithKeyValues:responseObject];
            if (![model.code isEqual:@200]) {
                NSNotification *notification =[NSNotification notificationWithName:kNotificationTuiChuDenglu object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
        }else{
            
        }
    }];
}


- (void)updatamodel{
    
    [ChongZhiTCModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"discount":@"ChongZhiModel",@"rechargerecord":@"ChongZhiJLXQModel"};
    }];
    [ZZPTModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"xmdata":@"xmdataa"};
    }];

    [SYMODEL mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data":@"SYJLModel"};
    }];
}
- (void)denglu{
    [self.window.rootViewController removeFromParentViewController];

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    nav.navigationBar.translucent = YES;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}
- (void)tuichudenglu{
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[[DengluViewController alloc] init]];
    nav1.navigationBar.translucent = YES;
    
    self.window.rootViewController = nav1;
    [self.window makeKeyAndVisible];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Invoice"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    MJExtensionLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        MJExtensionLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
//- (void)initShortcutItems {
//
//    if (@available(iOS 9.0, *)) {
//        if ([UIApplication sharedApplication].shortcutItems.count >= 4)
//            return;
//    } else {
//        // Fallback on earlier versions
//    }
//
//    if (@available(iOS 9.0, *)) {
//        NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
//
//
//        UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openSearch" localizedTitle:@"搜索" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
//        [arrShortcutItem addObject:shoreItem1];
//
//        UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openCompose" localizedTitle:@"新消息" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
//        [arrShortcutItem addObject:shoreItem2];
//
//        [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
//          [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
//    }
//
//    if (@available(iOS 9.0, *)) {
//        MJExtensionLog(@"%lu", [UIApplication sharedApplication].shortcutItems.count);
//    } else {
//        // Fallback on earlier versions
//    }
//}
//- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler  API_AVAILABLE(ios(9.0)){
//
//    //这里可以获的shortcutItem对象的唯一标识符
//    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
//    MJExtensionLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
//
//}
@end
