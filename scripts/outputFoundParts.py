# Simple script that outputs the current parts as a lua table array. This is used for the MBTools part scraper in roblox studio.
import sys
import os
import json

if len(sys.argv) < 2:
    print("Error: Project directory must be passed in as a command-line argument.")
    exit(1)
    
project = sys.argv[1]
parts_json = os.path.join(project, "parts.json")

content = "local foundParts = {"

with open(parts_json, "r") as file:
    parts: dict[str, dict] = json.load(file)
    
    for part_name in parts.keys():
        content += f'"{part_name}", '
        
        
content += "}"

with open(os.path.join("build", "parts.lua"), "w") as file:
    file.write(content)