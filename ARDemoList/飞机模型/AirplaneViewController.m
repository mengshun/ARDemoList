//
//  AirplaneViewController.m
//  ARDemoList
//
//  Created by 孟顺 on 2020/1/16.
//  Copyright © 2020 mengshun. All rights reserved.
//

#import "AirplaneViewController.h"
#import <ARKit/ARKit.h>

@interface AirplaneViewController ()
@property (nonatomic, strong) ARSCNView *arSCNView;
@property (nonatomic, strong) ARWorldTrackingConfiguration *arWordTrackingConfiguration;
@end

@implementation AirplaneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.arSCNView = [[ARSCNView alloc] initWithFrame:self.view.bounds options:nil];
    self.arSCNView.session = [[ARSession alloc] init];
    [self.view addSubview:self.arSCNView];
    self.arWordTrackingConfiguration = [[ARWorldTrackingConfiguration alloc] init];
    self.arWordTrackingConfiguration.planeDetection = ARPlaneDetectionHorizontal;
    self.arWordTrackingConfiguration.lightEstimationEnabled = YES;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.arSCNView.session runWithConfiguration:self.arWordTrackingConfiguration];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.arSCNView.session pause];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SCNScene *scene = [SCNScene sceneNamed:@"ship.scn"];
    SCNNode *shipNode = scene.rootNode.childNodes.firstObject;
    shipNode.position = SCNVector3Make(0, -1, -1);
    [self.arSCNView.scene.rootNode addChildNode:shipNode];
}

@end
