//
//  XCPImageViewController.m
//  XCPImageCollectionView
//
//  Created by Apple on 2017/1/13.
//  Copyright © 2017年 夏翠萍. All rights reserved.
//

#import "XCPImageViewController.h"

@interface XCPImageViewController ()

@end

@implementation XCPImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickedImageList = [NSMutableArray array];
    CGFloat width = self.view.frame.size.width;
    
    _imagePickedView = [[XCPImageView alloc] initWithFrame:CGRectMake(0, 100, width, width*2)];
    _imagePickedView.pickDelegate = self;
    [self.view addSubview:_imagePickedView];
    
}

#pragma mark - imagePickedViewDelegate
- (void)imagePickedViewDidClickedPickIcon{
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil                                                                             message: nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    //相机
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *pickController = [[UIImagePickerController alloc] init];
        pickController.delegate = self;
        //处理点击拍照
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"模拟器里不支持拍照，请在真机上测试!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }]];
    
    //相册
    [alertController addAction: [UIAlertAction actionWithTitle: @"从相册选取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        //处理点击从相册选取
        UIImagePickerController *pickController = [[UIImagePickerController alloc] init];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickController.sourceType];
        }
        pickController.delegate = self;
        [self presentViewController:pickController animated:YES completion:nil];
    }]];
    
    //取消
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [_pickedImageList addObject:image];
    _imagePickedView.dataList = _pickedImageList;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
