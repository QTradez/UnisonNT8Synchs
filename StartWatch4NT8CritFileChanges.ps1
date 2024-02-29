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
    "command": ["unison", "Aw2NetBkUp"]
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
    "command": ["unison", "Aw2NetBkUp"]
  }
]
"@
$trigger2 | watchman -j