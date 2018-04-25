Nonterminals op_soma op_mult op_unario numero expressao bloco.

Terminals 
inteiro real
'+' '-' '*' '/' '(' ')'.

Rootsymbol expressao.

% Não vou usar ainda
Right 10 '='.

Left  20 op_soma.
Left  30 op_mult.
Unary 40 op_unario.

op_soma   -> '+'        : '$1'.
op_soma   -> '-'        : '$1'.
op_mult   -> '*'        : '$1'.
op_mult   -> '/'        : '$1'.
op_unario -> '-' '-'    : '$1'.
op_unario -> '+' '+'    : '$1'.
op_unario -> '-'        : '$1'.
op_unario -> '+'        : '$1'.

numero -> inteiro       : '$1'.
numero -> real          : '$1'.

expressao -> bloco                      : '$1'.
expressao -> expressao op_soma bloco    : {'$2', '$1', '$3'}.
expressao -> expressao op_mult bloco    : {'$2', '$1', '$3'}.

bloco -> '(' expressao ')'    : '$2'.
bloco -> op_unario numero     : '$1'.
bloco -> numero               : '$1'.