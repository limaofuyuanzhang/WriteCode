//
//  ViewController.m
//  WriteCode
//
//  Created by 林涛 on 2019/11/20.
//  Copyright © 2019 林涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/**
 第1章 熟悉Objective-C
 */

/*
 第1条：了解Objective-C语言的起源
 */
- (void)EOC1 {

    //Messaging (Objective-C)
    Object *obj = [Object new];
    [obj performWith:parameter1 and:parameter2];
    
    //Function calling (C++)
    Object *obj = new Object;
    obj->perform(parameter1, parameter2);
    
    NSString *someString = @"The string";
    NSString stackString; //error:interface type cannot be statically allocated，接口类型不能静态分配
    
    NSString *someString = @"The string";
    NSString *anotherString = someString;
    
    CGRect frame;
    frame.origin.x = 0.0f;
    frame.origin.y = 10.0f;
    frame.size.x = 100.0f;
    frame.size.height = 150.0f;
    
    struct CGRect {
        CGPoint origin;
        CGSize size;
    }
}

/*
 第2条:在类的头文件中尽量少引入其他头文件
 */
//EOCPerson.h
#import <Foundation/Foundation.h>
@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *fristName;
@property (nonatomic, copy) NSString *lastName;
@end

//EOCPerson.m
#import "EOCPerson.h"
@implementation EOCPerson
@end

//EOCPerson.h
#import <Foundation/Foundation.h>
#import "EOCEmployer.h"
@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *fristName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) EOCEmployer *employer;
@end


//EOCPerson.h
#import <Foundation/Foundation.h>
@class EOCEmployer;
@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *fristName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) EOCEmployer *employer;
@end

//EOCPerson.m
#import "EOCPerson.h"
#import "EOCEmployer.h"
@implementation EOCPerson
@end

//EOCEmployer.h
@interface EOCEmployer : NSObject
@class EOCPerson;
- (void)addEmployee:(EOCPerson *)person;
- (void)removeEmployee:(EOCPerson *)person;
@end

//EOCRectangle.h
#import "EOCShape.h"
#import "EOCDrawable.h"

@interface EOCRectangle : EOCShape<EOCDrawable>
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@end

/*
 第3条：多用字面量语法，少用与之等价的方法
 */
- (void)EOC3 {
    NSString *someString = @"Effective Objective-C 2.0";
    
    NSNumber *someNumber = [NSNumber numberWithInt:1];
    NSNumber *someNumber = @1;
    
    NSNumber *intNumber = @1;
    NSNumber *floatNumber = @2.5f;
    NSNumber *doubleNumber = @3.14159;
    NSNumber *boolNumber = @YES;
    NSNumber *charNumber = @'a';
    
    int x = 5;
    float y = 6.32f;
    NSNumber *expressionNumber = @(x * y);
    
    NSArray *animals = [NSArray arrayWithObjects:@"cat",@"dog",@"mouse",@"badger",nil];
    NSArray *animals = @[@"cat",@"dog",@"mouse",@"badger"];
    
    NSString *dog = [animals objectAtIndex:1];
    NSString *dog = animals[1];
    
    id object1 = /*...*/;
    id object2 = /*...*/;
    id object3 = /*...*/;
    NSArray *arrayA = [NSArray array WithObjects:object1,object2,object3,nil];
    NSArray *arrayB = @[object1,object2,object3];
    
    NSDictionary *personData = [NSDictionary dictionaryWithObjectsAndKeys:@"Matt",@"firstName",@"Galloway",@"lastName",[NSNumber numberWithInt:28],@"age",nil];
    NSDictionary *personData = @{@"firstName":@"Matt",
                                 @"lastName":@"Galloway",
                                 @"age":@28};
    
    NSString *lastName = [personData objectForKey:@"lastName"];
    NSString *lastName = personData[@"lastName"];
    
    NSMutableArray *mutableArray = [NSMutableArray new];
    [mutableArray replaceObjectAtIndex:1 withObject:@"dog"];
    
    NSMutableDictionary *mutableDictionary = [NSMutableDictionary new];
    [mutableDictionary setObject:@"Galloway" forKey:@"lastName"];
    
    mutableArray[1] = @"dog";
    mutableDictionary[@"lastName"] = @"Galloway";

    NSMutableArray *mutable = [@[@1,@2,@3,@4,@5] mutableCopy];
}

/*
 第4条：多用类型常量，少用#define预处理指令
 */
- (void)EOC4 {
    #define ANIMATION_DURATION 0.3
    static const NSTimeInterval kAnimationDuration = 0.3;
}

