--!strict

export type StackAllocation<T = any> = 
{
	[number]: T,

	pack: (self: StackAllocation<T>, first: number?, last: number?) -> { n: number, [number]: T },
	unpack: (self: StackAllocation<T>, first: number?, last: number?) -> ...T,
	clear: (self: StackAllocation<T>, first: number, last: number) -> (),
}

-- Callable Macros ------------------------------------------------------------

declare function LPH_ENCSTR(toEncrypt: string, key: (string | number)?, keyExpression: any?): string
declare function LPH_STRENC(toEncrypt: string, key: (string | number)?, keyExpression: any?): string

declare function LPH_ENCBUF(toEncrypt: string, key: (string | number)?, keyExpression: any?): buffer
declare function LPH_BUFENC(toEncrypt: string, key: (string | number)?, keyExpression: any?): buffer

declare function LPH_ENCNUM(toEncrypt: number, keyTable: { [any]: number }?): number
declare function LPH_NUMENC(toEncrypt: number, keyTable: { [any]: number }?): number

declare function LPH_CRASH(): ()

declare function LPH_STACKALLOC(size: number, indexBase: number?): StackAllocation<any>

declare function LPH_PRECHECK(check: () -> (number | { number }), expectedKey: number | { number }): ()

-- Value Macros ---------------------------------------------------------------

declare LPH_OBFUSCATED: boolean
declare LPH_LINE: number
declare LPH_VERSION: number

-- Attribute Values ------------------------------------------------------------

export type LuraphAttribute = any

export type VM = { read __vm: never }
export type Preset = { read __preset: never }
export type Transform = { read __transform: never }
export type ExtractTarget = { read __extractTarget: never }
                    
declare FAST: Preset
declare BALANCED: Preset
declare SECURE: Preset

declare NONE: VMKind
declare OPAL: VMKind
declare ONYX: VMKind

declare EXTRACT: Transform & ((...ExtractTarget) -> Transform)

declare CONTROL_FLOW: Transform & ((enabled: boolean) -> Transform)
declare REWRITE_NAMECALLS: Transform & ((enabled: boolean) -> Transform)

declare CONSTANTS: ExtractTarget
declare GLOBALS: ExtractTarget

-- Attributes -----------------------------------------------------------------

declare function LPH_ATTRIBUTES(...: LuraphAttribute): ()

declare function ENCRYPT(key: string | number | { number }, expression: any): LuraphAttribute

declare function VM(kind: VM): LuraphAttribute
declare function PRESET(preset: Preset): LuraphAttribute
declare function OPTIMIZE(level: number): LuraphAttribute
declare function ERROR_HANDLING(enabled: boolean): LuraphAttribute

declare function UNROLL(checked: boolean?): LuraphAttribute
declare function INLINE(checked: boolean?): LuraphAttribute

declare function TRANSFORM(kind: Transform): LuraphAttribute

declare NO_UPVALUES: LuraphAttribute