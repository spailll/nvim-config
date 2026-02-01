{ config, pkgs, ... }:

let
  myNeovim = pkgs.neovim.override {
    configure = {
      packages.myPlugins = with pkgs.vimPlugins; {
        start = [
          vim-surround
          nerdtree
          vim-airline
					gruvbox
          awesome-vim-colorschemes
          tagbar
          vim-css-color
          vim-fugitive
          vim-commentary
        ];
      };

      customRC = ''
        " vim-plug removed; plugins are managed by NixOS now.

        set number
        set relativenumber
        set autoindent
        set tabstop=2
        set shiftwidth=2
        set smarttab
        set softtabstop=2
        set mouse=a
        set whichwrap+=<,>,[,]

        set encoding=UTF-8

        nnoremap <C-f> :NERDTreeFocus<CR>
        nnoremap <C-n> :NERDTree<CR>
        nnoremap <C-t> :NERDTreeToggle<CR>

        nmap <F8> :TagbarToggle<CR>
 
				set termguicolors
				set background=dark
        colorscheme gruvbox

        let g:airline_powerline_fonts = 1

        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif

        let g:NerdTreeDirArrowExpandable="+"
        let g:NerdTreeDirArrowCollapsible="~"

        set completeopt-=preview
        set completeopt+=menuone
        set completeopt+=noselect

        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = ''
        let g:airline_symbols.linenr = ''
      '';
    };
  };

  viWrap = pkgs.writeShellScriptBin "vi" ''exec ${myNeovim}/bin/nvim "$@"'';
  vimWrap = pkgs.writeShellScriptBin "vim" ''exec ${myNeovim}/bin/nvim "$@"'';
in
{
  environment.systemPackages = [
    myNeovim
    viWrap
    vimWrap
  ];

  # Optional but nice: make sudoedit open Neovim by default
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Optional: if you want the Neovim font dependency to live with Neovim
  # (You already have this globally; if you keep it there, delete this.)
  # fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}

