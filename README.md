# Luraph/macrosdk

Macro SDK with function stubs for all Luraph macros to allow Lua scripts to remain functional while unobfuscated (eg: during development).

*The official [Luraph macros documentation](https://lura.ph/dashboard/documents/macros) contains the most up-to-date and complete information and instructions for utilization of Luraph macros.*

**You should load this script using an HTTP(S) request and `loadstring` to ensure you always have the latest definitions.** If offline development is needed, you may embed the [SDK source file](luraphsdk.lua) directly into your script; however, you must ensure to update this file when newer versions of Luraph are released.

## Instructions

1. Call the HTTP request function on your Lua platform with the URL pointing [here](luraphsdk.lua?raw=true).
2. Send the response body to `load` (Lua 5.2+), `loadstring` (Lua 5.1, Luau), or an equivalent function that allows scripts to be loaded.

<sub>Current URL: https://raw.githubusercontent.com/Luraph/macrosdk/main/luraphsdk.lua</sub>

## Examples

These snippets should be placed at the top of your script, or before the usage of any Luraph macros.

#### Roblox (**with `game:HttpGet` and `loadstring`**)

```lua
if not LPH_OBFUSCATED then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Luraph/macrosdk/main/luraphsdk.lua"))()
end
```

#### Roblox (**with `HttpService` and `loadstring`**)

```lua
if not LPH_OBFUSCATED then
    loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/Luraph/macrosdk/main/luraphsdk.lua"))()
end
```

#### FiveM (**with `PerformHttpRequest` and `load`**)
```lua
if not LPH_OBFUSCATED then
    PerformHttpRequest("https://raw.githubusercontent.com/Luraph/macrosdk/main/luraphsdk.lua", function(errCode, res, headers, errData)
        load(res)()
    end)
end
```

## Help! I don't see any examples for my platform here!

Please open an [issue](https://github.com/Luraph/macrosdk/issues), and we'll add your platform.

## Help! My environment does not have `load`/`loadstring`

Please open a ticket on our [Discord server](https://discord.lura.ph), and we'll add this functionality if it's requested.

## Useful Links
- [Visit the Luraph Website](https://lura.ph/ "Luraph - Online Lua Obfuscation")
- [Join the Luraph Discord](https://discord.lura.ph/ "Luraph Discord Server")
- [Read the Luraph Documentation](https://lura.ph/dashboard/documents "Luraph Documentation")
- [Read the Luraph FAQs](https://lura.ph/dashboard/faq "Luraph Frequently Asked Questions")