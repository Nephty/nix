{ ... }: {
  programs.git = {
    enable = true;
    userEmail = "[REDACTED]";
    userName = "Nephty";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      ".idea/"
    ];
  };
}
