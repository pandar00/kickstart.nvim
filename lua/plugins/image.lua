return {
  -- Image viewer
  -- https://github.com/3rd/image.nvim?tab=readme-ov-file#quick-start-for-the-best-experience
  "3rd/image.nvim",
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  opts = {
    processor = "magick_cli",
    integrations = {
      markdown = {
        only_render_image_at_cursor = true,
        -- floating_windows = true,
        resolve_image_path = function(document_path, image_path, fallback)
          local obsidian_client = require("obsidian").get_client()
          -- local new_image_path = obsidian_client:vault_relative_path(image_path).filename
          local new_image_path = tostring(obsidian_client:vault_root():joinpath(image_path))

          if vim.fn.filereadable(new_image_path) == 1 then
            print("file exists at and readable")
            return new_image_path
          else
            print("fallback")
            return fallback(document_path, image_path)
          end
        end,
      },
    },
  },
}
