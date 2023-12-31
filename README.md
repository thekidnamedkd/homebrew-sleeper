# Sleeper

💤(｡-‿-｡)💤

Sleeper is a macOS utility that helps manage your computer's sleep behavior based on idle time. It can automatically put your computer to sleep after a specified period of inactivity.

I created this to set my external monitor to sleep while powering a Macbook with Apple silicone via Thunderbolt 4. This monitor worked well with my previous Windows machine and I was tired of leaving my workstation for a period and coming back to find my monitor was still on while my machine was resting.

I found that the default settings for turning the display off after idle time are not enough to let the monitor power down as well, but that manually putting the computer to sleep from the menu does work.

<img width="305" alt="image" src="https://github.com/thekidnamedkd/homebrew-sleeper/assets/65736142/1948161a-7cfc-4850-aa2f-e6eed2e431a0">


So I wrote some scripts to enable that more direct sleep function after inactivity.

The current default is 15 min (900 s) but you will see that you can customize this below.

## Advisory

Please note this is experimental software and an early version at that. You should always do your own research when running scripts. For questions and comments, please open an issue or email me at whomst (at) kevind (dot) xyz

## Table of Contents

- [Sleeper](#sleeper)
  - [Advisory](#advisory)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage (must follow)](#usage-must-follow)
  - [Customization](#customization)
  - [Uninstallation](#uninstallation)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Installation

To install Sleeper, you can use [Homebrew](https://brew.sh/):

1. Tap the repository:

  ```bash
   brew tap thekidnamedkd/sleeper
  ```

2. Install the app:

  ```bash
  brew install sleeper
  ```

## Usage (must follow)

After the installation, you can configure the application through the following steps:

1. Once Sleeper is installed, you can configure it by running the configuration script. To do this, navigate to the installation directory, which is typically:

  ```bash
  cd $(brew --prefix)/bin
  ```

2. Now, you can run the configuration script:

  ```bash
  ./sleeper_config.sh
  ```

3. Follow the prompts to customize your Sleeper settings, including idle time and other options. Note the following output regarding the following step.
   
4. Once you have completed the config you must add the process to your launch applications to run in the background automatically. Use this and see the notification regarding System Settings:

  ```bash
  launchctl load -w ~/Library/LaunchAgents/com.{USER_NAME}.sleeper.plist
  ```

Note: replace {USER_NAME} with the matching input from the config wizard.

## Customization

Customization
You can edit Sleeper's behavior later by rerunning the config script or plist file located in the installation directory:

1. Configuration Script:

  ```bash
  $(brew --prefix)/bin/sleeper_config.sh
  ```

2. Plist File:

  ```bash  
  $(brew --prefix)/opt/sleeper/libexec/sleeper_launch.plist
  ```

## Uninstallation

To uninstall Sleeper run the following:

  ```brew
  brew uninstall sleeper
  brew untap thekidnamed/homebrew-sleeper
  ```

## License

This project is licensed under the [MIT License](https://opensource.org/license/mit/).

## Acknowledgments

Special thanks to the Homebrew community for making installation and distribution easy.
