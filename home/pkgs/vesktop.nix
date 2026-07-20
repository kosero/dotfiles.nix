{ ... }: {
  programs.vesktop = {
    enable = true;
    settings = {
      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        useQuickCss = true;
        plugins = {
          ChatInputButtonAPI.enabled = true;
          CommandsAPI.enabled = true;
          DynamicImageModalAPI.enabled = true;
          MemberListDecoratorsAPI.enabled = true;
          MessageAccessoriesAPI.enabled = true;
          MessageDecorationsAPI.enabled = true;
          MessageEventsAPI.enabled = true;
          MessageUpdaterAPI.enabled = true;
          UserSettingsAPI.enabled = true;
          BetterUploadButton.enabled = true;
          CharacterCounter.enabled = true;
          ClientTheme = {
            enabled = true;
            color = "272e33";
          };
          CrashHandler.enabled = true;
          FakeNitro.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;
          MessageClickActions.enabled = true;
          MessageLatency.enabled = true;
          MessageLogger.enabled = true;
          NoMiddleClickPaste.enabled = true;
          NoTypingAnimation.enabled = true;
          PlatformIndicators.enabled = true;
          RelationshipNotifier.enabled = true;
          ServerInfo.enabled = true;
          ShowConnections.enabled = true;
          ShowHiddenChannels.enabled = true;
          ShowHiddenThings.enabled = true;
          ShowTimeoutDuration.enabled = true;
          StreamerModeOnStream.enabled = true;
          TypingIndicator.enabled = true;
          TypingTweaks.enabled = true;
          UserVoiceShow.enabled = true;
          ValidReply.enabled = true;
          ValidUser.enabled = true;
          ViewIcons.enabled = true;
          WhoReacted.enabled = true;
          BadgeAPI.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
          NoTrack.enabled = true;
          Settings.enabled = true;
          ConcatenatedComponentExtractor.enabled = true;
          DisableDeepLinks.enabled = true;
          SupportHelper.enabled = true;
          WebContextMenus.enabled = true;
        };
        notifications = {
          timeout = 5000;
          position = "bottom-right";
          useNative = "not-focused";
          logLimit = 50;
        };
      };
      quickCss = "";
    };
  };
}
