return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },

-- tpope
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "tpope/vim-obsession",
  "tpope/vim-commentary",
  "tpope/vim-speeddating",
  "tpope/vim-repeat",
  -- "tpope/vim-unimpaired",
  "tpope/vim-dadbod",
  "tpope/vim-eunuch",
  "tpope/vim-markdown",
  -- "tpope/vim-tbone",
  "tpope/vim-rhubarb",
  "tpope/vim-abolish",
  "tpope/vim-capslock",
  "tpope/vim-vinegar",
  "tpope/vim-projectionist",

  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  -- "romainl/Apprentice", { "branch": "fancylines-and-neovim" }
  -- "romainl/Apprentice", { "branch": "fancylines-and-neovim", "as": "apprentice-airline" }
  "mbbill/undotree",
  "godlygeek/tabular",
  "haya14busa/incsearch.vim",
  "luochen1990/rainbow",
  -- "justinmk/vim-sneak",
  "AndrewRadev/splitjoin.vim",
  "wellle/targets.vim",
  "bkad/CamelCaseMotion",
  -- "derekwyatt/vim-scala", { "for": ["scala"] }
  -- "tweekmonster/impsort.vim", { "on": ["ImpSort"] }
  -- "lervag/vimtex", { "for": ["tex"] }
  "NLKNguyen/vim-maven-syntax",
  -- "mechatroner/rainbow_csv",
  "raimon49/requirements.txt.vim",
  -- "ambv/black", { "on": ["Black"] }
  "embear/vim-localvimrc",
  -- "unblevable/quick-scope",
  -- "andymass/vim-matchup",
  -- "uber/prototool", { "rtp":"vim/prototool" }
  "mattn/calendar-vim",
  "freitass/todo.txt-vim",
  "markonm/traces.vim",
  "janko/vim-test",
  -- "rcarriga/vim-ultest", { "do": ":UpdateRemotePlugins" }
  "Curly-Mo/phlebotinum",
  -- "tweekmonster/startuptime.vim", { "on": ["StartupTime"] }
  "nanotech/jellybeans.vim",
  -- "sheerun/vim-polyglot",
  "ryanoasis/vim-devicons",
  "kyazdani42/nvim-web-devicons",
  "vim-scripts/ReplaceWithRegister",
  "machakann/vim-highlightedyank",
  "tommcdo/vim-exchange",
  {
    "nacro90/numb.nvim",
    config = function()
      require('numb').setup()
    end
  },
  -- "petobens/poet-v",
  "lukhio/vim-mapping-conflicts",
  -- "alok/notational-fzf-vim",
  "michaeljsmith/vim-indent-object",
  "lifepillar/vim-colortemplate",
  "stsewd/gx-extended.vim",
  -- "psliwka/vim-smoothie",
  "airblade/vim-rooter",
  "liuchengxu/vista.vim",
  "lambdalisue/vim-suda",
}
