; extends

(call_expression
	function: (identifier) @_name
	(#eq? @_name "sql")
	arguments: (template_string) @sql
)

(call_expression
	function: (identifier) @_name
	(#eq? @_name "html")
	arguments: (template_string) @html
)

