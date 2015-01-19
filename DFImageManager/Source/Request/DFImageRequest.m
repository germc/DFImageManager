// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Grebenyuk (github.com/kean).
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "DFImageRequest.h"
#import "DFImageRequestOptions.h"


@implementation DFImageRequest

- (instancetype)initWithAsset:(id<DFImageAsset>)asset targetSize:(CGSize)targetSize contentMode:(DFImageContentMode)contentMode options:(DFImageRequestOptions *)options {
    if (self = [super init]) {
        _asset = asset;
        _targetSize = targetSize;
        _contentMode = contentMode;
        _options = options ?: [DFImageRequestOptions new];
    }
    return self;
}

- (instancetype)initWithAsset:(id<DFImageAsset>)asset {
    return [self initWithAsset:asset targetSize:DFImageManagerMaximumSize contentMode:DFImageContentModeAspectFill options:nil];
}

- (id)copyWithZone:(NSZone *)zone {
    DFImageRequest *request = [DFImageRequest new];
    request.asset = self.asset;
    request.targetSize = self.targetSize;
    request.contentMode = self.contentMode;
    request.options = [self.options copy];
    return request;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> { asset = %@, targetSize = %@, contentMode = %i, options = %@, userInfo = %@ }", [self class], self, self.asset, NSStringFromCGSize(self.targetSize), (int)self.contentMode, self.options];
}

@end
