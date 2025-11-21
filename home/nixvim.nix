{
	programs.nixvim = {
		enable = true;
		colorschemes.gruvbox.enable = true;

		opts = {
			tabstop = 2;
			shiftwidth = 2;
			expandtab = true;
			number = true;
			smartindent = true;
			ignorecase = true;
			smartcase = true;
			hlsearch = true;
			incsearch = true;
			clipboard = "unnamedplus";
			undofile = true;
			lazyredraw = true;
			updatetime = 300;
		};

    autoCmd = [
      {
        command = "AerialToggle";
        event = [
          "VimEnter"
        ];
      }
      {
        command = "Neotree toggle";
        event = [
          "VimEnter"
        ];
      }
      {
        command = "wincmd l";
        event = [
          "VimEnter"
        ];
      }
    ];

		keymaps = [
			{
				key = "<C-n>";
    		action = "<cmd>Neotree toggle<CR>";
    		options = {
      		silent = true;
      		desc = "Toggle Neo-tree";
    		};
			}
			{
				key = "<C-b>";
				action = "<cmd>ToggleTerm<CR>";
				options = {
					silent = true;
					desc = "Toggle Term";
				};
			}
		];

		plugins = {
			autoclose.enable = true;
      fzf-lua.enable = true;
			neocord = { enable = true; autoLoad = true; };

      toggleterm.enable = true;
			barbar.enable = true;

      aerial = {
        enable = true;
        settings = {
          backends = [
              "treesitter"
              "lsp"
              "markdown"
              "man"
            ];
            disable_max_lines = 5000;
            highlight_on_hover = true;
          };
      };

			neo-tree.enable = true;
			mini.enable = true;
			web-devicons.enable = true;

			luasnip.enable = true;
      vim-css-color.enable = true;
      whitespace.enable = true;

			cmp = {
				enable = true;
				autoEnableSources = true;
				settings = {
					snippet.expand = ''
						function(args)
							require('luasnip').lsp_expand(args.body)
						end
					'';

					mapping = {
						"<C-Space>" = "cmp.mapping.complete()";
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<C-e>" = "cmp.mapping.close()";
						"<CR>" = "cmp.mapping.confirm({ select = true })";
						"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
						"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
					};

					sources = [
						{ name = "nvim_lsp"; }
						{ name = "luasnip"; }
						{ name = "path"; }
						{ name = "buffer"; }
					];
				};
			};

			cmp-nvim-lsp.enable = true;
			cmp-buffer.enable = true;
			cmp-path.enable = true;
			cmp_luasnip.enable = true;

			lsp = {
				enable = true;
				servers = {
					clangd = {
						enable = true;
						settings = {
							cmd = [
								"clangd"
								"--background-index"
							];
							filetypes = [
    						"c"
    						"cpp"
  						];
  						root_markers = [
    						"compile_commands.json"
    						"compile_flags.txt"
  						];
						};
					};
					rust_analyzer = {
						enable = true;
						installCargo = true;
						installRustc = true;
					};

					pyright.enable = true;
					nixd.enable = true;
					jsonls.enable = true;
					gopls.enable = true;
					glsl_analyzer.enable = true;
					bashls.enable = true;
					csharp_ls.enable = true;
					lua_ls.enable = true;
					neocmake.enable = true;
				};
			};
      lsp-format.enable = true;

			lightline = { enable = true; settings = { colorscheme = "wombat"; active = { left = [ [ "mode" "paste" ] [ "readonly" "filename" "modified" ] ]; }; }; };
		};
	};
}
