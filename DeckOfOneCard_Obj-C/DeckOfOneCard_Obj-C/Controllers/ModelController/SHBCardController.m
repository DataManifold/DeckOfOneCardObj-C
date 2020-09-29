//
//  SHBCardController.m
//  DeckOfOneCard_Obj-C
//
//  Created by Shean Bjoralt on 9/29/20.
//

#import "SHBCardController.h"

@implementation SHBCardController
// https://deckofcardsapi.com/api/deck/new/draw/?count=1
static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck";
static NSString * const drawCardEndpoint = @"new/draw";
static NSString * const countQueryName = @"count";

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<SHBCard *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURL *drawCardURL = [baseURL URLByAppendingPathComponent:drawCardEndpoint];
    
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawCardURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *searchURL = urlComponents.URL;
    
    NSLog(@"%@", searchURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error fetching card: %@, %@", error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error. There appears to be no data: %@:", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        NSArray *cardsArray = jsonDictionary[@"cards"];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionaries in cardsArray)
        {
            SHBCard *card = [[SHBCard alloc] initWithDictionary:cardDictionaries];
            [cardsPlaceholder addObject:card];
        }
        completion(cardsPlaceholder, nil);
        
    }] resume];
}

+ (void)fetchCardImage:(SHBCard *)card completion:(void (^)(UIImage * _Nonnull))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.image];
    NSLog(@"%@", imageURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         if (error)
         {
             NSLog(@"There was no data found for the image.");
             completion(nil);
             return;
         }
        
        if (!data)
        {
            NSLog(@"There was no data found for the image.");
            completion(nil);
            return;
        }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }] resume];
}

@end


