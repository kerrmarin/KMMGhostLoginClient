//
//  KMMViewController.m
//  GhostLoginClient
//
//  Created by Kerr Marin Miller on 07/02/2015.
//  Copyright (c) 2014 Kerr Marin Miller. All rights reserved.
//

#import "KMMViewController.h"

#import "KMMGhostLoginClient.h"
#import "KMMGhostLoginJSONSessionManager.h"
#import "KMMGhostLoginTokenJSONParser.h"
#import "KMMGhostLoginToken.h"

@interface KMMViewController ()

@property(nonatomic, weak) IBOutlet UIButton *loginButton;
@property(nonatomic, weak) IBOutlet UITextField *emailTextField;
@property(nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property(nonatomic, weak) IBOutlet UITextField *domainTextField;
@property(nonatomic, weak) IBOutlet UITextView *resultsTextView;

@property(nonatomic) KMMGhostLoginClient *client;

@end

@implementation KMMViewController

-(IBAction)didTapLoginButton:(id)sender {
    [self.view endEditing:YES];

    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    NSString *domain = self.domainTextField.text;
    
    NSMutableString *log = [NSMutableString stringWithFormat:@"Logging in with email: %@\nPassword: ****** (%lu characters)\nDomain: %@", email, (unsigned long)password.length, domain];
    self.resultsTextView.text = log;
    
    KMMGhostLoginJSONSessionManager *manager = [[KMMGhostLoginJSONSessionManager alloc] initWithDomainURL: [NSURL URLWithString: domain]];
    
    KMMGhostLoginTokenJSONParser *parser = [[KMMGhostLoginTokenJSONParser alloc] init];
    
    self.client = [[KMMGhostLoginClient alloc] initWithManager:manager parser:parser];
    
    [self.client loginWithUsername:email password:password complete:^(KMMGhostLoginToken *token, NSError* error) {
        if(error) {
            [log appendString:[NSString stringWithFormat:@"\nError: %@", error.localizedDescription]];
        } else {
            [log appendString:@"\nLOGGED IN!"];
        }
        self.resultsTextView.text = log;
    }];
}

@end
