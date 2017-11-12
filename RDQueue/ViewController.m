//
//  ViewController.m
//  RDQueue
//
//  Created by Daniel Rossbach on 12.11.17.
//  Copyright © 2017 Daniel Rossbach. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.name = @"MyOperationQueue";
    operationQueue.maxConcurrentOperationCount = 1;

    NSURLSessionConfiguration *urlSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    urlSessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    urlSessionConfiguration.HTTPMaximumConnectionsPerHost = 2;
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration: urlSessionConfiguration
                                                             delegate: nil
                                                        delegateQueue: operationQueue];

    NSURL *host1 = [NSURL URLWithString: @"https://whatthecommit.com"];

    /* Start request 1 */
    NSURLSessionDataTask * dataTask = [urlSession dataTaskWithURL: host1
                                                completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                    NSLog(@"Done Request 1");
                                                                });
                                                            } );
                                                        }
                                                    }];
    [dataTask resume];


    /* Start request 2 */
    NSURLSessionDataTask * dataTask2 = [urlSession dataTaskWithURL: host1
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       if(error == nil)
                                                       {
                                                           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                                   NSLog(@"Done Request 2");
                                                               });
                                                           } );
                                                       }

                                                   }];

    [dataTask2 resume];

    /* Start request 3 */
    NSURLSessionDataTask * dataTask3 = [urlSession dataTaskWithURL: host1
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                    NSLog(@"Done Request 3");
                                                                });
                                                            } );
                                                        }

                                                    }];
    
    [dataTask3 resume];

    /* Start request 4 */
    NSURLSessionDataTask * dataTask4 = [urlSession dataTaskWithURL: host1
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                    NSLog(@"Done Request 4");
                                                                });
                                                            } );
                                                        }

                                                    }];
    [dataTask4 resume];

    /* Start request 5 using different host */
    NSURL *host2 = [NSURL URLWithString: @"https://www.google.com"];
    NSURLSessionDataTask * dataTask5 = [urlSession dataTaskWithURL: host2
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil)
                                                        {
                                                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                                    NSLog(@"Done Request 5");
                                                                });
                                                            } );
                                                        }

                                                    }];
    [dataTask5 resume];

    /* Start request 6 */
    NSURLSessionDataTask * dataTask6 = [urlSession dataTaskWithURL: host1
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     if(error == nil)
                                                     {
                                                         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                                 NSLog(@"Done Request 6");
                                                             });
                                                         } );
                                                     }

                                                 }];
    [dataTask6 resume];

    /* Start request 7 */
    NSURLSessionDataTask * dataTask7 = [urlSession dataTaskWithURL: host1
                                                 completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                     if(error == nil)
                                                     {
                                                         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                                 NSLog(@"Done Request 7");
                                                             });
                                                         } );
                                                     }

                                                 }];
    [dataTask7 resume];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