//EOCAnimatedView.h
#import <UIKit/UIKit.h>

@interface EOCAnimatedView : UIView
- (void)animate;
@end

//EOCAnimatedView.m
#import "EOCAnimatedView.h"
static const NSTimeInterval kAnimationDuration = 0.3;
@implementation EOCAnimatedView
- (void)animate {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        
    }];
}
@end

//In the header file
extern NSString *const EOCStringConstant;

//In the implementation file
NSString *const EOCStringConstant = @"VALUE";

//EOCLoginManager.h
#import <Foundation/Foundation.h>

extern NSString *const EOCLoginManagerDidLoginNotification;

@interface EOCLoginManager : NSObject
- (void)login;
@end;

// EOCLoginManager.m
#import "EOCLoginManager.h"

NSString *const EOCLoginManagerDidLoginNotification = @"EOCLoginManagerDidLoginNotification";

@implementation EOCLOginManager

- (void)login {
    
}

- (void)p_didLogin {
    [[NSNotificationCenter defaultCenter] postNotificationName:EOCLoginManagerDidLoginNotification object:nil];
}
@end

//EOCAnimatedView.h
extern const NSTimeInterval EOCAnimatedViewAnimationDuration;

//EOCAnimatedView.h
const NSTimeInterval EOCAnimatedViewAnimationDuration = 0.3;

/*
 第5条:用枚举表示状态、选项、状态码
 */
enum EOCConnectionState {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};

enum EOCConnectionState state = EOCConnectionStateDisconnected;

enum EOCConnectionState {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};
typedef enum EOCConnectionState EOCConnectionState;

EOCConnectionState state = EOCConnectionStateDisconnected;

enum EOCCOnnectionStateConnectionState : NSInteger {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};

enum EOCCOnnectionState : NSInteger;
enum EOCCOnnectionStateConnectionState {
    EOCConnectionStateDisconnected = 1,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
}

enum UIViewAutoresizing {
    UIViewAutoresizingNone = 0,
    UIViewAutoresizingFlexibleLeftMargin = 1 << 0,
    UIViewAutoresizingFlexibleWidth = 2 << 1,
    UIViewAutoresizingFlexibleRightMargin = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin = 1 << 3,
    UIViewAutoresizingFlexibleHeight = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5,
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait |
    UIInterfaceOrientationMaskLandscapeLeft;
}

typedef NS_ENUM(NSUInteger, EOCConnectionState) {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};

typedef NS_OPTIONS(NSUInteger, EOCPermittedDirectoin) {
    EOCPermittedDirectoinup = 1 << 0,
    EOCPermittedDirectoinDown = 1 << 1,
    EOCPermittedDirectoinLeft = 1 << 2,
    EOCPermittedDirectoinRight = 1 << 3,
};

typedef enum EOCCOnnectionState NSUinteger EOCConnectionState;
enum EOCCOnnectionState : NSUInteger {
    EOCConnectionStateDisconnected,
    EOCConnectionStateConnecting,
    EOCConnectionStateConnected,
};

typedef enum EOCPermittedDirectoin : int EOCPermittedDirection;
enum EOCPermittedDirectoin : int {
    EOCPermittedDirectoinup = 1 << 0,
    EOCPermittedDirectoinDown = 1 << 1,
    EOCPermittedDirectoinLeft = 1 << 2,
    EOCPermittedDirectoinRight = 1 << 3,
};
    

- (void)EOC5 {
    enum UIViewAutoresizing resizing = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (resizing & UIViewAutoresizingFlexibleWidth ) {
            
    }
    
    EOCConnectionState _currentState
    switch (_currentState) {
        EOCConnectionStateDisconnected:
            break;
            
        EOCConnectionStateConnecting:
            break;
            
        EOCConnectionStateConnected:
            break;
    }
}
    
/**
 第2章 对象、消息、运行期
*/
    
/*
 第6条：理解“属性”这一概念
 */
@interface EOCPerson : NSObject {
@public
    NSDate *_dateOfBirth;
    NSString *_firstName;
    NSString *_lastName;
@private
    NSString *_someInternalData;
}
@end
    
@interface EOCPerson : NSObject
@property NSString *firstName;
@property (nonatomic, readwrite, copy) NSString *firstName;
@property NSString *lastName;
@property (nonatomic, getter=isOn) BOOL on;
@end
    
@implementation EOCPerson
@synthesize firstName = _myFirstNae;
@synthesize lastName = _myLastName;
@end

