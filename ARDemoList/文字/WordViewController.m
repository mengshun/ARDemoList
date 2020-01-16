//
//  WordViewController.m
//  ARDemoList
//
//  Created by 孟顺 on 2020/1/16.
//  Copyright © 2020 mengshun. All rights reserved.
//

#import "WordViewController.h"
#import "WordScene.h"

@interface WordViewController ()<ARSKViewDelegate>

@property (nonatomic, strong) ARSKView *sceneView;

@end

@implementation WordViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    [self.sceneView.session runWithConfiguration:configuration];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.sceneView.session pause];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.sceneView = [[ARSKView alloc] initWithFrame:self.view.bounds];
    self.sceneView.delegate = self;
    self.sceneView.showsFPS = YES;
    self.sceneView.showsNodeCount = YES;
    [self.view addSubview:self.sceneView];
    
    WordScene *scene = [WordScene nodeWithFileNamed:@"Scene"];
    [self.sceneView presentScene:scene];
    
    
}


#pragma mark - ARSKViewDelegate

- (SKNode *)view:(ARSKView *)view nodeForAnchor:(ARAnchor *)anchor {
    // Create and configure a node for the anchor added to the view's session.
    SKLabelNode *labelNode = [[SKLabelNode alloc] init];
    labelNode.fontSize = 40;
    labelNode.fontColor = UIColor.redColor;
    labelNode.text = @"Good";
    labelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    labelNode.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    return labelNode;
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
}

- (void)view:(ARSKView *)view willUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
    
}

/**
 Called when a node has been updated with data from the given anchor.
 
 @param view The view that will render the scene.
 @param node The node that was updated.
 @param anchor The anchor that was updated.
 */
- (void)view:(ARSKView *)view didUpdateNode:(SKNode *)node forAnchor:(ARAnchor *)anchor
{
    
}


@end
