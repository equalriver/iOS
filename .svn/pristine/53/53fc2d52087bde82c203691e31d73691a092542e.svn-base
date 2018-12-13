//
//  YTKNetworkAgent.m
//
//  Copyright (c) 2012-2014 YTKNetwork https://github.com/yuantiku
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "YTKNetworkAgent.h"
#import "YTKNetworkConfig.h"
#import "YTKNetworkPrivate.h"

@implementation YTKNetworkAgent {
    AFHTTPSessionManager *_manager;
    YTKNetworkConfig *_config;
    NSMutableDictionary *_requestsRecord;
    dispatch_queue_t _requestProcessingQueue;
}

+ (YTKNetworkAgent *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    self = [super init];
    if (self) {
        _config = [YTKNetworkConfig sharedInstance];
        _manager = [AFHTTPSessionManager manager];
        _requestsRecord = [NSMutableDictionary dictionary];
        _manager.securityPolicy = _config.securityPolicy;
        _requestProcessingQueue = dispatch_queue_create("com.talenton.ytknetwork.request.processing", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (NSString *)buildRequestUrl:(YTKBaseRequest *)request {
    NSString *detailUrl = [request requestUrl];
    if ([detailUrl hasPrefix:@"http"]) {
        return detailUrl;
    }
    // filter url
    NSArray *filters = [_config urlFilters];
    for (id<YTKUrlFilterProtocol> f in filters) {
        detailUrl = [f filterUrl:detailUrl withRequest:request];
    }
    
    NSString *baseUrl;
    if ([request useCDN]) {
        if ([request cdnUrl].length > 0) {
            baseUrl = [request cdnUrl];
        } else {
            baseUrl = [_config cdnUrl];
        }
    } else {
        if ([request baseUrl].length > 0) {
            baseUrl = [request baseUrl];
        } else {
            baseUrl = [_config baseUrl];
        }
    }
    return [NSString stringWithFormat:@"%@%@", baseUrl, detailUrl];
}

- (void)addRequest:(YTKBaseRequest *)request {
    dispatch_async(_requestProcessingQueue, ^{
        [self ytk_addRequst:request];
    });
}

- (void)ytk_addRequst:(YTKBaseRequest *)request {
    YTKRequestMethod method = [request requestMethod];
    NSString *url = [self buildRequestUrl:request];
    NSMutableDictionary *param = [request.requestArgument mutableCopy];
    if (request.requestArgument) {

        [param setValue:[@"nanboshengxueorg" md5String] forKey:@"nanbopage"];
    } 
    AFConstructingBlock constructingBlock = [request constructingBodyBlock];
    if (request.requestSerializerType == YTKRequestSerializerTypeHTTP) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    } else if (request.requestSerializerType == YTKRequestSerializerTypeJSON) {
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    _manager.requestSerializer.timeoutInterval = [request requestTimeoutInterval];
    // if api need server username and password
    NSArray *authorizationHeaderFieldArray = [request requestAuthorizationHeaderFieldArray];
    if (authorizationHeaderFieldArray != nil) {
        [_manager.requestSerializer setAuthorizationHeaderFieldWithUsername:(NSString *)authorizationHeaderFieldArray.firstObject
                                                                   password:(NSString *)authorizationHeaderFieldArray.lastObject];
    }
    
    // if api need add custom value to HTTPHeaderField
    NSDictionary *headerFieldValueDictionary = [request requestHeaderFieldValueDictionary];
    if (headerFieldValueDictionary != nil) {
        for (id httpHeaderField in headerFieldValueDictionary.allKeys) {
            id value = headerFieldValueDictionary[httpHeaderField];
            if ([httpHeaderField isKindOfClass:[NSString class]] && [value isKindOfClass:[NSString class]]) {
                [_manager.requestSerializer setValue:(NSString *)value forHTTPHeaderField:(NSString *)httpHeaderField];
            } else {
                //                DDLogError(@"Error, class of key/value in headerFieldValueDictionary should be NSString.");
            }
        }
    }
    
    // if api build custom url request
    NSURLRequest *customUrlRequest= [request buildCustomUrlRequest];
    if (customUrlRequest) {
        //        NSURLSessionDataTask *task = [[AFHTTPRequestOperation alloc] initWithRequest:customUrlRequest];
        //        [operation setCompletionBlockWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        //            [self handleRequestResult:operation];
        //        } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //            [self handleRequestResult:operation];
        //        }];
        //        request.requestTask = operation;
        //        operation.responseSerializer = _manager.responseSerializer;
        //        [_manager.operationQueue addOperation:operation];
    } else {
        if (method == YTKRequestMethodGet) {
            if (request.resumableDownloadPath) {
                //                // add parameters to URL;
                //                NSString *filteredUrl = [YTKNetworkPrivate urlStringWithOriginUrlString:url appendParameters:param];
                //
                //                NSURLRequest *requestUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:filteredUrl]];
                //                AFDownloadRequestOperation *task = [[AFDownloadRequestOperation alloc] initWithRequest:requestUrl
                //                                                                                                 targetPath:request.resumableDownloadPath shouldResume:YES];
                //                [operation setProgressiveDownloadProgressBlock:request.resumableDownloadProgressBlock];
                //                [operation setCompletionBlockWithSuccess:^(NSURLSessionDataTask *task, id responseObject) {
                //                    [self handleRequestResult:operation];
                //                }                                failure:^(NSURLSessionDataTask *task, NSError *error) {
                //                    [self handleRequestResult:operation];
                //                }];
                //                request.requestTask = operation;
                //                [_manager.operationQueue addOperation:operation];
                //                request.requestTask = [_manager downloadTaskWithResumeData:[NSData dataWithContentsOfFile:request.resumableDownloadPath] progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                //                } destination:<#^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response)destination#> completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                //
                //                }];
            } else {
                request.requestTask = [_manager GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self handleRequestResult:request responseObject:responseObject];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [self handleRequestResult:request responseObject:nil];
                }];
            }
        } else if (method == YTKRequestMethodPost) {
            if (constructingBlock) {
                NSString* tmpFilename = [NSString stringWithFormat:@"%f", [NSDate timeIntervalSinceReferenceDate]];
                NSURL* tmpFileUrl = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:tmpFilename]];
                
                // Create a multipart form request.
                NSMutableURLRequest *multipartRequest = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST"
                                                                                                                   URLString:url
                                                                                                                  parameters:nil constructingBodyWithBlock:constructingBlock error:nil];
                
                // Dump multipart request into the temporary file.
                [_manager.requestSerializer requestWithMultipartFormRequest:multipartRequest
                                                          writingStreamContentsToFile:tmpFileUrl
                                                                    completionHandler:^(NSError *error) {
                                                                        // Here note that we are submitting the initial multipart request. We are, however,
                                                                        // forcing the body stream to be read from the temporary file.
                                                                        request.requestTask = [_manager uploadTaskWithRequest:multipartRequest
                                                                                                                                    fromFile:tmpFileUrl
                                                                                                                                    progress:nil
                                                                                                                           completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
                                                                                                              {
                                                                                                                  // Cleanup: remove temporary file.
                                                                                                                  [[NSFileManager defaultManager] removeItemAtURL:tmpFileUrl error:nil];
                                                                                                                  
                                                                                                                  // Do something with the result.
                                                                                                                  if (error) {
                                                                                                                      
                                                                            [self handleRequestResult:request responseObject:nil];                                      } else {
                                                                [self handleRequestResult:request responseObject:responseObject];
                                                                                                                  }
                                                                                                              }];
                                                                        // Start the file upload.
                                                                        [request.requestTask resume];
                                                                    }];
                
                
                
                
//                request.requestTask = [_manager POST:url parameters:param constructingBodyWithBlock:constructingBlock progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                    [self handleRequestResult:request responseObject:responseObject];
//                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                    [self handleRequestResult:request responseObject:nil];
//                }];
            } else {
                request.requestTask = [_manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self handleRequestResult:request responseObject:responseObject];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    [self handleRequestResult:request responseObject:nil];
                }];
            }
        } else if (method == YTKRequestMethodHead) {
            request.requestTask = [_manager HEAD:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task) {
                [self handleRequestResult:request responseObject:nil];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResult:request responseObject:nil];
            }];
        } else if (method == YTKRequestMethodPut) {
            request.requestTask = [_manager PUT:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResult:request responseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResult:request responseObject:nil];
            }];
        } else if (method == YTKRequestMethodDelete) {
            request.requestTask = [_manager DELETE:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResult:request responseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResult:request responseObject:nil];
            }];
        } else if (method == YTKRequestMethodPatch) {
            request.requestTask = [_manager PATCH:url parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleRequestResult:request responseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self handleRequestResult:request responseObject:nil];
            }];
        } else {
            DDLogError(@"Error, unsupport method type");
            return;
        }
    }
    
    // Set request operation priority
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8) {
        switch (request.requestPriority) {
            case YTKRequestPriorityHigh:
                request.requestTask.priority = NSURLSessionTaskPriorityHigh;
                break;
            case YTKRequestPriorityLow:
                request.requestTask.priority = NSURLSessionTaskPriorityLow;
                break;
            case YTKRequestPriorityDefault:
            default:
                request.requestTask.priority = NSURLSessionTaskPriorityDefault;
                break;
        }
    }
    
    // retain operation
    //    DDLogInfo(@"Add request: %@", NSStringFromClass([request class]));
    [self addOperation:request];
}

