local function package_root(path)
  return vim.fs.root(path, { "package.json" }) or vim.uv.cwd()
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "rcasia/neotest-java",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      -- Each JavaScript package is its own test root. This avoids a root-level
      -- Jest/Vitest command scanning the entire monorepo.
      opts.adapters["neotest-jest"] = {
        cwd = package_root,
        jest_test_discovery = false,
      }
      opts.adapters["neotest-vitest"] = {
        filter_dir = function(name)
          return name ~= "node_modules" and name ~= ".git" and name ~= "dist" and name ~= "build"
        end,
      }
      opts.adapters["neotest-java"] = {
        incremental_build = true,
      }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- A single JDTLS process per repository is required for reliable
      -- multi-module Gradle/Maven test discovery and debugging.
      opts.root_dir = function(path)
        return vim.fs.root(path, { ".git", "gradlew", "mvnw", "settings.gradle", "settings.gradle.kts" })
      end
    end,
  },
}
