---@meta

---@alias PluginName string


---@class ImportPluginConfig
local importConfig = {
  --- Name of the module to be imported.
  --- If this field is inside a table, all other keys inside such table will not be used
  --- @type string
  import = nil,
}

--- Adopted from lazy.nvim README.md
--- Check `:h lazy.nvim` for more information
--- @class PluginSpec
local pluginConfig = {
	--- A directory pointing to a local plugin
  --- @type string
	dir = nil,
	--- A custom git url where the plugin is hosted
  --- @type string
	url = nil,
	--- A custom name for the plugin used for the local plugin directory, and as the display name of the plugin
  --- @type string
	name = nil,
	--- If true, A local plugin directory will be used
  --- @type string
	dev = nil,
	--- If true, the plugin will only be loaded when necessary
  --- @type boolean
	lazy = nil,
	--- Specify if the plugin should be included in the spec
  --- @type boolean|fun():boolean
	enabled = nil,
	--- Specify condition for whether the plugin should be loaded (Useful for specifying plugins for VsCode/FireNvim) 
  --- @type boolean|fun():boolean
	cond = nil,
	--- List of plugin names or plugin specs that should be loaded when the plugin loads. 
  --- If you only specify the name, it will be installed and loaded with other(s) dependent plugins
  --- @type PluginConfig|string|(PluginConfig|string)[]
	dependencies = nil,
	--- Should be a table/returns a table of configuration option for a plugin. 
  ---     - If `opts` is a function, then it is a function that pass in the defaults opts table for that plugin from NvChad
  --- @type table|fun(opts: table): table
	opts = nil,
	--- What to do after plugin is loaded
  ---     - If `true`, then lazy will do `require(plugin_name).setup(opts)`, with `opts` is the table from the `opts` field (or nil if not defined)
  ---     - If `config` is a function with no arguments, run the function as is
  ---     - If `config` is a function with 2 arguments, the second argument will be the opts table that is NvChad's default config merged with the `opts` table in your config. The first argument is for internal use, it is not needed for general usage
  --- @type fun()|fun(self: PluginConfig, opts: table)|true
	config = nil,
	--- fun(self: PluginConfig) The function to be run during startup. This will run regardless of the plugin being loaded or not
	init = nil,
	--- Executed when a plugin is installed or updated. 
  ---     - If it's a string, it will be ran as a shell command. 
  ---     - When prefixed with `:` it will be considered a Neovim command.
  ---     - If it's a list of string, execute them in sequential. 
  ---     - If a function, then the function will be executed
  --- @type fun()|string|string[]
	build = nil,
	--- Specify branch of the Git repo to install/track for updates
  --- @type string
	branch = nil,
	--- Specify tag of the Git repo to install
  --- @type string
	tag = nil,
	--- Specify commit id for installation
  --- @type string
	commit = nil,
	--- A specific version to use from. Supports full [Semver](https://devhints.io/semver) ranges
  --- @type string,
	version = nil,
	--- If true, this plugin will not be updated
  --- @type boolean
	pin = nil,
  --- When false, submodules will not be fetched
  --- Defaults to true
  --- @type boolean
  submodules = true,
	--- Events that will trigger the loading of this plugin
  ---     - If it's a string/list of strings, the strings can be a simple VimEvent like `BufEnter`, or with patterns like `BufEnter *.vim`
  ---     - If a function, then the second argument of the function are the list of events that defined the loading of this plugin by NvChad
  --- Checkout `:h events`, `:h lsp-events`, `:h diagnostics-events` for the list of available events
  --- @type string|string[]|fun(self: PluginConfig, event: string[]): string[]
	event = nil,
	--- (List of) Ex command(s) that will trigger the loading of this plugin
  --- Also can be a function, with the second argument are the list of Ex command that defined the loading of this plugin by NvChad
  --- @type string|string[]|fun(self: PluginConfig, cmd: string[]): string[]
	cmd = nil,
	--- Files with types defined in this list will trigger the loading of this plugin
  ---     - If a function, then the second argument of the function are the list of filetypes that defined the loading of this plugin by NvChad
  --- @type string|string[]|fun(self: PluginConfig, ft:string[]): string[]
	ft = nil,
	--- Specify some sequence of keybinds that will load this plugin
  ---     - If a function, then the second argument of the function are the list of key sequences that defined the loading of this plugin by NvChad
  --- @type string|string[]|LazyKeymaps[]|fun(self: PluginConfig, keys: string[]): (string|LazyKeymaps)[]
	keys = nil,
	--- If specified, will not automatically load this Lua module when it's required by some other plugin(s)
  --- @type boolean
	module = nil,
	--- Only useful for **start** plugins to force loading order. Higher number means higher priority. Default priority is **50**
  --- @type integer
	priority = nil,
}


---@class PluginConfig: PluginSpec
---@field [1] string If the first field in the table is a string and not a key-value pair, it will be considered as the url for the plugin

---@alias NvPluginConfig PluginConfig | ImportPluginConfig

---Check `:h vim.keymap.set()` for more information
---@class LazyKeymaps
---@field [1] string lhs of the mapping. Must always exist
---@field [2]? string|fun()|false rhs. Can be a vimscript string or a Lua function
---@field desc? string
---@field mode? VimKeymapMode|VimKeymapMode[]
---@field noremap? boolean
---@field remap? boolean
---@field expr? boolean
---@field id string

