# Start Watchman for the first directory
watchman watch C:/Users/daqu4/NT8Working/templates

# Set up Watchman trigger for the first directory
$trigger1 = @"
[
  "trigger",
  "C:/Users/daqu4/NT8Working/templates",
  {
    "name": "sync-trigger1",
    "expression": ["anyof", ["match", "*"]],
    "command": ["unison", "Aw2NetBkUpTmplts"]
  }
]
"@
$trigger1 | watchman -j

# Start Watchman for the second directory
watchman watch C:/Users/daqu4/NT8Working/workspaces

# Set up Watchman trigger for the second directory
$trigger2 = @"
[
  "trigger",
  "C:/Users/daqu4/NT8Working/workspaces",
  {
    "name": "sync-trigger2",
    "expression": ["anyof", ["match", "*"]],
    "command": ["unison", "Aw2NetBkUpWkspc"]
  }
]
"@
$trigger2 | watchman -j

# Start Watchman for the third directory
watchman watch C:/Users/daqu4/NT8Working/workspaces

# Set up Watchman trigger for the second directory
$trigger3 = @"
[
  "trigger",
  "C:/Users/daqu4/NT8Working/db/minute",
  {
    "name": "sync-trigger3",
    "expression": ["anyof", ["match", "*"]],
    "command": ["unison", "Aw2NetBkUpDbMin"]
  }
]
"@
$trigger3 | watchman -j

# Start Watchman for the fourth directory
watchman watch C:/Users/daqu4/NT8Working/workspaces

# Set up Watchman trigger for the second directory
$trigger4 = @"
[
  "trigger",
  "C:/Users/daqu4/NT8Working/db/replay",
  {
    "name": "sync-trigger4",
    "expression": ["anyof", ["match", "*"]],
    "command": ["unison", "Aw2NetBkUpDbReplay"]
  }
]
"@
$trigger4 | watchman -j