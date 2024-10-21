-- Shows how to use the DAP plugin to debug your code.

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',

    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',


    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve', -- go
        'codelldb', --rust
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.configurations.javascript = {
      {
        name = "Gateway",
        type = "node2",
        -- mode = 'remote',
        request = "attach",
        port = 9200,
        address = "127.0.0.1",
        skipFiles = {"<node_internals>/**"},
        sourceMaps = true,
        --cwd = "${workspaceFolder}",
        --localRoot = "/home/gasti/projects/repos/asofix-gateway",
        localRoot = "${workspaceFolder}",
        remoteRoot = "/home/node/app",
        -- outFiles = {
        --    "${workspaceFolder}",
        -- }
      },
      {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
      },

      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
      }
          -- {
          --   "name": "Catalog",
          --   "port": 9201,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:catalog}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Framework",
          --   "port": 9202,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:framework}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Clients",
          --   "port": 9203,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:clients}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Files",
          --   "port": 9204,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:files}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "MaestroDatos",
          --   "port": 9205,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:maestrodatos}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Pdf",
          --   "port": 9206,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:pdf}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Presupuestador",
          --   "port": 9207,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:presupuestador}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Sales",
          --   "port": 9208,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:pricing}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- // the following debbugers aren't configured in package.json
          -- {
          --   "name": "Peritador",
          --   "port": 9260,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:peritador}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Gestory",
          --   "port": 9400,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:gestory}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "SimuladorFinanciero",
          --   "port": 9250,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:simuladorFinanciero}",
          --   "remoteRoot": "/home/node/app"
          -- },
          -- {
          --   "name": "Carmuv Backend",
          --   "port": 9100,
          --   "address": "localhost",
          --   "request": "attach",
          --   "type": "node",
          --   "localRoot": "${workspaceFolder:carmuv-backend}",
          --   "remoteRoot": "/home/node/app"
          -- }
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
