//
//  SHBCard.m
//  DeckOfOneCard_Obj-C
//
//  Created by Shean Bjoralt on 9/29/20.
//

#import "SHBCard.h"

@implementation SHBCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation SHBCard (JSONConvertable)

- (SHBCard *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *suit = topLevelDictionary[@"suit"];
    NSString *image = topLevelDictionary[@"image"];
    
    return [self initWithSuit:suit image:image];
}

@end
