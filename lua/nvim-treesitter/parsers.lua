local api = vim.api
local ts = vim.treesitter

for ft, lang in pairs {
  automake = "make",
  javascriptreact = "javascript",
  ecma = "javascript",
  jsx = "javascript",
  gyp = "python",
  html_tags = "html",
  ["typescript.tsx"] = "tsx",
  ["terraform-vars"] = "terraform",
  ["html.handlebars"] = "glimmer",
  systemverilog = "verilog",
  dosini = "ini",
  confini = "ini",
  svg = "xml",
  xsd = "xml",
  xslt = "xml",
  expect = "tcl",
  mysql = "sql",
  sbt = "scala",
  neomuttrc = "muttrc",
  clientscript = "runescript",
  --- short-hand list from https://github.com/helix-editor/helix/blob/master/languages.toml
  rs = "rust",
  ex = "elixir",
  js = "javascript",
  ts = "typescript",
  ["c-sharp"] = "csharp",
  hs = "haskell",
  py = "python",
  erl = "erlang",
  typ = "typst",
  pl = "perl",
  uxn = "uxntal",
} do
  ts.language.register(lang, ft)
end

---@class InstallInfo
---@field url string
---@field branch string|nil
---@field revision string|nil
---@field files string[]
---@field generate_requires_npm boolean|nil
---@field requires_generate_from_grammar boolean|nil
---@field location string|nil
---@field use_makefile boolean|nil
---@field cxx_standard string|nil

---@class ParserInfo
---@field install_info InstallInfo
---@field filetype string
---@field maintainers string[]
---@field experimental boolean|nil
---@field readme_name string|nil

---@type ParserInfo[]
local list = setmetatable({}, {
  __newindex = function(table, parsername, parserconfig)
    rawset(table, parsername, parserconfig)
    if parserconfig.filetype or vim.fn.has "nvim-0.11" == 0 then
      ts.language.register(parsername, parserconfig.filetype or parsername)
    end
  end,
})

local gitUrl = "https://lgithub.xyz"

list.ada = {
  install_info = {
    url = gitUrl.."/briot/tree-sitter-ada",
    files = { "src/parser.c" },
  },
  maintainers = { "@briot" },
}

list.agda = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-agda",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Decodetalkers" },
}

