--!strict

export type StackAllocation<T = any> = 
{
	[number]: T,

	pack: (self: StackAllocation<T>, first: number?, last: number?) -> { n: number, [number]: T },
	unpack: (self: StackAllocation<T>, first: number?, last: number?) -> ...T,
	clear: (self: StackAllocation<T>, first: number, last: number) -> (),
}

-- Callable Macros ------------------------------------------------------------

declare LPH_ENCSTR: ((toEncrypt: string) -> string) & ((toEncrypt: string, key: (number | string), expression: any) -> string)
declare LPH_STRENC: typeof(LPH_ENCSTR)

declare LPH_ENCBUF: ((toEncrypt: string) -> buffer) & ((toEncrypt: string, key: (number | string), expression: any) -> buffer)
declare LPH_BUFENC: typeof(LPH_ENCBUF)

declare LPH_ENCNUM: ((toEncrypt: number) -> number) & ((toEncrypt: number, keyTable: { [any]: number }) -> number)
declare LPH_NUMENC: typeof(LPH_ENCNUM)

declare function LPH_CRASH(): ()

declare function LPH_STACKALLOC(size: number, indexBase: number?): StackAllocation<any>

declare function LPH_PRECHECK(check: () -> (number | { number }), expectedKey: number | { number }): ()

declare function LPH_REWRITE(expression: number, options: (string | { preset: string?, budget: string?, context: { any }? })?): number

declare function LPH_ASSUME<T>(expression: T, expected: T): T

-- Value Macros ---------------------------------------------------------------

declare LPH_OBFUSCATED: boolean
declare LPH_LINE: number
declare LPH_VERSION: number

-- Attribute Values ------------------------------------------------------------

export type LuraphAttribute = any

export type VM = any
export type Preset = any
export type Transform = any
export type ExtractTarget = any

declare FAST: Preset
declare BALANCED: Preset
declare SECURE: Preset

declare NONE: VM
declare OPAL: VM
declare ONYX: VM

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
