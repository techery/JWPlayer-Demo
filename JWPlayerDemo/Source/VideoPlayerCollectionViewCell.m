//
//  VideoPlayerCollectionViewCell.m
//  JWPlayerDemo
//
//  Created by Eugene on 3/21/17.
//  Copyright © 2017 Eugene Tulusha. All rights reserved.
//

#import "VideoPlayerCollectionViewCell.h"
#import <JWPlayer-SDK/JWPlayerController.h>
#import <Masonry/Masonry.h>

@interface VideoPlayerCollectionViewCell ()

@property (nonatomic, strong) JWPlayerController *player;

@end

@implementation VideoPlayerCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];

    [self.player stop];
    [self.player.view removeFromSuperview];
    self.player = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor clearColor];
        [self addViews];
    }
    return self;
}

- (void)addViews {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bbb_thumb"]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);        
    }];

    UIButton *playButton = [[UIButton alloc] init];
    [playButton setImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(onPlayButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:playButton];
    [playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

- (void)addPlayer {
    if (self.player) {
        [self.player loadConfig:self.playerConfig];
        return;
    }
    self.player = [[JWPlayerController alloc] initWithConfig:self.playerConfig];
    self.player.openSafariOnAdClick = YES;
    self.player.forceFullScreenOnLandscape = self.isLandscapeSupported;
    self.player.forceLandscapeOnFullScreen = self.isLandscapeSupported;

    [self.contentView addSubview:self.player.view];

    self.player.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.bounds), CGRectGetHeight(self.contentView.bounds));
}

- (void)setIsLandscapeSupported:(BOOL)isLandscapeSupported {
    _isLandscapeSupported = isLandscapeSupported;
    if (isLandscapeSupported) {
        [self addPlayer];
    }
}

#pragma mark - Actions

- (void)onPlayButtonTapped {
    [self addPlayer];

    [self.player play];
}

#pragma mark - Player config

- (JWConfig *)playerConfig {
    JWConfig *config = [JWConfig configWithContentURL:@"http://content.bitsontherun.com/videos/bkaovAYt-injeKYZS.mp4"];
    config.sources = @[
                       [JWSource sourceWithFile:@"http://content.bitsontherun.com/videos/bkaovAYt-injeKYZS.mp4" label:@"180p Streaming"],
                       [JWSource sourceWithFile:@"http://content.bitsontherun.com/videos/bkaovAYt-52qL9xLP.mp4" label:@"270p Streaming"],
                       [JWSource sourceWithFile:@"http://content.bitsontherun.com/videos/bkaovAYt-DZ7jSYgM.mp4" label:@"720p Streaming" isDefault:YES]
                       ];
    config.image = @"https://dl.dropboxusercontent.com/s/vp1cbs1zvp5eu3p/bbb_thumb.png?dl=0";
    config.title = @"Big Bick Bunny";
    config.autostart = !self.isLandscapeSupported;
    config.premiumSkin = JWPremiumSkinSeven;
    
    return config;
}

@end
