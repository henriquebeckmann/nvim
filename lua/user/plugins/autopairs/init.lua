local autopair_ok, autopairs = pcall(require, "nvim-autopairs")
local cmp_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not autopair_ok and cmp_ok then
    return
end

autopairs.setup()
require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
