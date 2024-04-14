import os
import sys
import json
from generatePartDefinitions import PartDefinitionsGenerator

class DefinitionsGenerator():
    pass

def main():
    if len(sys.argv) < 2:
        print("Error: Project directory must be passed in as a command-line argument.")
        exit(1)
    project = sys.argv[1]
    license_file = os.path.join(project, "LICENSE")
    globals_file = os.path.join(project, "globals.d.lua")
    types_file = os.path.join(project, "types.d.lua")
    parts_file = os.path.join(project, "parts.json")
    output_file = os.path.join(project, "build", "pilot.d.lua")
    # Generate header comment
    header_content = "--[[\n"
    with open(license_file, 'r') as fr:
        for line in fr.readlines():
            header_content += f"  {line}"
    header_content += "\n  https://github.com/flxwed/autopilot.lua/\n--]]\n"
    # Generate types
    content = ""
    with open(types_file, 'r') as fr:
        content += fr.read().strip() + "\n"
    # Get parts data
    parts_data = None
    with open(parts_file, 'r') as fr:
        parts_data = json.load(fr)
    # Generate parts
    part_generator = PartDefinitionsGenerator(parts_data)
    content += "-- Part Types\n"
    content += part_generator.generate().strip() + "\n"

    # Add require types so globals can access their types TODO: There may be a better way to do this
    # Pretty much nothing but RawFileSystem requires this (since it needs fs) but maybe other globals will too
    for file_name in os.listdir("./requires"):
        with open(os.path.join("./requires", file_name)) as fr:
            lines = fr.readlines()

            # Weird way of removing the return statement from the files
            content += "".join(lines[:-1]).strip() + "\n"

    # Generate globals
    with open(globals_file, 'r') as fr:
        content += fr.read().strip() + "\n"
    # Generate port globals
    content += "-- Port-related microcontroller globals\n"
    single_overloads = []
    multi_overloads = []
    for part, _ in parts_data.items():
        if part == part_generator.default_part_name:
            continue
        single_overloads.append(f"((port: PilotLuaPortLike, partType: \"{part}\") -> PilotLua{part})")
        multi_overloads.append(f"((port: PilotLuaPortLike, partType: \"{part}\") -> {{PilotLua{part}}})")
    single_overloads.append(f"((port: PilotLuaPortLike, partType: PilotLuaPartList | string) -> PilotLua{part_generator.default_part_name})")

    # uhh it works -- sweetboss151 1/6/2024
    multi_overloads.append(f"((port: PilotLuaPortLike, partType: PilotLuaPartList | string) -> {{{'PilotLua' + part_generator.default_part_name}}})")
    sep = '\n    & '
    content += f"declare GetPartFromPort: {sep.join(single_overloads)}\n"
    content += f"declare GetPartsFromPort: {sep.join(multi_overloads)}\n"
    # Finalize
    content = content.strip().replace("\n\n", "\n") + "\n"
    if not os.path.isdir(os.path.join(project, "build")):
        os.makedirs(os.path.join(project, "build"))
    with open(output_file, 'w+') as fw:
        fw.write(header_content + "\n" + content)
        print(f"{output_file} created successfully")

if __name__ == "__main__":
    main()
