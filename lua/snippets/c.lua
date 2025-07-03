local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
	s("main", {
		t({
			"int main() {", -- primeira linha
			"  ", -- segunda linha (indentação)
		}),
		i(1), -- ponto de edição do corpo da função
		t({
			"", -- quebra de linha após o input
			"  return 0;",
			"}", -- fecha a função
		}),
	}),
}
