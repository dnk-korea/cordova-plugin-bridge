
#import <Cordova/CDV.h>

@interface Bridge : CDVPlugin {
    // Member variables go here.
    NSMutableArray* files;
    NSMutableArray* refFile;
}

- (void)test:(CDVInvokedUrlCommand*)command;
- (void)saveFile:(CDVInvokedUrlCommand*)command;
- (void)saveRefFile:(CDVInvokedUrlCommand*)command;
- (void)getFile:(CDVInvokedUrlCommand*)command;
- (void)getRefFile:(CDVInvokedUrlCommand*)command;
- (void)deleteFile:(CDVInvokedUrlCommand*)command;
- (void)deleteRefFile:(CDVInvokedUrlCommand*)command;
- (void)deleteAllFile:(CDVInvokedUrlCommand*)command;

@end

@implementation Bridge

- (void)test:(CDVInvokedUrlCommand*)command
{
    NSLog(@"test");
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:command.arguments] callbackId:command.callbackId];
}

- (void)saveFile:(CDVInvokedUrlCommand*)command
{
    if (files == nil)
        files = [NSMutableArray array];
    
    NSLog(@"saveFile");
    
    for(int i = 0; i < [command.arguments count]; i++)
    {
        [files addObject:[command.arguments objectAtIndex:i]];
        
    }
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"%lu", (unsigned long)[files count]]] callbackId:command.callbackId];
}

- (void)saveRefFile:(CDVInvokedUrlCommand*)command
{
    NSLog(@"saveRefFile");
    
    refFile = (NSMutableArray*)command.arguments;
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"%lu", (unsigned long)[refFile count]]] callbackId:command.callbackId];
}

- (void)getFile:(CDVInvokedUrlCommand*)command
{
    if (files == nil)
        files = [NSMutableArray array];
    
    NSLog(@"getFile");

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:files] callbackId:command.callbackId];
}

- (void)getRefFile:(CDVInvokedUrlCommand*)command
{
    if (refFile == nil)
        refFile = [NSMutableArray array];
    
    NSLog(@"getRefFile");
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:refFile] callbackId:command.callbackId];
}

- (void)deleteFile:(CDVInvokedUrlCommand*)command
{
    if (files == nil)
        files = [NSMutableArray array];
    
    NSLog(@"deleteFile");
    
    if([command.arguments count] > 0)
    {
        NSMutableArray *rs = [NSMutableArray array];

        for(int i = 0; i < [files count]; i++)
        {
            bool del = false;
            for(int j = 0; j < [command.arguments count]; j++)
            {
                if(i == [[command.arguments objectAtIndex:j] intValue])
                {
                    del = true;
                    break;
                }
            }

            if(!del)
            {
                [rs addObject:[files objectAtIndex:i]];
            }
        }
        files = rs;
    }
    else
    {
        files = [NSMutableArray array];
    }
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)deleteRefFile:(CDVInvokedUrlCommand*)command
{
    NSLog(@"deleteRefFile");
    
    refFile = [NSMutableArray array];
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void)deleteAllFile:(CDVInvokedUrlCommand*)command
{
    NSLog(@"deleteAllFile");
    
    files = [NSMutableArray array];
    refFile = [NSMutableArray array];
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

@end


