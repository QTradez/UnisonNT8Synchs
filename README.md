# Synchroniz NinjaTrader 8 files to all of your networked NT 8 instances

With NT 8 running under Windows, we've all experienced the problems that NT and OneDrive have.  This is tragic as it would otherwise provide a seamless way to get files both backed up offsite and changes applied to other systems running NT.

These scripts provide synchronization for adding new data to other instances of NT on your network and backing that data up to a cloud location in real-time.

This solution is dependent on Watchman, Unison, and a cloud filesharing application to respectively detect changes, perform the appropriate synchronisation, and create the off premesis backup of the data.

## Dependcies

[Watchman](https://facebook.github.io/watchman/)
Installs for Windows via Chocolatey.  In PowerShell use: 

```choco install watchman```

If you need Choclatey open a PowerShell termincal as Admin and use:

```Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))```

I had mixed results with this on some systems it worked on others it didn't.  For one system I had to get the install from the Chocalatey folder, dig through the zip file and the contents of the \bin folder to C:\ProgramData\chocolatey\bin.

[Unison](https://github.com/bcpierce00/unison) is avaliable through [cygwin](https://www.cygwin.com/) (site), [install](https://www.cygwin.com/setup-x86_64.exe).
We use cygwin to allow use the linux tool in the Windows environment.

When installing Cygwin you'll be asked where to install the packages folder.  Be sure this is subfolder of your cygwin installation.
Next you'll be asked to install packages.  You'll need bash, gcc, git, make, and unison packages.

Note that cygwin installed unison as unison-latest.exe.  This will cause watchman issue later on.  I had to make a copy of unison-latest.exe as unison.exe to get this solution to work.  I don't know how this will affect updates, but I'll update here if I run into issues.

Once you've performed the install confirm that your envirnoment variables have paths that can see the new tools.  I used PowerShell and checked versions.

I used the VS Code and GitHub CoPilot to build all of this.  I'm a novice PowerShell user and felt this was a good project to build my skills with both PS and AI code helpers.  I can confidently say that this would have taken much longer if I had to research issue I encountered; and there were lots of them.

## Links

The next condsideration is file and folder names.  Unison doesn't work with windows paths and filename with spaces.  No form of quote bounding worked.  So I created junction links to the folders that unison needed to work with that were free of spaces to get around this.  If you're unfamiliar with junctions here is the usage: 

mklink [[/d] | [/h] | [/j]] <link> <target>

More info at https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink

## Launch at Login

I set this up to launch at login with a Windows Task.  

This is a basic task I've included here in the repo.

Task name: Synch NT8 Cirtical Files
Action: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe   *- this is typical but may be different on your system*
Add Arguments: 
