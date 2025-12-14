-- Set highlights for tailwindcss
-- bg-*	Sets the background color of an element
-- text-*	Sets the text color of an element
-- decoration-*	Sets the text decoration color of an element
-- border-*	Sets the border color of an element
-- outline-*	Sets the outline color of an element
-- shadow-*	Sets the color of box shadows
-- inset-shadow-*	Sets the color of inset box shadows
-- ring-*	Sets the color of ring shadows
-- inset-ring-*	Sets the color of inset ring shadows
-- accent-*	Sets the accent color of form controls
-- caret-*	Sets the caret color in form controls
-- fill-*	Sets the fill color of SVG elements
-- stroke-*	Sets the stroke color of SVG elements

-- red
-- orange
-- amber
-- yellow
-- lime
-- green
-- emerald
-- teal
-- cyan
-- sky
-- blue
-- indigo
-- violet
-- purple
-- fuchsia
-- pink
-- rose
-- slate
-- gray
-- zinc
-- neutral
-- stone

local cssColorPrefix = {
  "bg-",
  "text-",
  "decoration-",
  "border-",
  "outline-",
  "shadow-",
  "inset-",
  "ring-",
  "inset-",
  "accent-",
  "caret-",
  "fill-",
  "stroke-",
}
local cssColors = {
  ["red-50"] = { "TWCssRed50", "#fef2f2" },
  ["red-100"] = { "TWCssRed100", "#fee2e2" },
  ["red-200"] = { "TWCssRed200", "#fecaca" },
  ["red-300"] = { "TWCssRed300", "#fca5a5" },
  ["red-400"] = { "TWCssRed400", "#f87171" },
  ["red-500"] = { "TWCssRed500", "#ef4444" },
  ["red-600"] = { "TWCssRed600", "#dc2626" },
  ["red-700"] = { "TWCssRed700", "#b91c1c" },
  ["red-800"] = { "TWCssRed800", "#991b1b" },
  ["red-900"] = { "TWCssRed900", "#7f1d1d" },
  ["red-950"] = { "TWCssRed950", "#450a0a" },
  ["orange-50"] = { "TWCssOrange50", "#fff7ed" },
  ["orange-100"] = { "TWCssOrange100", "#ffedd5" },
  ["orange-200"] = { "TWCssOrange200", "#fed7aa" },
  ["orange-300"] = { "TWCssOrange300", "#fdba74" },
  ["orange-400"] = { "TWCssOrange400", "#fb923c" },
  ["orange-500"] = { "TWCssOrange500", "#f97316" },
  ["orange-600"] = { "TWCssOrange600", "#ea580c" },
  ["orange-700"] = { "TWCssOrange700", "#c2410c" },
  ["orange-800"] = { "TWCssOrange800", "#9a3412" },
  ["orange-900"] = { "TWCssOrange900", "#7c2d12" },
  ["orange-950"] = { "TWCssOrange950", "#431407" },
  ["amber-50"] = { "TWCssAmber50", "#fffbeb" },
  ["amber-100"] = { "TWCssAmber100", "#fef3c7" },
  ["amber-200"] = { "TWCssAmber200", "#fde68a" },
  ["amber-300"] = { "TWCssAmber300", "#fcd34d" },
  ["amber-400"] = { "TWCssAmber400", "#fbbf24" },
  ["amber-500"] = { "TWCssAmber500", "#f59e0b" },
  ["amber-600"] = { "TWCssAmber600", "#d97706" },
  ["amber-700"] = { "TWCssAmber700", "#b45309" },
  ["amber-800"] = { "TWCssAmber800", "#92400e" },
  ["amber-900"] = { "TWCssAmber900", "#78350f" },
  ["amber-950"] = { "TWCssAmber950", "#451a03" },
  ["yellow-50"] = { "TWCssYellow50", "#fefce8" },
  ["yellow-100"] = { "TWCssYellow100", "#fef9c3" },
  ["yellow-200"] = { "TWCssYellow200", "#fef08a" },
  ["yellow-300"] = { "TWCssYellow300", "#fde047" },
  ["yellow-400"] = { "TWCssYellow400", "#facc15" },
  ["yellow-500"] = { "TWCssYellow500", "#eab308" },
  ["yellow-600"] = { "TWCssYellow600", "#ca8a04" },
  ["yellow-700"] = { "TWCssYellow700", "#a16207" },
  ["yellow-800"] = { "TWCssYellow800", "#854d0e" },
  ["yellow-900"] = { "TWCssYellow900", "#713f12" },
  ["yellow-950"] = { "TWCssYellow950", "#422006" },
  ["lime-50"] = { "TWCssLime50", "#f7fee7" },
  ["lime-100"] = { "TWCssLime100", "#ecfccb" },
  ["lime-200"] = { "TWCssLime200", "#d9f99d" },
  ["lime-300"] = { "TWCssLime300", "#bef264" },
  ["lime-400"] = { "TWCssLime400", "#a3e635" },
  ["lime-500"] = { "TWCssLime500", "#84cc16" },
  ["lime-600"] = { "TWCssLime600", "#65a30d" },
  ["lime-700"] = { "TWCssLime700", "#4d7c0f" },
  ["lime-800"] = { "TWCssLime800", "#3f6212" },
  ["lime-900"] = { "TWCssLime900", "#365314" },
  ["lime-950"] = { "TWCssLime950", "#1a2e05" },
  ["green-50"] = { "TWCssGreen50", "#f0fdf4" },
  ["green-100"] = { "TWCssGreen100", "#dcfce7" },
  ["green-200"] = { "TWCssGreen200", "#bbf7d0" },
  ["green-300"] = { "TWCssGreen300", "#86efac" },
  ["green-400"] = { "TWCssGreen400", "#4ade80" },
  ["green-500"] = { "TWCssGreen500", "#22c55e" },
  ["green-600"] = { "TWCssGreen600", "#16a34a" },
  ["green-700"] = { "TWCssGreen700", "#15803d" },
  ["green-800"] = { "TWCssGreen800", "#166534" },
  ["green-900"] = { "TWCssGreen900", "#14532d" },
  ["green-950"] = { "TWCssGreen950", "#052e16" },
  ["emerald-50"] = { "TWCssEmerald50", "#ecfdf5" },
  ["emerald-100"] = { "TWCssEmerald100", "#d1fae5" },
  ["emerald-200"] = { "TWCssEmerald200", "#a7f3d0" },
  ["emerald-300"] = { "TWCssEmerald300", "#6ee7b7" },
  ["emerald-400"] = { "TWCssEmerald400", "#34d399" },
  ["emerald-500"] = { "TWCssEmerald500", "#10b981" },
  ["emerald-600"] = { "TWCssEmerald600", "#059669" },
  ["emerald-700"] = { "TWCssEmerald700", "#047857" },
  ["emerald-800"] = { "TWCssEmerald800", "#065f46" },
  ["emerald-900"] = { "TWCssEmerald900", "#064e3b" },
  ["emerald-950"] = { "TWCssEmerald950", "#022c22" },
  ["teal-50"] = { "TWCssTeal50", "#f0fdfa" },
  ["teal-100"] = { "TWCssTeal100", "#ccfbf1" },
  ["teal-200"] = { "TWCssTeal200", "#99f6e4" },
  ["teal-300"] = { "TWCssTeal300", "#5eead4" },
  ["teal-400"] = { "TWCssTeal400", "#2dd4bf" },
  ["teal-500"] = { "TWCssTeal500", "#14b8a6" },
  ["teal-600"] = { "TWCssTeal600", "#0d9488" },
  ["teal-700"] = { "TWCssTeal700", "#0f766e" },
  ["teal-800"] = { "TWCssTeal800", "#115e59" },
  ["teal-900"] = { "TWCssTeal900", "#134e4a" },
  ["teal-950"] = { "TWCssTeal950", "#042f2e" },
  ["cyan-50"] = { "TWCssCyan50", "#ecfeff" },
  ["cyan-100"] = { "TWCssCyan100", "#cffafe" },
  ["cyan-200"] = { "TWCssCyan200", "#a5f3fc" },
  ["cyan-300"] = { "TWCssCyan300", "#67e8f9" },
  ["cyan-400"] = { "TWCssCyan400", "#22d3ee" },
  ["cyan-500"] = { "TWCssCyan500", "#06b6d4" },
  ["cyan-600"] = { "TWCssCyan600", "#0891b2" },
  ["cyan-700"] = { "TWCssCyan700", "#0e7490" },
  ["cyan-800"] = { "TWCssCyan800", "#155e75" },
  ["cyan-900"] = { "TWCssCyan900", "#164e63" },
  ["cyan-950"] = { "TWCssCyan950", "#083344" },
  ["sky-50"] = { "TWCssSky50", "#f0f9ff" },
  ["sky-100"] = { "TWCssSky100", "#e0f2fe" },
  ["sky-200"] = { "TWCssSky200", "#bae6fd" },
  ["sky-300"] = { "TWCssSky300", "#7dd3fc" },
  ["sky-400"] = { "TWCssSky400", "#38bdf8" },
  ["sky-500"] = { "TWCssSky500", "#0ea5e9" },
  ["sky-600"] = { "TWCssSky600", "#0284c7" },
  ["sky-700"] = { "TWCssSky700", "#0369a1" },
  ["sky-800"] = { "TWCssSky800", "#075985" },
  ["sky-900"] = { "TWCssSky900", "#0c4a6e" },
  ["sky-950"] = { "TWCssSky950", "#082f49" },
  ["blue-50"] = { "TWCssBlue50", "#eff6ff" },
  ["blue-100"] = { "TWCssBlue100", "#dbeafe" },
  ["blue-200"] = { "TWCssBlue200", "#bfdbfe" },
  ["blue-300"] = { "TWCssBlue300", "#93c5fd" },
  ["blue-400"] = { "TWCssBlue400", "#60a5fa" },
  ["blue-500"] = { "TWCssBlue500", "#3b82f6" },
  ["blue-600"] = { "TWCssBlue600", "#2563eb" },
  ["blue-700"] = { "TWCssBlue700", "#1d4ed8" },
  ["blue-800"] = { "TWCssBlue800", "#1e40af" },
  ["blue-900"] = { "TWCssBlue900", "#1e3a8a" },
  ["blue-950"] = { "TWCssBlue950", "#172554" },
  ["indigo-50"] = { "TWCssIndigo50", "#eef2ff" },
  ["indigo-100"] = { "TWCssIndigo100", "#e0e7ff" },
  ["indigo-200"] = { "TWCssIndigo200", "#c7d2fe" },
  ["indigo-300"] = { "TWCssIndigo300", "#a5b4fc" },
  ["indigo-400"] = { "TWCssIndigo400", "#818cf8" },
  ["indigo-500"] = { "TWCssIndigo500", "#6366f1" },
  ["indigo-600"] = { "TWCssIndigo600", "#4f46e5" },
  ["indigo-700"] = { "TWCssIndigo700", "#4338ca" },
  ["indigo-800"] = { "TWCssIndigo800", "#3730a3" },
  ["indigo-900"] = { "TWCssIndigo900", "#312e81" },
  ["indigo-950"] = { "TWCssIndigo950", "#1e1b4b" },
  ["violet-50"] = { "TWCssViolet50", "#f5f3ff" },
  ["violet-100"] = { "TWCssViolet100", "#ede9fe" },
  ["violet-200"] = { "TWCssViolet200", "#ddd6fe" },
  ["violet-300"] = { "TWCssViolet300", "#c4b5fd" },
  ["violet-400"] = { "TWCssViolet400", "#a78bfa" },
  ["violet-500"] = { "TWCssViolet500", "#8b5cf6" },
  ["violet-600"] = { "TWCssViolet600", "#7c3aed" },
  ["violet-700"] = { "TWCssViolet700", "#6d28d9" },
  ["violet-800"] = { "TWCssViolet800", "#5b21b6" },
  ["violet-900"] = { "TWCssViolet900", "#4c1d95" },
  ["violet-950"] = { "TWCssViolet950", "#2e1065" },
  ["purple-50"] = { "TWCssPurple50", "#faf5ff" },
  ["purple-100"] = { "TWCssPurple100", "#f3e8ff" },
  ["purple-200"] = { "TWCssPurple200", "#e9d5ff" },
  ["purple-300"] = { "TWCssPurple300", "#d8b4fe" },
  ["purple-400"] = { "TWCssPurple400", "#c084fc" },
  ["purple-500"] = { "TWCssPurple500", "#a855f7" },
  ["purple-600"] = { "TWCssPurple600", "#9333ea" },
  ["purple-700"] = { "TWCssPurple700", "#7e22ce" },
  ["purple-800"] = { "TWCssPurple800", "#6b21a8" },
  ["purple-900"] = { "TWCssPurple900", "#581c87" },
  ["purple-950"] = { "TWCssPurple950", "#3b0764" },
  ["fuchsia-50"] = { "TWCssFuchsia50", "#fdf4ff" },
  ["fuchsia-100"] = { "TWCssFuchsia100", "#fae8ff" },
  ["fuchsia-200"] = { "TWCssFuchsia200", "#f5d0fe" },
  ["fuchsia-300"] = { "TWCssFuchsia300", "#f0abfc" },
  ["fuchsia-400"] = { "TWCssFuchsia400", "#e879f9" },
  ["fuchsia-500"] = { "TWCssFuchsia500", "#d946ef" },
  ["fuchsia-600"] = { "TWCssFuchsia600", "#c026d3" },
  ["fuchsia-700"] = { "TWCssFuchsia700", "#a21caf" },
  ["fuchsia-800"] = { "TWCssFuchsia800", "#86198f" },
  ["fuchsia-900"] = { "TWCssFuchsia900", "#701a75" },
  ["fuchsia-950"] = { "TWCssFuchsia950", "#4a044e" },
  ["pink-50"] = { "TWCssPink50", "#fdf2f8" },
  ["pink-100"] = { "TWCssPink100", "#fce7f3" },
  ["pink-200"] = { "TWCssPink200", "#fbcfe8" },
  ["pink-300"] = { "TWCssPink300", "#f9a8d4" },
  ["pink-400"] = { "TWCssPink400", "#f472b6" },
  ["pink-500"] = { "TWCssPink500", "#ec4899" },
  ["pink-600"] = { "TWCssPink600", "#db2777" },
  ["pink-700"] = { "TWCssPink700", "#be185d" },
  ["pink-800"] = { "TWCssPink800", "#9d174d" },
  ["pink-900"] = { "TWCssPink900", "#831843" },
  ["pink-950"] = { "TWCssPink950", "#500724" },
  ["rose-50"] = { "TWCssRose50", "#fff1f2" },
  ["rose-100"] = { "TWCssRose100", "#ffe4e6" },
  ["rose-200"] = { "TWCssRose200", "#fecdd3" },
  ["rose-300"] = { "TWCssRose300", "#fda4af" },
  ["rose-400"] = { "TWCssRose400", "#fb7185" },
  ["rose-500"] = { "TWCssRose500", "#f43f5e" },
  ["rose-600"] = { "TWCssRose600", "#e11d48" },
  ["rose-700"] = { "TWCssRose700", "#be123c" },
  ["rose-800"] = { "TWCssRose800", "#9f1239" },
  ["rose-900"] = { "TWCssRose900", "#881337" },
  ["rose-950"] = { "TWCssRose950", "#4c0519" },
  ["slate-50"] = { "TWCssSlate50", "#f8fafc" },
  ["slate-100"] = { "TWCssSlate100", "#f1f5f9" },
  ["slate-200"] = { "TWCssSlate200", "#e2e8f0" },
  ["slate-300"] = { "TWCssSlate300", "#cbd5e1" },
  ["slate-400"] = { "TWCssSlate400", "#94a3b8" },
  ["slate-500"] = { "TWCssSlate500", "#64748b" },
  ["slate-600"] = { "TWCssSlate600", "#475569" },
  ["slate-700"] = { "TWCssSlate700", "#334155" },
  ["slate-800"] = { "TWCssSlate800", "#1e293b" },
  ["slate-900"] = { "TWCssSlate900", "#0f172a" },
  ["slate-950"] = { "TWCssSlate950", "#020617" },
  ["gray-50"] = { "TWCssGray50", "#f9fafb" },
  ["gray-100"] = { "TWCssGray100", "#f3f4f6" },
  ["gray-200"] = { "TWCssGray200", "#e5e7eb" },
  ["gray-300"] = { "TWCssGray300", "#d1d5db" },
  ["gray-400"] = { "TWCssGray400", "#9ca3af" },
  ["gray-500"] = { "TWCssGray500", "#6b7280" },
  ["gray-600"] = { "TWCssGray600", "#4b5563" },
  ["gray-700"] = { "TWCssGray700", "#374151" },
  ["gray-800"] = { "TWCssGray800", "#1f2937" },
  ["gray-900"] = { "TWCssGray900", "#111827" },
  ["gray-950"] = { "TWCssGray950", "#030712" },
  ["zinc-50"] = { "TWCssZinc50", "#fafafa" },
  ["zinc-100"] = { "TWCssZinc100", "#f4f4f5" },
  ["zinc-200"] = { "TWCssZinc200", "#e4e4e7" },
  ["zinc-300"] = { "TWCssZinc300", "#d4d4d8" },
  ["zinc-400"] = { "TWCssZinc400", "#a1a1aa" },
  ["zinc-500"] = { "TWCssZinc500", "#71717a" },
  ["zinc-600"] = { "TWCssZinc600", "#52525b" },
  ["zinc-700"] = { "TWCssZinc700", "#3f3f46" },
  ["zinc-800"] = { "TWCssZinc800", "#27272a" },
  ["zinc-900"] = { "TWCssZinc900", "#18181b" },
  ["zinc-950"] = { "TWCssZinc950", "#09090b" },
  ["neutral-50"] = { "TWCssNeutral50", "#fafafa" },
  ["neutral-100"] = { "TWCssNeutral100", "#f5f5f5" },
  ["neutral-200"] = { "TWCssNeutral200", "#e5e5e5" },
  ["neutral-300"] = { "TWCssNeutral300", "#d4d4d4" },
  ["neutral-400"] = { "TWCssNeutral400", "#a3a3a3" },
  ["neutral-500"] = { "TWCssNeutral500", "#737373" },
  ["neutral-600"] = { "TWCssNeutral600", "#525252" },
  ["neutral-700"] = { "TWCssNeutral700", "#404040" },
  ["neutral-800"] = { "TWCssNeutral800", "#262626" },
  ["neutral-900"] = { "TWCssNeutral900", "#171717" },
  ["neutral-950"] = { "TWCssNeutral950", "#0a0a0a" },
  ["stone-50"] = { "TWCssStone50", "#fafaf9" },
  ["stone-100"] = { "TWCssStone100", "#f5f5f4" },
  ["stone-200"] = { "TWCssStone200", "#e7e5e4" },
  ["stone-300"] = { "TWCssStone300", "#d6d3d1" },
  ["stone-400"] = { "TWCssStone400", "#a8a29e" },
  ["stone-500"] = { "TWCssStone500", "#78716c" },
  ["stone-600"] = { "TWCssStone600", "#57534e" },
  ["stone-700"] = { "TWCssStone700", "#44403c" },
  ["stone-800"] = { "TWCssStone800", "#292524" },
  ["stone-900"] = { "TWCssStone900", "#1c1917" },
  ["stone-950"] = { "TWCssStone950", "#0c0a09" },
}

