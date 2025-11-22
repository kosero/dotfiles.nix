{
  programs.vesktop = {
    vencord.settings = {
      autoUpdate = true;

      plugins = {
        MessageLogger = {
          enabled = true;
          ignoreSelf = true;
        };
        FakeNitro.enabled = true;
        BetterFolders.enabled = true;
        AnonymiseFileNames.enabled = true;
        BetterUploadButton.enabled = true;
        MessageClickActions.enabled = true;
        MessageLatency.enabled = true;
        MentionAvatars.enabled = true;
        NoTypingAnimatio.enabled = true;
        PlatformIndicators.enabled = true;
        ServerInfo.enabled = true;
        ShowConnections.enabled = true;
        ShowTimeoutDuration.enabled = true;
        StreamerModeOnStream.enabled = true;
        TypingIndicator.enabled = true;
        TypingTweaks.enabled = true;
        UserVoiceShow.enabled = true;
        ValidUser.enabled = true;
        ViewIcons.enabled = true;
        VoiceChatDoubleClick.enabled = true;
        WebScreenShareFixes.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
      };
    };
  };
}
