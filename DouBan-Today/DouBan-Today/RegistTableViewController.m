//
//  RegistTableViewController.m
//  DouBan-Today
//
//  Created by lanou3g on 16/1/9.
//  Copyright © 2016年 wey. All rights reserved.
//

#import "RegistTableViewController.h"
#import "User.h"
#import "DataHelper.h"
@interface RegistTableViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *pwdLabel;
@property (weak, nonatomic) IBOutlet UITextField *confirmlabel;
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *phonelabel;

@end

@implementation RegistTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注 册";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registeAction)];
}

- (void)registeAction {
    if ([self checkAction]) {
        return;
    }
    
    
    User *model = [[User alloc]init];
    model.username = _usernameLabel.text;
    model.password = _pwdLabel.text;
    model.email = _emailLabel.text;
    model.phoneNum = _phonelabel.text;
    [[DataHelper shareInstance] addUser:model];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)checkAction {

    if (!(_usernameLabel.text.length && _pwdLabel.text.length)){
        [NetWorkHelper createHudWith:@"用户名密码不为空 !"];
        return YES;
    }else {
        return NO;
    }
}

- (void)viewWillAppear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(popAction:) name:UIKeyboardWillChangeFrameNotification object:nil];

}


- (void)popAction:(NSNotification *)sender {
    self.tableView.scrollEnabled = YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
     self.tableView.scrollEnabled = NO;
    return YES;
}
- (void)viewWillDisappear:(BOOL)animated {

    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"popAction" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"backAction" object:nil];
}
@end