- (void)cancelRequest:(YTKBaseRequest *)request completion:(YTKNetworkAgentCompletionBlock)completion {
    dispatch_async(_requestProcessingQueue, ^{
        [self ytk_cancelRequest:request];
        if (completion) {
            completion();
        }
    });
}

- (void)ytk_cancelRequest:(YTKBaseRequest *)request {
    [request.requestTask cancel];
    [self removeOperation:request];
    [request clearCompletionBlock];
}

- (void)cancelAllRequests {
    NSDictionary *copyRecord = [_requestsRecord copy];
    for (NSString *key in copyRecord) {
        YTKBaseRequest *request = copyRecord[key];
        [request stop];
    }
}

- (BOOL)checkResult:(YTKBaseRequest *)request {
    BOOL result = [request statusCodeValidator];
    if (!result) {
        return result;
    }
    id validator = [request jsonValidator];
    if (validator != nil) {
        id json = [request responseJSONObject];
        result = [YTKNetworkPrivate checkJson:json withValidator:validator];
    }
    return result;
}

- (void)handleRequestResult:(YTKBaseRequest *)request responseObject:(id)responseObject {
    request.responseJSONObject = responseObject;
    //    DDLogInfo(@"Finished Request: %@", NSStringFromClass([request class]));
    if (request) {
        BOOL succeed = [self checkResult:request];
        if (succeed) {
            [request toggleAccessoriesWillStopCallBack];
            [request requestCompleteFilter];
            if (request.delegate != nil) {
                [request.delegate requestFinished:request];
            }
            if (request.successCompletionBlock) {
                request.successCompletionBlock(request);
            }
            [request toggleAccessoriesDidStopCallBack];
        } else {
            DDLogError(@"Request %@ failed, status code = %ld",
                       NSStringFromClass([request class]), (long)request.responseStatusCode);
            [request toggleAccessoriesWillStopCallBack];
            [request requestFailedFilter];
            if (request.delegate != nil) {
                [request.delegate requestFailed:request];
            }
            if (request.failureCompletionBlock) {
                request.failureCompletionBlock(request);
            }
            [request toggleAccessoriesDidStopCallBack];
        }
    }
    [self removeOperation:request];
    [request clearCompletionBlock];
}

- (NSString *)requestHashKey:(YTKBaseRequest *)request {
    NSString *key = [NSString stringWithFormat:@"%lu", (unsigned long)[request.requestTask hash]];
    return key;
}

- (void)addOperation:(YTKBaseRequest *)request {
    if (request.requestTask != nil) {
        request.executing = YES;
        NSString *key = [self requestHashKey:request];
        @synchronized(self) {
            _requestsRecord[key] = request;
        }
    }
}

- (void)removeOperation:(YTKBaseRequest *)request {
    if (!request) {
        return;
    }

    NSString *key = [self requestHashKey:request];
    request.executing = NO;
    @synchronized(self) {
        [_requestsRecord removeObjectForKey:key];
    }
    //    DDLogInfo(@"Request queue size = %lu", (unsigned long)[_requestsRecord count]);
}

@end