for _, v in pairs(cssColors) do
  vim.api.nvim_set_hl(0, v[1], { fg = v[2] })
end

return { -- Autocompletion
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  -- Warning if not build/downloaded. Not sure why it doesn't download automatically
  -- See blink.cmp manual for copying prebuilt
  --
  -- `$data/lazy/blink.cmp/target/release/libblink_cmp_fuzzy.$ext`. Get the `$data`
  -- path via `:echo stdpath('data')`. Use `.so` for linux, `.dylib` for mac, and
  -- https://cmp.saghen.dev/installation#lazy-nvim
  -- build = "cargo build --release",
  dependencies = {
    -- Snippet Engine
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          "rafamadriz/friendly-snippets",
          config = function()
            -- require('luasnip.loaders.from_vscode').lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "go" } })
            require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
          end,
        },
      },
      opts = {},
    },
    "folke/lazydev.nvim",
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- 'default' (recommended) for mappings similar to built-in completions
      --   <c-y> to accept ([y]es) the completion.
      --    This will auto-import if your LSP supports it.
      --    This will expand snippets if the LSP sent a snippet.
      -- 'super-tab' for tab to accept
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- For an understanding of why the 'default' preset is recommended,
      -- you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      --
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      preset = "default",
      ["<C-s>"] = { "show", "show_documentation", "hide_documentation" },

      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      menu = {
        border = "rounded",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", "label", "label_description", gap = 1 },
            { "kind" },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                if ctx.item.client_name == "tailwindcss" then
                  -- completition symbol
                  -- print(ctx.label)
                  -- Color
                  -- print(ctx.kind)
                  -- Coloring is done in highlight
                  return " "
                end
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                if ctx.item.client_name == "tailwindcss" and ctx.kind == "Color" then
                  -- For anything color. We check if '/' (opacity) exists
                  local slash_pos = string.find(ctx.label, "/")
                  local left_side = ctx.label
                  if slash_pos then
                    left_side = string.sub(ctx.label, 1, slash_pos - 1)
                  end

                  -- split by -. check last two if they are <color>-<number>
                  local parts = vim.split(left_side, "-")
                  if #parts >= 2 then
                    local v = cssColors[parts[#parts - 1] .. "-" .. parts[#parts]]
                    if v ~= nil then
                      return v[1]
                    end
                  end
                end

                return hl
              end,
            },
            kind = {
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
      -- Unlike rsh7th/nvim-cmp, details are shown in the
      -- documentation
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = "rounded",
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "lazydev" },
      per_filetype = {
        -- don't want AI assistance in markdown
        markdown = { "lsp", "path", "snippets", "lazydev" },
      },
      providers = {
        -- avante = {
        --   module = 'blink-cmp-avante',
        --   name = 'Avante',
        --   opts = {
        --     -- options for blink-cmp-avante
        --   },
        -- },
        -- NOTE: higher to score, the more likely it appears top
        lazydev = {
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        lsp = {
          -- score_offset = 3,
        },
        path = {
          min_keyword_length = 3,
          -- score_offset = 2,
        },
        snippets = {
          min_keyword_length = 2,
          -- score_offset = -100,
        },
        buffer = {
          min_keyword_length = 5,
          -- score_offset = 100,
        },
      },
      -- transform_items = function(_, items)
      --   return vim.tbl_filter(function(item)
      --     return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
      --   end, items)
      -- end,
    },

    snippets = { preset = "luasnip" },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = {
      sorts = {
        "score",
        "exact",
        function(a, b)
          return a.source_id < b.source_id
        end,
        "sort_text",
      },
      -- https://cmp.saghen.dev/configuration/reference.html#fuzzy
      frecency = {
        enabled = true,
      },
      implementation = "lua",
    },

    -- Shows a signature help window while you type arguments for a function
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
  },
}
