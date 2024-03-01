# PowerShell / watchman / unison solution for synchronizing NinjaTrader 8 files to all of your NT 8 instances.

With NT 8 running under Windows, we've all experienced the problems that NT and OneDrive have.  This is tragic as it would otherwise provide a seamless way to get files both backed up offsite and changes applied to other systems running NT.

These scripts provide synchronization for adding new data to the cloud location and pulling that same data to other systems to use almost in real-time.

They are dependent on Watchman and Unison to respectively detect changes and perform the appropriate synchronisation.

Watchman info: https://facebook.github.io/watchman/
Install for Windows via Chocolatey.  Use: choco install watchman

Unison is avaliable through Gygwin https://www.cygwin.com/ install - https://www.cygwin.com/setup-x86_64.exe

When installing Cygwin you'll be asked where to install the packages folder.  Be sure this is subfolder of your cygwin installation.
Next you'll be asked to install packages.  You'll need bash, gcc, git, make, and unison packages.

Note that cygwin installed unison as unison-latest.exe.  This will cause watchman issue later on.  I had to make a copy of unison-latest.exe as unison.exe to get this solution to work.  I don't know how this will affect updates, but I'll update here if I run into issues.

Once you've performed the install confirm that your envirnoment variables have paths that can see the new tools.  I used PowerShell and checked versions.

I used the VS Code and GitHub CoPilot to build all of this.  I'm a novice PowerShell user and felt this was a good project to build my skills with both PS and AI code helpers.  I can confidently say that this would have taken much longer if I had to research issue I encountered; and there were lots of them.

The next condsideration is file and folder names.  Unison doesn't work with windows paths and filename with spaces.  No form of quote bounding worked.  So I created junction links to the folders that unison needed to work with that were free of spaces to get around this.  If you're unfamiliar with junctions here is the usage: 

mklink [[/d] | [/h] | [/j]] <link> <target>

More info at https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/mklink

