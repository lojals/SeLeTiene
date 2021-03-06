//
//  APIManager.h
//  Se Le Tiene
//
//  Created by Jorge Raul Ovalle Zuleta on 10/10/14.
//  Copyright (c) 2014 Olinguito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "User.h"
#import "Product.h"
#import "Connection.h"


@class APIManager;

@protocol APIManagerDelegate <NSObject>
@optional
- (void) percentageDownloaded:(double)dataDownloaded;
- (void) loadedImage:(UIImage*)imageLoaded;
- (void) loaded:(BOOL)checker :(NSString*)msg :(NSString*)tokenR;
- (void) returnResponse:(NSString *)msg :(id)response;
- (void) returnList:(id)responseObject :(NSString*)url;
- (void) returnObt:(id)responseObject;
- (void) returnBool:(BOOL)response;

@end

@interface APIManager : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData *apiData;
    NSMutableData *_responseData;
    NSString *URL;
    NSString *URLAPI;
    int datos;
    long long total;
    id objReturn;
    Connection* conn;
}

extern NSString* token;
-(void)signUpUserFB;
-(void)loginEmail:(NSString*)userEmail :(NSString*)userPass;
-(void)rememberPass:(NSString*)userEmail;
-(void)logout;
-(void)signUpUser:(User*)user;
-(void)updateUser:(User*)user;
-(void)registerProduct:(Product*)product :(int)type;


-(void)rateStars:(int)stars :(int)idProduct;

-(void)getProducts:(NSString*)filters;
-(void)getProductDetail:(int)idProduct;
-(void)getFavorites;
-(void)getDepartments;
-(void)getAllCities;
-(void)getCities:(int)idDepartment;
-(void)getSelfUser;
-(void)postImage:(int)idProduct :(UIImage*)imageProduct;

-(void)setFavorite:(int)productServiceId :(BOOL)activate;

@property (nonatomic, weak) id <APIManagerDelegate> delegate;

@end
