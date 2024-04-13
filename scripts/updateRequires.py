# Script to keep .darklua.json bundling and settings.json in sync.
# Does it really need a script? No, probably not...
import os, json

VSCODE_SETTINGS_JSON = ".vscode/settings.json"
REQUIRE_FILES = "requires"
DARKLUA_JSON = ".darklua.json"

# with open(DARKLUA_JSON, "r") as file:
#     darklua_dump  = json.dump(file)

def main():
    requires = os.listdir(REQUIRE_FILES)

    darklua_output = {
        "bundle": {
            "require_mode": {
                "name": "path",
            },
            "excludes": []
        },
        "rules": []
    }

    vscode_settings_output = {
        "luau-lsp.sourcemap.enabled": False,
        "luau-lsp.types.roblox": True,
        "luau-lsp.types.definitionFiles": ["./build/pilot.d.lua"],
        "luau-lsp.require.fileAliases": {
        }
    }

    for file_name in requires:
        name_without_ext = os.path.splitext(file_name)[0]
        darklua_output["bundle"]["excludes"].append(name_without_ext)

        vscode_settings_output["luau-lsp.require.fileAliases"][name_without_ext] = f"requires/{file_name}"

    print(json.dumps(vscode_settings_output, indent=4))

    with open(DARKLUA_JSON, "w") as file:
        json.dump(darklua_output, file, indent=4)

    with open(VSCODE_SETTINGS_JSON, "w") as file:
        json.dump(vscode_settings_output, file, indent=4)


if __name__ == "__main__":
    main()