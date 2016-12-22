//
//  PropertyType.m
//  ZZModel
//
//  Created by zhaozhe on 16/12/22.
//  Copyright © 2016年 zhaozhe. All rights reserved.
//

#import "PropertyType.h"


NSString *const PropertyTypeInt = @"i";
NSString *const PropertyTypeShort = @"s";
NSString *const PropertyTypeFloat = @"f";
NSString *const PropertyTypeDouble = @"d";
NSString *const PropertyTypeLong = @"l";
NSString *const PropertyTypeLongLong = @"q";
NSString *const PropertyTypeChar = @"c";
NSString *const PropertyTypeBOOL1 = @"c";
NSString *const PropertyTypeBOOL2 = @"b";
NSString *const PropertyTypePointer = @"*";
NSString *const PropertyTypeIvar = @"^{objc_ivar=}";
NSString *const PropertyTypeMethod = @"^{objc_method=}";
NSString *const PropertyTypeBlock = @"@?";
NSString *const PropertyTypeClass = @"#";
NSString *const PropertyTypeSEL = @":";
NSString *const PropertyTypeId = @"@";


@implementation PropertyType

+ (instancetype)propertyTypeWithAttributeString:(NSString *)string
{
    return [[PropertyType alloc] initWithTypeString:string];
}

- (instancetype)initWithTypeString:(NSString *)string
{
    if (self = [super init])
    {
        NSUInteger loc = 1;
        NSUInteger len = [string rangeOfString:@","].location - loc;
        NSString *type = [string substringWithRange:NSMakeRange(loc, len)];
        [self setCode:type];
    }
    return self;
}
- (void)getTypeCode:(NSString *)type
{
    if ([type isEqualToString:PropertyTypeId]) {
        _idType = YES;
    } else if (type.length > 3 && [type hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        _code = [type substringWithRange:NSMakeRange(2, type.length - 3)];
        _typeClass = NSClassFromString(_code);
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
    }
    
    // 是否为数字类型
    NSString *lowerCode = _code.lowercaseString;
    NSArray *numberTypes = @[PropertyTypeInt, PropertyTypeShort, PropertyTypeBOOL1, PropertyTypeBOOL2, PropertyTypeFloat, PropertyTypeDouble, PropertyTypeLong, PropertyTypeChar];
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
        
        if ([lowerCode isEqualToString:PropertyTypeBOOL1]
            || [lowerCode isEqualToString:PropertyTypeBOOL2]) {
            _boolType = YES;
        }
    }
}
@end
