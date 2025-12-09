local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. project_name

local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"

-- NOTE: OS specific path
local launcher_jar = vim.fn.glob(mason_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = mason_path .. "/config_mac"
local lombok_path = mason_path .. "/lombok.jar"

return {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "/opt/homebrew/Cellar/openjdk@21/21.0.9/bin/java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx16g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- Lombok
    ("-javaagent:" .. lombok_path),

    -- 💀
    "-jar",
    launcher_jar,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    -- NOTE: OS specific path
    config_path,
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  -- root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }, { upward = true })[1]),
  -- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "build.gradle", "pom.xml", ".classpath" }, { upward = true })[1]),
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    settings = {
      -- Add java.imports.gradle.wrapper.checksums here.
      java = {
        imports = {
          gradle = {
            wrapper = {
              -- NOTE: Do not delete this example. Must be under init_options
              -- https://github.com/mfussenegger/nvim-jdtls/discussions/249
              checksums = {
                { sha256 = "214fe47206cf64eb73c8d97c65f66948eb02495d51bd23f3571243f130046a26", allowed = true },

                -- Snapchat repo...
                { sha256 = "4dd220c45b49bd48accb17494bfecc3768c61302535df18ba0152bb7a8e71b3e", allowed = true },
                { sha256 = "bddd317b75fb7e6e2c8df4a9879756cc6bc5263ba0b2f22850d4ba965d1c81e9", allowed = true },
                { sha256 = "16af81792edaee72aaa179d5d71edd45dc6ec133f260f73e9a6b8fdbafdb2d90", allowed = true },
                { sha256 = "16efbcce54872697104527eba1df8196157c90957f1b5fdd68727f13672997a5", allowed = true },
                { sha256 = "743ec4ea8c4d0a80efd86888c164eecdaa62850e013779661ce6c2a1f8e9dc7c", allowed = true },
                { sha256 = "0264b5d1980dda9d6bec55f5da5439a830e172a0801186db56fc9a142efaaa0b", allowed = true },
                { sha256 = "67d4f919f49c1995d2a9e7e68e18e560bd2d48cc320a77a184eb7bf998401033", allowed = true },
                { sha256 = "16efbcce54872697104527eba1df8196157c90957f1b5fdd68727f13672997a5", allowed = true },
                { sha256 = "16efbcce54872697104527eba1df8196157c90957f1b5fdd68727f13672997a5", allowed = true },
                { sha256 = "16efbcce54872697104527eba1df8196157c90957f1b5fdd68727f13672997a5", allowed = true },
                { sha256 = "ac8ec5e1b420558d1d9c7932324e0ab30a4b463b404cb067736b650e70d642b7", allowed = true },
              },
            },
          },
        },
      },
    },
  },
  settings = {
    java = {
      format = {
        -- See nvim-lint for Java configuration
        enabled = false,
        insertSpaces = false,
      },
      configuration = {
        -- Use Jdt* command to change the runtime
        -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home",
          },
          {
            name = "JavaSE-11",
            path = "/opt/homebrew/Cellar/openjdk@11/11.0.29/libexec/openjdk.jdk/Contents/Home",
            default = true,
          },
          {
            name = "JavaSE-17",
            path = "/opt/homebrew/Cellar/openjdk@17/17.0.17/libexec/openjdk.jdk/Contents/Home",
          },
          {
            name = "JavaSE-21",
            path = "/opt/homebrew/Cellar/openjdk@21/21.0.9/libexec/openjdk.jdk/Contents/Home",
          },
        },
      },
    },
  },
}
