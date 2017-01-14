//
//  XCPImageViewController.h
//  XCPImageCollectionView
//
//  Created by Apple on 2017/1/13.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCPImageView.h"

@interface XCPImageViewController : UIViewController<UIActionSheetDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate, XCPImageViewDelegate>
{
    XCPImageView *_imagePickedView;
    NSMutableArray *_pickedImageList;
}

@end
