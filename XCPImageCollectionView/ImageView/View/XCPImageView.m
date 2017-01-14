//
//  XCPImageView.m
//  XCPImageCollectionView
//
//  Created by Apple on 2017/1/13.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "XCPImageView.h"

@implementation XCPImageViewCell

@synthesize imageView = _imageView;
@synthesize image = _image;

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat imageWidth = frame.size.width-10;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, imageWidth, imageWidth)];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_imageView];

    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
}


@end


@implementation XCPImageView

@synthesize dataList = _dataList;
@synthesize pickDelegate = _pickDelegate;
@synthesize clearBtn = _clearBtn;

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self registerClass:[XCPImageViewCell class] forCellWithReuseIdentifier:@"itemCell"];
        _pickIcon = [UIImage imageNamed:@"icon-photo-image.png"];
        _imageList = [[NSMutableArray alloc] init];
        [_imageList addObject:_pickIcon];
        
        [self setDelegate:self];
        [self setDataSource:self];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    _imageList = [NSMutableArray arrayWithArray:dataList];
    [_imageList addObject:_pickIcon];
    
    [self reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_imageList count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.frame.size.width/4)-0.001, (self.frame.size.width/4)-0.001);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0001;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.001;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XCPImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    cell.image = [_imageList objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger lastIndex = [_imageList count] - 1;
    if (indexPath.row == lastIndex) {
        if (_pickDelegate && [_pickDelegate respondsToSelector:@selector(imagePickedViewDidClickedPickIcon)]) {
            [_pickDelegate imagePickedViewDidClickedPickIcon];
        }
    }
    
}


@end
