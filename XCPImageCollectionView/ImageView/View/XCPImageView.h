//
//  XCPImageView.h
//  XCPImageCollectionView
//
//  Created by Apple on 2017/1/13.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCPImageViewCell : UICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, readonly)UIImageView *imageView;
@property(nonatomic, retain)UIImage *image;


@end


@protocol XCPImageViewDelegate <NSObject>

- (void)imagePickedViewDidClickedPickIcon;

@end

@interface XCPImageView : UICollectionView <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
@private
    UIImage *_pickIcon;
    NSMutableArray *_imageList;
}

- (instancetype)initWithFrame:(CGRect)frame;

@property(nonatomic, retain)UIButton *clearBtn;
@property(nonatomic, strong)NSArray *dataList;
@property(nonatomic, assign)id<XCPImageViewDelegate>pickDelegate;

@end
