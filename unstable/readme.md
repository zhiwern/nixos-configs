The nix-channel command is designed to manage multiple nix channels on your system. It's easy to update channels to the latest versions and add or remove channels.

To list all channels that are available in your system, use the --list flag:
```sudo nix-channel --list```

To add a new channel (for example nixos-unstable), use the --add flag, followed by the URL of the channel and a name to identify it by. The list of channel URLs can be found at https://nixos.org/channels/.
```sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable```

To update a channel, use the --update flag, followed by the channel name that you declared when you added the channel:
```sudo nix-channel --update unstable```
