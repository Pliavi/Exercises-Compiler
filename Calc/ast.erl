-module(ast).
-author('pliavi.rpgm@gmail.com').

load() -> 
    leex:file('lexer.xrl'),
    yecc:file('parser.yrl').

generateAST(File) -> 
    {ok, Tokens, _} = lexer:string(File),
    parser:parse(Tokens).

main(File) ->
    load(),
    {ok, AST} = generateAST(File),
    genCode(AST).

genCode(AST) -> {error, "Not implemented yet"}.
