//
//  LoginViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/8.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "LoginViewController.h"
#import "DataHelper.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *pwdlabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
    
    if (![[DataHelper shareInstance] hasExist:_usernameLabel.text :_pwdlabel.text]) {
        [NetWorkHelper createHudWith:@"用户名密码错误 !"];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:@"online" forKey:kUserStatus];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