@interface EOCPerson : NSObject
- (NSString *)firstName;
- (void)setFirstName:(NSString *)firstName;
- (NSString *)lastName;
- (void)setLastName:(NSString *)lastName;
@end
    
- (void)EOC6 {
    EOCPerson *aPerson = [Person new];
    aPerson.firstName = @"Bob";
    [aPerson setFirstName:@"Bob"];
    
    NSString  *lastName = aPerson.lastName;
    NSString *lastName = [aPerson lastName];
}
    
@interface EOCPerson :NSManagedObject
@property (copy, readonly) NSString *firstName;
@property (copy, readonly) NSString *lastName;

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName;
@end
    
@implementation EOCPerson
@dynamic firstName, lastName;

- (id)initWithFirstName:(NSString *)firstName
               lastName:(NSString *)lastName {
    if (self = [super init]) {
        _myFirstNae = [firstName copy];
        _lastName = [lastName copy];
    }
    return self;
}
@end
    
    
/*
 第7条：在对象内部尽量直接访问实例变量
 */
@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
- (NSString *)fullName;
- (void)setFullName:(NSString *)fullName;
@end
    
@implementation EOCPerson
- (NSString*)fullName {
//    return [NSString stringWithFormat:@"%@ %@",self.firstName, self.lastName];
    return [NSString stringWithFormat:@"%@ %@",_firstName, _lastName];
}

- (void)setFullName:(NSString *)fullName {
    NSArray *components = [fullName componentsSeparatedByString:@" "];
//    self.firstName = [components objectAtIndex:0];
//    self.lastName = [components objectAtIndex:1];
    _firstName = [components objectAtIndex:0];
    _lastName = [components objectAtIndex:1];
}

- (void)setLastName:(NSString *)lastName {
    if (![lastName isEqualToString:@"Smith"]) {
        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
    }
    self.lastName = lastName;
}

- (EOCBrain *)brain {
    if (!_brain) {
        _brain = [Brain new];
    }
    return _brain;
}
@end
    
/*
 第8条:理解“对象等同性”这一概念
 */
- (void)EOC8 {
    NSString *foo = @"Badger 123";
    NSString *bar = [NSString stringWithFormat:@"Badger %i",123];
    BOOL equalA = (foo == Bar); //NO
    BOOL equalB = [foo isEqual:bar]; //YES
    BOOL equalC = [foo isEqualToString:bar]; //YES
    
    NSMutableArray *arrayB = [@[@1,@2] mutableCopy];
    [set addObject:arrayB];
    NSLog(@"set = %@",set);
    NSMutableArray *arrayC = [@[@1] mutableCopy];
    [set addObject:arrayC];
    NSLog(@"set = %@",set);
    [arrayC addObject:@2];
    NSLog(@"set = %@",set);
    NSSet *setB = [set copy];
    NSLog(@"setB = %@",setB);
}
    
    - (BOOL)isEqual:(id)object;
    - (NSUInteger)hash;
 
@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@end
    
@implementation EOCPerson

- (BOOL)isEqualToPerson:(EOCPerson *)otherPerson {
    if (self == otherPerson) return YES;
    if (![_firstName isEqualToString:otherPerson.firstName]) {
        return NO;
    }
    if (![_lastName isEqualToString:otherPerson.lastName]) {
        return NO;
    }
    if (_age != otherPerson.age) {
        return NO;
    }
    return YES;
}

- (BOOL)isEqual:(id)object {
//    if (self == object) {
//        return YES;
//    }
//
//    if ([self class] != [object class]) {
//        return NO;
//    }
//
//    EOCPerson *otherPerson = (EOCPerson*)object;
//    if (![_firstName isEqualToString:otherPerson.firstName]) {
//        return NO;
//    }
//    if (![_lastName isEqualToString:otherPerson.lastName]) {
//        return NO;
//    }
//    if (_age != otherPerson.age) {
//        return NO;
//    }
//    return YES;
    
    if ([self class] == [object class]) {
        return [self isEqualToPerson:(EOCPerson *)object];
    } else {
        return [super isEqual:object];
    }
}

- (NSUInteger)hash {
//    return 1337;
//    NSString *stringToHash = [NSString stringWithFormat:@"%@:%@:%i",_firstName,_lastName,_age];
//    return [stringToHash hash];
    NSUInteger firstNameHash = [_firstName hash];
    NSUInteger lastNameHast = [_lstName hash];
    NSUinteger ageHash = _age;
    return firstNameHash ^ lastNameHash ^ ageHash;
}
@end
    
/*
 第9条：以“类族模式”隐藏实现细节
 */