list.angular = {
  install_info = {
    url = gitUrl.."/dlvandenberg/tree-sitter-angular",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "htmlangular",
  maintainers = { "@dlvandenberg" },
  experimental = true,
}

list.apex = {
  install_info = {
    url = gitUrl.."/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "apex",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.arduino = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-arduino",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.asm = {
  install_info = {
    url = gitUrl.."/RubixDev/tree-sitter-asm",
    files = { "src/parser.c" },
  },
  maintainers = { "@RubixDev" },
}

list.astro = {
  install_info = {
    url = gitUrl.."/virchau13/tree-sitter-astro",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@virchau13" },
}

list.authzed = {
  install_info = {
    url = gitUrl.."/mleonidas/tree-sitter-authzed",
    files = { "src/parser.c" },
  },
  maintainers = { "@mattpolzin" },
}

list.awk = {
  install_info = {
    url = gitUrl.."/Beaglefoot/tree-sitter-awk",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.bash = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-bash",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "sh",
  maintainers = { "@TravonteD" },
}

list.bass = {
  install_info = {
    url = gitUrl.."/vito/tree-sitter-bass",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.beancount = {
  install_info = {
    url = gitUrl.."/polarmutex/tree-sitter-beancount",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@polarmutex" },
}

list.bibtex = {
  install_info = {
    url = gitUrl.."/latex-lsp/tree-sitter-bibtex",
    files = { "src/parser.c" },
  },
  filetype = "bib",
  maintainers = { "@theHamsta", "@clason" },
}

list.bicep = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-bicep",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.bitbake = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-bitbake",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.blueprint = {
  install_info = {
    url = "https://gitlab.com/gabmus/tree-sitter-blueprint.git",
    files = { "src/parser.c" },
  },
  maintainers = { "@gabmus" },
  experimental = true,
}

list.bp = {
  install_info = {
    url = gitUrl.."/ambroisie/tree-sitter-bp",
    files = { "src/parser.c" },
  },
  maintainers = { "@ambroisie" },
}

list.c = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-c",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.c_sharp = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-c-sharp",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "cs",
  maintainers = { "@amaanq" },
}

list.cairo = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-cairo",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.capnp = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-capnp",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.chatito = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-chatito",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.circom = {
  install_info = {
    url = gitUrl.."/Decurity/tree-sitter-circom",
    files = { "src/parser.c" },
  },
  maintainers = { "@alexandr-martirosyan" },
}

list.clojure = {
  install_info = {
    url = gitUrl.."/sogaiu/tree-sitter-clojure",
    files = { "src/parser.c" },
  },
  maintainers = { "@NoahTheDuke" },
}

list.cmake = {
  install_info = {
    url = gitUrl.."/uyha/tree-sitter-cmake",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@uyha" },
}

list.comment = {
  install_info = {
    url = gitUrl.."/stsewd/tree-sitter-comment",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.commonlisp = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-commonlisp",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  filetype = "lisp",
  maintainers = { "@theHamsta" },
}

list.cooklang = {
  install_info = {
    url = gitUrl.."/addcninblue/tree-sitter-cooklang",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@addcninblue" },
  filetype = "cook",
}

list.corn = {
  install_info = {
    url = gitUrl.."/jakestanger/tree-sitter-corn",
    files = { "src/parser.c" },
  },
  maintainers = { "@jakestanger" },
}

list.cpon = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-cpon",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.cpp = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-cpp",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.css = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-css",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.csv = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "csv",
  },
  maintainers = { "@amaanq" },
}

list.cuda = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-cuda",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.cue = {
  install_info = {
    url = gitUrl.."/eonpatapon/tree-sitter-cue",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.cylc = {
  install_info = {
    url = gitUrl.."/elliotfontaine/tree-sitter-cylc",
    files = { "src/parser.c" },
  },
  maintainers = { "@elliotfontaine" },
}

list.d = {
  install_info = {
    url = gitUrl.."/gdamore/tree-sitter-d",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.dart = {
  install_info = {
    url = gitUrl.."/UserNobody14/tree-sitter-dart",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@akinsho" },
}

list.desktop = {
  install_info = {
    url = gitUrl.."/ValdezFOmar/tree-sitter-desktop",
    files = { "src/parser.c" },
  },
  maintainers = { "@ValdezFOmar" },
}

list.devicetree = {
  install_info = {
    url = gitUrl.."/joelspadin/tree-sitter-devicetree",
    files = { "src/parser.c" },
  },
  filetype = "dts",
  maintainers = { "@jedrzejboczar" },
}

list.dhall = {
  install_info = {
    url = gitUrl.."/jbellerb/tree-sitter-dhall",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.diff = {
  install_info = {
    url = gitUrl.."/the-mikedavis/tree-sitter-diff",
    files = { "src/parser.c" },
  },
  filetype = "gitdiff",
  maintainers = { "@gbprod" },
}

list.disassembly = {
  install_info = {
    url = gitUrl.."/ColinKennedy/tree-sitter-disassembly",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.djot = {
  install_info = {
    url = gitUrl.."/treeman/tree-sitter-djot",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@NoahTheDuke" },
}

list.dockerfile = {
  install_info = {
    url = gitUrl.."/camdencheek/tree-sitter-dockerfile",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@camdencheek" },
}

list.dot = {
  install_info = {
    url = gitUrl.."/rydesun/tree-sitter-dot",
    files = { "src/parser.c" },
  },
  maintainers = { "@rydesun" },
}

list.doxygen = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-doxygen",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.dtd = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-xml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "dtd",
  },
  maintainers = { "@ObserverOfTime" },
}

list.earthfile = {
  install_info = {
    url = gitUrl.."/glehmann/tree-sitter-earthfile",
    files = { "src/parser.c" },
  },
  maintainers = { "@glehmann" },
}

list.ebnf = {
  install_info = {
    url = gitUrl.."/RubixDev/ebnf",
    files = { "src/parser.c" },
    location = "crates/tree-sitter-ebnf",
  },
  maintainers = { "@RubixDev" },
  experimental = true,
}

list.editorconfig = {
  install_info = {
    url = gitUrl.."/ValdezFOmar/tree-sitter-editorconfig",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ValdezFOmar" },
}

list.eds = {
  install_info = {
    url = gitUrl.."/uyha/tree-sitter-eds",
    files = { "src/parser.c" },
  },
  maintainers = { "@uyha" },
}

list.eex = {
  install_info = {
    url = gitUrl.."/connorlay/tree-sitter-eex",
    files = { "src/parser.c" },
  },
  filetype = "eelixir",
  maintainers = { "@connorlay" },
}

list.elixir = {
  install_info = {
    url = gitUrl.."/elixir-lang/tree-sitter-elixir",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@connorlay" },
}

list.elm = {
  install_info = {
    url = gitUrl.."/elm-tooling/tree-sitter-elm",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@zweimach" },
}

list.elsa = {
  install_info = {
    url = gitUrl.."/glapa-grossklag/tree-sitter-elsa",
    files = { "src/parser.c" },
  },
  maintainers = { "@glapa-grossklag", "@amaanq" },
}

list.elvish = {
  install_info = {
    url = gitUrl.."/elves/tree-sitter-elvish",
    files = { "src/parser.c" },
  },
  maintainers = { "@elves" },
}

list.embedded_template = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-embedded-template",
    files = { "src/parser.c" },
  },
  filetype = "eruby",
}

list.enforce = {
  install_info = {
    url = gitUrl.."/simonvic/tree-sitter-enforce",
    files = { "src/parser.c" },
  },
  maintainers = { "@simonvic" },
}

list.erlang = {
  install_info = {
    url = gitUrl.."/WhatsApp/tree-sitter-erlang",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@filmor" },
}

list.facility = {
  install_info = {
    url = gitUrl.."/FacilityApi/tree-sitter-facility",
    files = { "src/parser.c" },
  },
  filetype = "fsd",
  maintainers = { "@bryankenote" },
}

list.faust = {
  install_info = {
    url = gitUrl.."/khiner/tree-sitter-faust",
    files = { "src/parser.c" },
  },
  filetype = "dsp",
  maintainers = { "@khiner" },
}

list.fennel = {
  install_info = {
    url = gitUrl.."/alexmozaidze/tree-sitter-fennel",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@alexmozaidze" },
}

list.fidl = {
  install_info = {
    url = gitUrl.."/google/tree-sitter-fidl",
    files = { "src/parser.c" },
  },
  maintainers = { "@chaopeng" },
}

list.firrtl = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-firrtl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.fish = {
  install_info = {
    url = gitUrl.."/ram02z/tree-sitter-fish",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ram02z" },
}

list.foam = {
  install_info = {
    url = gitUrl.."/FoamScience/tree-sitter-foam",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@FoamScience" },
  -- Queries might change over time on the grammar's side
  -- Otherwise everything runs fine
  experimental = true,
}

list.forth = {
  install_info = {
    url = gitUrl.."/AlexanderBrevig/tree-sitter-forth",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.fortran = {
  install_info = {
    url = gitUrl.."/stadelmanma/tree-sitter-fortran",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.fsh = {
  install_info = {
    url = gitUrl.."/mgramigna/tree-sitter-fsh",
    files = { "src/parser.c" },
  },
  maintainers = { "@mgramigna" },
}

list.fsharp = {
  install_info = {
    url = gitUrl.."/ionide/tree-sitter-fsharp",
    files = { "src/parser.c", "src/scanner.c" },
    location = "fsharp",
  },
  maintainers = { "@nsidorenco" },
}

list.func = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-func",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.fusion = {
  install_info = {
    url = "https://gitlab.com/jirgn/tree-sitter-fusion.git",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@jirgn" },
}

list.gap = {
  install_info = {
    url = gitUrl.."/gap-system/tree-sitter-gap",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@reiniscirpons" },
  readme_name = "GAP system",
}

list.gaptst = {
  install_info = {
    url = gitUrl.."/gap-system/tree-sitter-gaptst",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@reiniscirpons" },
  readme_name = "GAP system test files",
}

list.gdscript = {
  install_info = {
    url = gitUrl.."/PrestonKnopp/tree-sitter-gdscript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@PrestonKnopp" },
  readme_name = "Godot (gdscript)",
}

list.gdshader = {
  install_info = {
    url = gitUrl.."/GodOfAvacyn/tree-sitter-gdshader",
    files = { "src/parser.c" },
  },
  filetype = "gdshaderinc",
  maintainers = { "@godofavacyn" },
}

list.git_rebase = {
  install_info = {
    url = gitUrl.."/the-mikedavis/tree-sitter-git-rebase",
    files = { "src/parser.c" },
  },
  filetype = "gitrebase",
  maintainers = { "@gbprod" },
}

list.gitattributes = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-gitattributes",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.gitcommit = {
  install_info = {
    url = gitUrl.."/gbprod/tree-sitter-gitcommit",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@gbprod" },
}

list.git_config = {
  install_info = {
    url = gitUrl.."/the-mikedavis/tree-sitter-git-config",
    files = { "src/parser.c" },
  },
  filetype = "gitconfig",
  maintainers = { "@amaanq" },
  readme_name = "git_config",
}

list.gitignore = {
  install_info = {
    url = gitUrl.."/shunsambongi/tree-sitter-gitignore",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.gleam = {
  install_info = {
    url = gitUrl.."/gleam-lang/tree-sitter-gleam",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.glimmer = {
  install_info = {
    url = gitUrl.."/ember-tooling/tree-sitter-glimmer",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "handlebars",
  maintainers = { "@NullVoxPopuli" },
  readme_name = "Glimmer and Ember",
}

list.glimmer_javascript = {
  install_info = {
    url = gitUrl.."/NullVoxPopuli/tree-sitter-glimmer-javascript",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "javascript.glimmer",
  maintainers = { "@NullVoxPopuli" },
}

list.glimmer_typescript = {
  install_info = {
    url = gitUrl.."/NullVoxPopuli/tree-sitter-glimmer-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "typescript.glimmer",
  maintainers = { "@NullVoxPopuli" },
}

list.glsl = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-glsl",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.gn = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-gn",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
  readme_name = "GN (Generate Ninja)",
}

list.gnuplot = {
  install_info = {
    url = gitUrl.."/dpezto/tree-sitter-gnuplot",
    files = { "src/parser.c" },
  },
  maintainers = { "@dpezto" },
}

list.go = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-go",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta", "@WinWisely268" },
}

list.goctl = {
  install_info = {
    url = gitUrl.."/chaozwn/tree-sitter-goctl",
    files = { "src/parser.c" },
  },
  maintainers = { "@chaozwn" },
}

list.godot_resource = {
  install_info = {
    url = gitUrl.."/PrestonKnopp/tree-sitter-godot-resource",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "gdresource",
  maintainers = { "@pierpo" },
  readme_name = "Godot Resources (gdresource)",
}

list.gomod = {
  install_info = {
    url = gitUrl.."/camdencheek/tree-sitter-go-mod",
    files = { "src/parser.c" },
  },
  maintainers = { "@camdencheek" },
}

list.gosum = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-go-sum",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.gowork = {
  install_info = {
    url = gitUrl.."/omertuc/tree-sitter-go-work",
    files = { "src/parser.c" },
  },
  maintainers = { "@omertuc" },
}

list.gotmpl = {
  install_info = {
    url = gitUrl.."/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" },
  },
  maintainers = { "@qvalentin" },
}

list.gpg = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-gpg-config",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.gren = {
  install_info = {
    files = { "src/parser.c", "src/scanner.c" },
    url = gitUrl.."/MaeBrooks/tree-sitter-gren",
  },
  maintainers = { "@MaeBrooks" },
}

list.groovy = {
  install_info = {
    url = gitUrl.."/murtaza64/tree-sitter-groovy",
    files = { "src/parser.c" },
  },
  maintainers = { "@murtaza64" },
}

list.graphql = {
  install_info = {
    url = gitUrl.."/bkegley/tree-sitter-graphql",
    files = { "src/parser.c" },
  },
  maintainers = { "@bkegley" },
}

list.gstlaunch = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-gstlaunch",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.hack = {
  install_info = {
    url = gitUrl.."/slackhq/tree-sitter-hack",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.hare = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-hare",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.haskell = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-haskell",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@mrcjkb" },
}

list.haskell_persistent = {
  install_info = {
    url = gitUrl.."/MercuryTechnologies/tree-sitter-haskell-persistent",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "haskellpersistent",
  maintainers = { "@lykahb" },
}

list.hcl = {
  install_info = {
    url = gitUrl.."/MichaHoffmann/tree-sitter-hcl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@MichaHoffmann" },
}

list.heex = {
  install_info = {
    url = gitUrl.."/connorlay/tree-sitter-heex",
    files = { "src/parser.c" },
  },
  maintainers = { "@connorlay" },
}

list.helm = {
  install_info = {
    url = gitUrl.."/ngalaiko/tree-sitter-go-template",
    location = "dialects/helm",
    files = { "src/parser.c" },
  },
  maintainers = { "@qvalentin" },
}

list.hjson = {
  install_info = {
    url = gitUrl.."/winston0410/tree-sitter-hjson",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@winston0410" },
}

list.hlsl = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-hlsl",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.hocon = {
  install_info = {
    url = gitUrl.."/antosha417/tree-sitter-hocon",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@antosha417" },
}

list.hoon = {
  install_info = {
    url = gitUrl.."/urbit-pilled/tree-sitter-hoon",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@urbit-pilled" },
  experimental = true,
}

list.html = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-html",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.htmldjango = {
  install_info = {
    url = gitUrl.."/interdependence/tree-sitter-htmldjango",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  experimental = true,
}

list.http = {
  install_info = {
    url = gitUrl.."/rest-nvim/tree-sitter-http",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@NTBBloodbath" },
}

list.hurl = {
  install_info = {
    url = gitUrl.."/pfeiferj/tree-sitter-hurl",
    files = { "src/parser.c" },
  },
  maintainers = { "@pfeiferj" },
}

list.hyprlang = {
  install_info = {
    url = gitUrl.."/luckasRanarison/tree-sitter-hyprlang",
    files = { "src/parser.c" },
  },
  maintainers = { "@luckasRanarison" },
}

list.idl = {
  install_info = {
    url = gitUrl.."/cathaysia/tree-sitter-idl",
    files = { "src/parser.c" },
  },
  maintainers = { "@cathaysia" },
}

list.idris = {
  install_info = {
    url = gitUrl.."/kayhide/tree-sitter-idris",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "idris2",
  maintainers = { "@srghma" },
}

list.ini = {
  install_info = {
    url = gitUrl.."/justinmk/tree-sitter-ini",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
  experimental = true,
}

list.inko = {
  install_info = {
    url = gitUrl.."/inko-lang/tree-sitter-inko",
    files = { "src/parser.c" },
  },
  maintainers = { "@yorickpeterse" },
}

list.ipkg = {
  install_info = {
    url = gitUrl.."/srghma/tree-sitter-ipkg",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@srghma" },
}

list.ispc = {
  install_info = {
    url = gitUrl.."/fab4100/tree-sitter-ispc",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@fab4100" },
}

list.janet_simple = {
  install_info = {
    url = gitUrl.."/sogaiu/tree-sitter-janet-simple",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "janet",
  maintainers = { "@sogaiu" },
}

list.java = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-java",
    files = { "src/parser.c" },
  },
  maintainers = { "@p00f" },
}

list.javascript = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-javascript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@steelsojka" },
}

list.jinja = {
  install_info = {
    url = gitUrl.."/cathaysia/tree-sitter-jinja",
    location = "tree-sitter-jinja",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@cathaysia" },
}

list.jinja_inline = {
  install_info = {
    url = gitUrl.."/cathaysia/tree-sitter-jinja",
    location = "tree-sitter-jinja_inline",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@cathaysia" },
}

list.jq = {
  install_info = {
    url = gitUrl.."/flurie/tree-sitter-jq",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.jsdoc = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-jsdoc",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@steelsojka" },
}

list.json = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-json",
    files = { "src/parser.c" },
  },
  maintainers = { "@steelsojka" },
}

list.json5 = {
  install_info = {
    url = gitUrl.."/Joakker/tree-sitter-json5",
    files = { "src/parser.c" },
  },
  maintainers = { "@Joakker" },
}

list.jsonc = {
  install_info = {
    url = "https://gitlab.com/WhyNotHugo/tree-sitter-jsonc.git",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@WhyNotHugo" },
  readme_name = "JSON with comments",
}

list.jsonnet = {
  install_info = {
    url = gitUrl.."/sourcegraph/tree-sitter-jsonnet",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@nawordar" },
}

list.julia = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-julia",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@fredrikekre" },
}

list.just = {
  install_info = {
    url = gitUrl.."/IndianBoy42/tree-sitter-just",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Hubro" },
}

list.kconfig = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-kconfig",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.kdl = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-kdl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.kotlin = {
  install_info = {
    url = gitUrl.."/fwcd/tree-sitter-kotlin",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@SalBakraa" },
}

list.koto = {
  install_info = {
    url = gitUrl.."/koto-lang/tree-sitter-koto",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@irh" },
}

list.kusto = {
  install_info = {
    url = gitUrl.."/Willem-J-an/tree-sitter-kusto",
    files = { "src/parser.c" },
  },
  maintainers = { "@Willem-J-an" },
}

list.lalrpop = {
  install_info = {
    url = gitUrl.."/traxys/tree-sitter-lalrpop",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@traxys" },
}

list.latex = {
  install_info = {
    url = gitUrl.."/latex-lsp/tree-sitter-latex",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  filetype = "tex",
  maintainers = { "@theHamsta", "@clason" },
}

list.ledger = {
  install_info = {
    url = gitUrl.."/cbarrete/tree-sitter-ledger",
    files = { "src/parser.c" },
  },
  maintainers = { "@cbarrete" },
}

list.leo = {
  install_info = {
    url = gitUrl.."/r001/tree-sitter-leo",
    files = { "src/parser.c" },
  },
  maintainers = { "@r001" },
}

list.llvm = {
  install_info = {
    url = gitUrl.."/benwilliamgraham/tree-sitter-llvm",
    files = { "src/parser.c" },
  },
  maintainers = { "@benwilliamgraham" },
}

list.linkerscript = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-linkerscript",
    files = { "src/parser.c" },
  },
  filetype = "ld",
  maintainers = { "@amaanq" },
}

list.liquid = {
  install_info = {
    url = gitUrl.."/hankthetank27/tree-sitter-liquid",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@hankthetank27" },
}

list.liquidsoap = {
  install_info = {
    url = gitUrl.."/savonet/tree-sitter-liquidsoap",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@toots" },
}

list.lua = {
  install_info = {
    url = gitUrl.."/MunifTanjim/tree-sitter-lua",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@muniftanjim" },
}

list.luadoc = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-luadoc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.luap = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-luap",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
  readme_name = "lua patterns",
}

list.luau = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-luau",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.hlsplaylist = {
  install_info = {
    url = gitUrl.."/Freed-Wu/tree-sitter-hlsplaylist",
    files = { "src/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.m68k = {
  install_info = {
    url = gitUrl.."/grahambates/tree-sitter-m68k",
    files = { "src/parser.c" },
  },
  filetype = "asm68k",
  maintainers = { "@grahambates" },
}

list.make = {
  install_info = {
    url = gitUrl.."/alemuller/tree-sitter-make",
    files = { "src/parser.c" },
  },
  maintainers = { "@lewis6991" },
}

list.markdown = {
  install_info = {
    url = gitUrl.."/MDeiml/tree-sitter-markdown",
    location = "tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown (basic highlighting)",
  experimental = true,
}

list.markdown_inline = {
  install_info = {
    url = gitUrl.."/MDeiml/tree-sitter-markdown",
    location = "tree-sitter-markdown-inline",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown_inline (needed for full highlighting)",
  experimental = true,
}

list.matlab = {
  install_info = {
    url = gitUrl.."/acristoffers/tree-sitter-matlab",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@acristoffers" },
}

list.menhir = {
  install_info = {
    url = gitUrl.."/Kerl13/tree-sitter-menhir",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Kerl13" },
}

list.mermaid = {
  install_info = {
    url = gitUrl.."/monaqa/tree-sitter-mermaid",
    files = { "src/parser.c" },
  },
  experimental = true,
}

list.meson = {
  install_info = {
    url = gitUrl.."/Decodetalkers/tree-sitter-meson",
    files = { "src/parser.c" },
  },
  maintainers = { "@Decodetalkers" },
}

list.mlir = {
  install_info = {
    url = gitUrl.."/artagnon/tree-sitter-mlir",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  experimental = true,
  maintainers = { "@artagnon" },
}

list.muttrc = {
  install_info = {
    url = gitUrl.."/neomutt/tree-sitter-muttrc",
    files = { "src/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.nasm = {
  install_info = {
    url = gitUrl.."/naclsn/tree-sitter-nasm",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.nginx = {
  install_info = {
    url = gitUrl.."/opa-oz/tree-sitter-nginx",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.nickel = {
  install_info = {
    url = gitUrl.."/nickel-lang/tree-sitter-nickel",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.nim = {
  install_info = {
    url = gitUrl.."/alaviss/tree-sitter-nim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@aMOPel" },
}

list.nim_format_string = {
  install_info = {
    url = gitUrl.."/aMOPel/tree-sitter-nim-format-string",
    files = { "src/parser.c" },
  },
  maintainers = { "@aMOPel" },
}

list.ninja = {
  install_info = {
    url = gitUrl.."/alemuller/tree-sitter-ninja",
    files = { "src/parser.c" },
  },
  maintainers = { "@alemuller" },
}

list.nix = {
  install_info = {
    url = gitUrl.."/cstrahan/tree-sitter-nix",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.norg = {
  install_info = {
    url = gitUrl.."/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    cxx_standard = "c++14",
    use_makefile = true,
  },
  maintainers = { "@JoeyGrajciar", "@vhyrro" },
}

list.nqc = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-nqc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.nu = {
  install_info = {
    url = gitUrl.."/nushell/tree-sitter-nu",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@abhisheksingh0x558" },
}

list.objc = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-objc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.objdump = {
  install_info = {
    url = gitUrl.."/ColinKennedy/tree-sitter-objdump",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.ocaml = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-ocaml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "grammars/ocaml",
  },
  maintainers = { "@undu" },
}

list.ocaml_interface = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-ocaml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "grammars/interface",
  },
  filetype = "ocamlinterface",
  maintainers = { "@undu" },
}

list.ocamllex = {
  install_info = {
    url = gitUrl.."/atom-ocaml/tree-sitter-ocamllex",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@undu" },
}

list.odin = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-odin",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.org = {
  install_info = {
    url = gitUrl.."/milisims/tree-sitter-org",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.pascal = {
  install_info = {
    url = gitUrl.."/Isopod/tree-sitter-pascal",
    files = { "src/parser.c" },
  },
  maintainers = { "@Isopod" },
}

list.passwd = {
  install_info = {
    url = gitUrl.."/ath3/tree-sitter-passwd",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pem = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-pem",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.perl = {
  install_info = {
    url = gitUrl.."/tree-sitter-perl/tree-sitter-perl",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.php = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-php",
    location = "php",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

list.php_only = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-php",
    location = "php_only",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

-- Parsers for injections
list.phpdoc = {
  install_info = {
    url = gitUrl.."/claytonrcarter/tree-sitter-phpdoc",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@mikehaertl" },
  experimental = true,
}

list.pioasm = {
  install_info = {
    url = gitUrl.."/leo60228/tree-sitter-pioasm",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.po = {
  install_info = {
    url = gitUrl.."/erasin/tree-sitter-po",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pod = {
  install_info = {
    url = gitUrl.."/tree-sitter-perl/tree-sitter-pod",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.poe_filter = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-poe-filter",
    files = { "src/parser.c" },
  },
  filetype = "poefilter",
  maintainers = { "@ObserverOfTime" },
  readme_name = "Path of Exile item filter",
  experimental = true,
}

list.pony = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-pony",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq", "@mfelsche" },
}

list.powershell = {
  install_info = {
    url = gitUrl.."/airbus-cert/tree-sitter-powershell",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "ps1",
  maintainers = { "@L2jLiga" },
}

list.printf = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-printf",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.prisma = {
  install_info = {
    url = gitUrl.."/victorhqc/tree-sitter-prisma",
    files = { "src/parser.c" },
  },
  maintainers = { "@elianiva" },
}

list.problog = {
  install_info = {
    url = gitUrl.."/foxyseta/tree-sitter-prolog",
    files = { "src/parser.c" },
    location = "grammars/problog",
  },
  maintainers = { "@foxyseta" },
}

list.prolog = {
  install_info = {
    url = gitUrl.."/foxyseta/tree-sitter-prolog",
    files = { "src/parser.c" },
    location = "grammars/prolog",
  },
  maintainers = { "@foxyseta" },
}

list.promql = {
  install_info = {
    url = gitUrl.."/MichaHoffmann/tree-sitter-promql",
    files = { "src/parser.c" },
    experimental = true,
  },
  maintainers = { "@MichaHoffmann" },
}

list.properties = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-properties",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "jproperties",
  maintainers = { "@ObserverOfTime" },
}

list.proto = {
  install_info = {
    url = gitUrl.."/treywood/tree-sitter-proto",
    files = { "src/parser.c" },
  },
  maintainers = { "@treywood" },
}

list.prql = {
  install_info = {
    url = gitUrl.."/PRQL/tree-sitter-prql",
    files = { "src/parser.c" },
  },
  maintainers = { "@matthias-Q" },
}

list.psv = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "psv",
  },
  maintainers = { "@amaanq" },
}

list.pug = {
  install_info = {
    url = gitUrl.."/zealot128/tree-sitter-pug",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@zealot128" },
  experimental = true,
}

list.puppet = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-puppet",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.purescript = {
  install_info = {
    url = gitUrl.."/postsolar/tree-sitter-purescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@postsolar" },
}

list.pymanifest = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-pymanifest",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "PyPA manifest",
}

list.python = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-python",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd", "@theHamsta" },
}

list.ql = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-ql",
    files = { "src/parser.c" },
  },
  maintainers = { "@pwntester" },
}

list.qmldir = {
  install_info = {
    url = gitUrl.."/Decodetalkers/tree-sitter-qmldir",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.qmljs = {
  install_info = {
    url = gitUrl.."/yuja/tree-sitter-qmljs",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "qml",
  maintainers = { "@Decodetalkers" },
}

list.query = {
  install_info = {
    url = gitUrl.."/nvim-treesitter/tree-sitter-query",
    files = { "src/parser.c" },
  },
  maintainers = { "@steelsojka" },
  readme_name = "Tree-Sitter query language",
}

list.r = {
  install_info = {
    url = gitUrl.."/r-lib/tree-sitter-r",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.racket = {
  install_info = {
    url = gitUrl.."/6cdh/tree-sitter-racket",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.ralph = {
  install_info = {
    url = gitUrl.."/alephium/tree-sitter-ralph",
    files = { "src/parser.c" },
  },
  maintainers = { "@tdroxler" },
}

list.rasi = {
  install_info = {
    url = gitUrl.."/Fymyte/tree-sitter-rasi",
    files = { "src/parser.c" },
  },
  maintainers = { "@Fymyte" },
}

list.razor = {
  install_info = {
    url = gitUrl.."/tris203/tree-sitter-razor",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tris203" },
}

list.rbs = {
  install_info = {
    url = gitUrl.."/joker1007/tree-sitter-rbs",
    files = { "src/parser.c" },
  },
  maintainers = { "@joker1007" },
}

list.re2c = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-re2c",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.readline = {
  install_info = {
    url = gitUrl.."/ribru17/tree-sitter-readline",
    files = { "src/parser.c" },
  },
  maintainers = { "@ribru17" },
}

list.regex = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-regex",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.rego = {
  install_info = {
    url = gitUrl.."/FallenAngel97/tree-sitter-rego",
    files = { "src/parser.c" },
  },
  maintainers = { "@FallenAngel97" },
}

list.requirements = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-requirements",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "pip requirements",
}

list.rescript = {
  install_info = {
    url = gitUrl.."/rescript-lang/tree-sitter-rescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.rnoweb = {
  install_info = {
    url = gitUrl.."/bamonroe/tree-sitter-rnoweb",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@bamonroe" },
}

list.robot = {
  install_info = {
    url = gitUrl.."/Hubro/tree-sitter-robot",
    files = { "src/parser.c" },
  },
  maintainers = { "@Hubro" },
}

list.robots = {
  install_info = {
    url = gitUrl.."/opa-oz/tree-sitter-robots-txt",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.roc = {
  install_info = {
    url = gitUrl.."/faldor20/tree-sitter-roc",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@nat-418" },
}

list.ron = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-ron",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.rst = {
  install_info = {
    url = gitUrl.."/stsewd/tree-sitter-rst",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.ruby = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-ruby",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.runescript = {
  install_info = {
    url = gitUrl.."/2004Scape/tree-sitter-runescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@2004Scape" },
}

list.rust = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-rust",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.scala = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-scala",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stevanmilic" },
}

list.scfg = {
  install_info = {
    url = gitUrl.."/rockorager/tree-sitter-scfg",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@WhyNotHugo" },
}

list.scheme = {
  install_info = {
    url = gitUrl.."/6cdh/tree-sitter-scheme",
    files = { "src/parser.c" },
  },
}

list.scss = {
  install_info = {
    url = gitUrl.."/serenadeai/tree-sitter-scss",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@elianiva" },
}

list.sflog = {
  install_info = {
    url = gitUrl.."/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "sflog",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.slang = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-slang",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "shaderslang",
  maintainers = { "@theHamsta" },
  experimental = true,
}

list.slim = {
  install_info = {
    url = gitUrl.."/theoo/tree-sitter-slim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@theoo" },
}

list.slint = {
  install_info = {
    url = gitUrl.."/slint-ui/tree-sitter-slint",
    files = { "src/parser.c" },
  },
  maintainers = { "@hunger" },
}

list.smali = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-smali",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.snakemake = {
  install_info = {
    url = gitUrl.."/osthomas/tree-sitter-snakemake",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainer = { "@osthomas" },
  experimental = true,
}

list.smithy = {
  install_info = {
    url = gitUrl.."/indoorvivants/tree-sitter-smithy",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@keynmol" },
}

list.solidity = {
  install_info = {
    url = gitUrl.."/JoranHonig/tree-sitter-solidity",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.soql = {
  install_info = {
    url = gitUrl.."/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "soql",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sosl = {
  install_info = {
    url = gitUrl.."/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "sosl",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sourcepawn = {
  install_info = {
    url = gitUrl.."/nilshelmig/tree-sitter-sourcepawn",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Sarrus1" },
  tier = 3,
}

list.sparql = {
  install_info = {
    url = gitUrl.."/GordianDziwis/tree-sitter-sparql",
    files = { "src/parser.c" },
  },
  maintainers = { "@GordianDziwis" },
}

list.sql = {
  install_info = {
    url = gitUrl.."/derekstride/tree-sitter-sql",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "gh-pages",
  },
  maintainers = { "@derekstride" },
}

list.squirrel = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-squirrel",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.ssh_config = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-ssh-config",
    files = { "src/parser.c" },
  },
  filetype = "sshconfig",
  maintainers = { "@ObserverOfTime" },
}

list.starlark = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-starlark",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "bzl",
  maintainers = { "@amaanq" },
}

list.strace = {
  install_info = {
    url = gitUrl.."/sigmaSd/tree-sitter-strace",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.styled = {
  install_info = {
    url = gitUrl.."/mskelton/tree-sitter-styled",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@mskelton" },
}

list.supercollider = {
  install_info = {
    url = gitUrl.."/madskjeldgaard/tree-sitter-supercollider",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@madskjeldgaard" },
}

list.superhtml = {
  install_info = {
    url = gitUrl.."/kristoff-it/superhtml",
    files = {
      "src/parser.c",
      "src/scanner.c",
    },
    location = "tree-sitter-superhtml",
  },
  maintainers = { "@rockorager" },
}

list.surface = {
  install_info = {
    url = gitUrl.."/connorlay/tree-sitter-surface",
    files = { "src/parser.c" },
  },
  filetype = "sface",
  maintainers = { "@connorlay" },
}

list.svelte = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-svelte",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.sway = {
  install_info = {
    url = gitUrl.."/FuelLabs/tree-sitter-sway.git",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.swift = {
  install_info = {
    url = gitUrl.."/alex-pinkus/tree-sitter-swift",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@alex-pinkus" },
}

list.sxhkdrc = {
  install_info = {
    url = gitUrl.."/RaafatTurki/tree-sitter-sxhkdrc",
    files = { "src/parser.c" },
  },
  maintainers = { "@RaafatTurki" },
}

list.systemtap = {
  install_info = {
    url = gitUrl.."/ok-ryoko/tree-sitter-systemtap",
    files = { "src/parser.c" },
  },
  maintainers = { "@ok-ryoko" },
}

list.t32 = {
  install_info = {
    url = "https://gitlab.com/xasc/tree-sitter-t32.git",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "trace32",
  maintainers = { "@xasc" },
}

list.tablegen = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-tablegen",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.tact = {
  install_info = {
    url = gitUrl.."/tact-lang/tree-sitter-tact",
    files = { "src/parser.c" },
  },
  maintainers = { "@novusnota" },
}

list.teal = {
  install_info = {
    url = gitUrl.."/euclidianAce/tree-sitter-teal",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@euclidianAce" },
}

list.tcl = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-tcl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@lewis6991" },
}

list.terraform = {
  install_info = {
    url = gitUrl.."/MichaHoffmann/tree-sitter-hcl",
    files = { "src/parser.c", "src/scanner.c" },
    location = "dialects/terraform",
  },
  maintainers = { "@MichaHoffmann" },
}

list.textproto = {
  install_info = {
    url = gitUrl.."/PorterAtGoogle/tree-sitter-textproto",
    files = { "src/parser.c" },
  },
  filetype = "pbtxt",
  maintainers = { "@Porter" },
}

list.thrift = {
  install_info = {
    url = gitUrl.."/duskmoon314/tree-sitter-thrift",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@duskmoon314" },
}

list.tiger = {
  install_info = {
    url = gitUrl.."/ambroisie/tree-sitter-tiger",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ambroisie" },
}

list.tlaplus = {
  install_info = {
    url = gitUrl.."/tlaplus-community/tree-sitter-tlaplus",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "tla",
  maintainers = { "@ahelwer", "@susliko" },
}

list.tmux = {
  install_info = {
    url = gitUrl.."/Freed-Wu/tree-sitter-tmux",
    files = { "src/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.todotxt = {
  install_info = {
    url = gitUrl.."/arnarg/tree-sitter-todotxt",
    files = { "src/parser.c" },
  },
  maintainers = { "@arnarg" },
  experimental = true,
}

list.toml = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-toml",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tk-shirasaka" },
}

list.tsv = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "tsv",
  },
  maintainers = { "@amaanq" },
}

list.tsx = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    location = "tsx",
    generate_requires_npm = true,
  },
  filetype = "typescriptreact",
  maintainers = { "@steelsojka" },
}

list.turtle = {
  install_info = {
    url = gitUrl.."/GordianDziwis/tree-sitter-turtle",
    files = { "src/parser.c" },
  },
  maintainers = { "@GordianDziwis" },
}

list.twig = {
  install_info = {
    url = gitUrl.."/gbprod/tree-sitter-twig",
    files = { "src/parser.c" },
  },
  maintainers = { "@gbprod" },
}

list.typescript = {
  install_info = {
    url = gitUrl.."/tree-sitter/tree-sitter-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    location = "typescript",
    generate_requires_npm = true,
  },
  maintainers = { "@steelsojka" },
}

list.typespec = {
  install_info = {
    url = gitUrl.."/happenslol/tree-sitter-typespec",
    files = { "src/parser.c" },
  },
  maintainers = { "@happenslol" },
}

list.typoscript = {
  install_info = {
    url = gitUrl.."/Teddytrombone/tree-sitter-typoscript",
    files = { "src/parser.c" },
  },
  maintainers = { "@Teddytrombone" },
}

list.typst = {
  install_info = {
    url = gitUrl.."/uben0/tree-sitter-typst",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@uben0", "@RaafatTurki" },
}

list.udev = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-udev",
    files = { "src/parser.c" },
  },
  filetype = "udevrules",
  maintainers = { "@ObserverOfTime" },
}

list.ungrammar = {
  install_info = {
    url = gitUrl.."/Philipp-M/tree-sitter-ungrammar",
    files = { "src/parser.c" },
  },
  maintainers = { "@Philipp-M", "@amaanq" },
}

list.unison = {
  install_info = {
    url = gitUrl.."/kylegoetz/tree-sitter-unison",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@tapegram" },
}

list.usd = {
  install_info = {
    url = gitUrl.."/ColinKennedy/tree-sitter-usd",
    files = { "src/parser.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.uxntal = {
  install_info = {
    url = gitUrl.."/amaanq/tree-sitter-uxntal",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "tal",
  maintainers = { "@amaanq" },
  readme_name = "uxn tal",
}

list.v = {
  install_info = {
    url = gitUrl.."/vlang/v-analyzer",
    files = { "src/parser.c" },
    location = "tree_sitter_v",
  },
  filetype = "vlang",
  maintainers = { "@kkharji", "@amaanq" },
}

list.vala = {
  install_info = {
    url = gitUrl.."/vala-lang/tree-sitter-vala",
    files = { "src/parser.c" },
  },
  maintainers = { "@Prince781" },
}

list.vento = {
  install_info = {
    url = gitUrl.."/ventojs/tree-sitter-vento",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "vto",
  maintainers = { "@wrapperup", "@oscarotero" },
}

list.verilog = {
  install_info = {
    url = gitUrl.."/gmlarumbe/tree-sitter-systemverilog",
    files = { "src/parser.c" },
  },
  maintainers = { "@zhangwwpeng" },
}

list.vhdl = {
  install_info = {
    url = gitUrl.."/jpt13653903/tree-sitter-vhdl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@jpt13653903" },
}

list.vhs = {
  install_info = {
    url = gitUrl.."/charmbracelet/tree-sitter-vhs",
    files = { "src/parser.c" },
  },
  filetype = "tape",
  maintainers = { "@caarlos0" },
}

list.vim = {
  install_info = {
    url = gitUrl.."/neovim/tree-sitter-vim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@clason" },
}

list.vimdoc = {
  install_info = {
    url = gitUrl.."/neovim/tree-sitter-vimdoc",
    files = { "src/parser.c" },
  },
  filetype = "help",
  maintainers = { "@clason" },
}

list.vrl = {
  install_info = {
    url = gitUrl.."/belltoy/tree-sitter-vrl",
    files = { "src/parser.c" },
  },
  maintainers = { "@belltoy" },
}

list.vue = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-vue",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  maintainers = { "@WhyNotHugo", "@lucario387" },
}

list.wgsl = {
  install_info = {
    url = gitUrl.."/szebniok/tree-sitter-wgsl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@szebniok" },
}

list.wgsl_bevy = {
  install_info = {
    url = gitUrl.."/theHamsta/tree-sitter-wgsl-bevy",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.wing = {
  install_info = {
    url = gitUrl.."/winglang/tree-sitter-wing",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@gshpychka", "@MarkMcCulloh" },
}

list.wit = {
  install_info = {
    url = gitUrl.."/liamwh/tree-sitter-wit",
    files = { "src/parser.c" },
  },
  maintainers = { "@liamwh" },
}

list.xcompose = {
  install_info = {
    url = gitUrl.."/ObserverOfTime/tree-sitter-xcompose",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.xml = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-xml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "xml",
  },
  maintainers = { "@ObserverOfTime" },
}

list.xresources = {
  install_info = {
    url = gitUrl.."/ValdezFOmar/tree-sitter-xresources",
    files = { "src/parser.c" },
  },
  filetype = "xdefaults",
  maintainers = { "@ValdezFOmar" },
}

list.yaml = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-yaml",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.yang = {
  install_info = {
    url = gitUrl.."/Hubro/tree-sitter-yang",
    files = { "src/parser.c" },
  },
  maintainers = { "@Hubro" },
}

list.yuck = {
  install_info = {
    url = gitUrl.."/Philipp-M/tree-sitter-yuck",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Philipp-M", "@amaanq" },
}

list.zathurarc = {
  install_info = {
    url = gitUrl.."/Freed-Wu/tree-sitter-zathurarc",
    files = { "src/parser.c" },
  },
  maintainers = { "@Freed-Wu" },
}

list.zig = {
  install_info = {
    url = gitUrl.."/tree-sitter-grammars/tree-sitter-zig",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.ziggy = {
  install_info = {
    url = gitUrl.."/kristoff-it/ziggy",
    files = { "src/parser.c" },
    location = "tree-sitter-ziggy",
  },
  maintainers = { "@rockorager" },
}

list.ziggy_schema = {
  install_info = {
    url = gitUrl.."/kristoff-it/ziggy",
    files = { "src/parser.c" },
    location = "tree-sitter-ziggy-schema",
  },
  maintainers = { "@rockorager" },
}

list.templ = {
  install_info = {
    url = gitUrl.."/vrischmann/tree-sitter-templ",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@vrischmann" },
}

local M = {
  list = list,
}

function M.ft_to_lang(ft)
  local result = ts.language.get_lang(ft)
  if result then
    return result
  else
    ft = vim.split(ft, ".", { plain = true })[1]
    return ts.language.get_lang(ft) or ft
  end
end

-- Get a list of all available parsers
---@return string[]
function M.available_parsers()
  local parsers = vim.tbl_keys(M.list)
  table.sort(parsers)
  if vim.fn.executable "tree-sitter" == 1 and vim.fn.executable "node" == 1 then
    return parsers
  else
    return vim.tbl_filter(function(p) ---@param p string
      return not M.list[p].install_info.requires_generate_from_grammar
    end, parsers)
  end
end

function M.get_parser_configs()
  return M.list
end

local parser_files

function M.reset_cache()
  parser_files = setmetatable({}, {
    __index = function(tbl, key)
      rawset(tbl, key, api.nvim_get_runtime_file("parser/" .. key .. ".*", false))
      return rawget(tbl, key)
    end,
  })
end

M.reset_cache()

function M.has_parser(lang)
  lang = lang or M.get_buf_lang(api.nvim_get_current_buf())

  if not lang or #lang == 0 then
    return false
  end
  -- HACK: nvim internal API
  if vim._ts_has_language(lang) then
    return true
  end
  return #parser_files[lang] > 0
end

function M.get_parser(bufnr, lang)
  bufnr = bufnr or api.nvim_get_current_buf()
  lang = lang or M.get_buf_lang(bufnr)

  if M.has_parser(lang) then
    return ts.get_parser(bufnr, lang)
  end
end

-- @deprecated This is only kept for legacy purposes.
--             All root nodes should be accounted for.
function M.get_tree_root(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.get_parser(bufnr):parse()[1]:root()
end

-- Gets the language of a given buffer
---@param bufnr number? or current buffer
---@return string
function M.get_buf_lang(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.ft_to_lang(api.nvim_buf_get_option(bufnr, "ft"))
end

return M
