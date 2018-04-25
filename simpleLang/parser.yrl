Nonterminals codigo funcoes funcao params param chamada expressao.

Terminals 
inteiro real ident
'+' '-' '*' '/' '(' ')' ','.

Rootsymbol codigo.

codigo -> '(' funcoes ')'       : '$2'.

funcoes -> funcao               : ['$1'].
funcoes -> funcao funcoes       : ['$1' | '$2'].

funcao -> ident '(' params ')'  : chamar('$1', '$3').
funcao -> ident '(' ')'         : chamar('$1').

params -> param                 : ['$1'].
params -> param ',' params      : ['$1' | '$3'].

param  -> funcao                : '$1'.
param  -> inteiro               : '$1'.
param  -> real                  : '$1'.
param  -> ident                 : '$1'.

Erlang code.

-import(helper, [avaliar/1]).

chamar(Fun, Arg) ->
    FunTraduzida = traduzir(Fun),
    avaliar("#{FunTraduzida}(#{Arg})").

traduzir("somar")   -> "lists:sum";
traduzir("mapear")  -> "lists:map";
traduzir("reduzir") -> "lists:reduce";
traduzir("filtrar") -> "lists:filter".