- (void)EOC9 {
        
}
    
    + (UIBUtton *)buttonWithType:(UIButtonType)type;
    - (void)drawRect: (CGRect)rect {
        if (_type == TypeA) {
            
        } else if (_type == TypeB) {
            
        }
    }
    
typedef NS_ENUM(NSUinteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};
@interface EOCEmployee : NSObject
@property (copy) NSString *name;
@property NSUInteger salary;

+ (EOCEmployee *)
@end
    
/*
 第10条：在既有类中使用关联对象存放自定义数据
 */
#import <objc/runtime.h>
    
    static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";
    
    void objc_setAssociatedObject(id object, void* key, id value, obje_AssociationPolicy policy);
    id obje_getAssociatedObject(id object, void* key);
    void objc_removeAssociatedObjects(id object);
    
    - (void)askUserAQuestoin {
        UIALertView *alert = [[UIAlertView alloc] initWithTitle:@"Question"
                                                        message:@"What do you want to to?" delegate:UISelectionFeedbackGenerator
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Continue",nil];
        void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
            if (buttonIndex == 0) {
                [self doCancel];
            } else {
                [self doContinue]
            }
        };
        objc_setAssociatedObject(alert,EOCMyAlertViewKey,block,BJC_ASSOCIATION_COPY);
        [alert show];
    }
    
    - (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex
    {
//        if (buttonIndex == 0) {
//            [self doCancel];
//        } else {
//            [self doContinue];
//        }
        void (^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
        block(buttonIndex);
    }
    
/*
 第11条：理解objc_msgSend的作用
 */
#import <stdio.h>
    void printHello() {
        printf("Hello, world!\n");
    }
    
    void printGoodbye() {
        printf("Goodbye, world!\n");
    }
    
    void doTheThing(int type) {
        void (*fnc)();
        if (type == 0) {
//            printHello();
            fnc = printHello;
        } else {
            fnc = printGoodbye;
        }
        fnc();
        return 0;
    }
    
    id returnValue = [someObject messageName:parameter];
    void objc_msgSend(id self, SEL cmd, ...);
    id returnValue = objc_msgSend(someObject, @selector(messageName:),parameter);
    <return_type> Class_selector(id self, SEL _cmd, ...);
    
/*
 第12条:理解消息转n发机制
 */
    + (BOOL)resolveInstanceMethod:(SEL)selector;
    id autoDictionaryGetter(id self, SEL _cmd);
    void autoDictionarySetter(id self, SEL _cmd, id value);
    + (BOOL)resolveInstanceMethod:(SEL)selector {
        NSString *selectorString = NSStringFromSelector(selector);
        if(/*selector is from a @dynamic property*/) {
            if ([selectorString hasPrefix:@"set"]) {
            class_addMethod(self, selector, (IMP)autoDictionarySetter,"v@:@");
            } else {
            class_addMethod(self,selector, (IMP)autoDictionaryGetter,"@@:");
            }
            return YES;
        }
        return [super resolveInstanceMethod:selector];
    }
    
    - (id)forwardingTargetForSelector:(SEL)aSelector;
    - (void)forwardInvocation:(NSInvocation*)invocation;

#import <Foundation/Foundation.h>
    @interface EOCAutoDictionray: NSObject
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;
@end
    
#import "EOCAutoDictionary.h"
#import <objc/runtime.h>
    
@interface EOCAutoDictionary ()
@property (nonatomic, strong) NSMutableDictionary *backingStore;
@end
    
@implementation EOCAutoDictionary

@dynamic string, number,date, opaqueObject;

- (id)init {
    if (self = [super init]) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}

id autoDictionaryGetter(id self, SEL _cmd) {
    //Get the backing store from the object
    EOCAutoDictionary *typedSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    //The key is simply the selector name
    NSString *key = NSStringFromSelector(_cmd);
    
    //Return the value
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    //Get the backing store from the object
    EOCAutoDictionary *typedSelf = (EOCAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    /**
        The selector will be for example, "setOpaqueObject:".
                We need to remove the "set", ":" and lowercase the first letter of the remainder.
     */
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    //Remove the ':' at the end
    [key deleteCharactersInRange:NSMakeRange(key.length-1, 1)];
    
    //Remove the 'set' prefix
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    //Lowercase the first character
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowercaseFirstChar];
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

- (void)EOC11 {
    EOCAutoDictionary *dict = [EOCAutoDictionary new];
    dict.date = [NSDate dateWithTimeInteravlSince1970:475372800];
    NSLog(@"dict.date = %@",dict.date);
}

/*
 第13条:用“方法调配技术”调试“黑盒方法”
 */
- (void)EOC13 {
    Method class_getInstanceMethod(Class aClass, SEL aSelector);
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(uppercaseString));
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSString *string = @"This iS tHe StRiNg";
    NSString *lowercaseString = [string lowercaseString];
    NSLog(@"lowercaseString = %@",lowercaseString);
    //Output: lowercaseString = THIS IS THE STRING
    
    NSString *uppercaseString = [string uppercaseString];
    NSLog(@"uppercaseString = %@",uppercaseString);
    //Output: uppercaseString = this is the string
}
void method_exchangeImplementatiions(Method m1, Method m2);

@interface NSString (EOCMyAdditions)
- (NSString *)eoc_myLowercaseString;
@end
    
@implementation NSString (EOCMyAdditions)
- (NSString *)eoc_myLowercaseString {
    NSString *lowercase = [self eoc_myLowercaseString];
    NSLog(@"%@ => %@",self, lowercase);
    return lowercase;
}

Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
Method swappedMethod = class_getInstanceMethod([NSString class], @selector(eoc_myLowercaseString));
method_exchangeImplementations(originalMethod, swappedMethod);

NSString *string = @"ThIs iS tHe StRiNg";
NSString *lowercaseString = [string lowercaseString];
// Output: ThIs iS tHe StRiNg => this is the string

/*
 第14条：理解“类对象”的用意
 */
- (void)EOC14 {
    NSString *pointerVariable = @"some string";
    String stackVariable = @"Some string";
    // error: interface type cannot be statically allocated
    id genericTypedString = @"Some string";
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict isMemberOfClass:[NSDictionary class]]; // /< NO
    [dict isMemberOfClass:[NSMutableDictionary class]]; // /<YES
    [dict isKindOfClass:[NSDictionary class]]; // /< YES
    [dict isKindOfClass:[NSArray class]]; // /< NO
}

typedef struct objc_object {
    Class isa;
} *id;

typedef struct objc_class *Class;
struct objc_class {
    Class isa;
    Class super_class;
    const char *name;
    long version;
    long info;
    long instance_size;
    struct objc_ivar_list *ivars;
    struct objc_method_list **methodLists;
    struct objc_cache *cache;
    struct objc_protocol_list *protocols;
}

- (NSString *)comaSeparatedStringFromObjects:(NSArray *)array {
    NSMutableString *string = [NSMutableString new];
    for (id object in array) {
        if ([object isKindOfClass:[NSString class]]) {
            [string appendFormat:@"%@,",object];
        } else if ([object isKindOfClass:[NSNumber class]]) {
            [string appendFormat:@"%d,",[object intValue]];
        } else if ([object isKindOfClass:[NSData class]]) {
            NSString *base4Encoded = /*base 64 encoded data */;
            [string appendFormat:@"%@,",base4Encoded];
        } else {
            //Type not supported
        }
    }
    return string;
}

id object = /*...*/;
if ([object class] == [EOCSomeClass Class]) {
    //'object' is an instance of EOCSomeClass
}

/**
 第3章 接口与API设计
 */

/*
 第15条：用前缀避免命名空间冲突
 */
// EOCSoundPlayer.h
#import <Foundation/Foundation.h>
@class EOCSoundPlayer
@protocol EOCSoundPlayerDelegate <NSObject>
- (void)soundPlayerDidFinish:(EOCSoundPlayer *)player;
@end
    
@interface EOCSoundPlayer :NSObject
@property (nonatomic, weak) id <EOCSoundPlayerDelegate> delegate;
- (id)initWithURL:(NSURL*)url;
- (void)playSound;
@end
    
//EOCSoundPlayer.m
#import "EOcSoundPlayer.h"
#import <AudioToolbox/AudioToolbox.h>
    
    void completion(SystemSoundID ssID, void *clientData) {
        EOCSoundPlayer *player = (__Bridge EOCSoundPlayer *)clientData;
        if ([player.delegate respondsToSelector:@selector(souundplayerDidFinish:)]) {
            [player.delegate soundPlayerDidFinish:player];
        }
    }
    
    @implementation EOCSoundPlayer {
        SystemSoundID _systemSoundID;
    }

- (id)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &_systemSoundID);
    }
    return self;
}

- (void)dealloc {
    AudioServicesDisposeSystemSoundID(_systemSoundID);
}

- (void)playSound {
    AudioServicesAddSystemSoundCompletion(_systemSoundID, NULL, NULL, completion, (__bridge void*)self));
    AudioServicesPlayAlertSound(_systemSoundID);
}
@end
