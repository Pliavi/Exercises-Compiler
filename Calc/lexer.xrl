Definitions.

D = [0-9]

Rules.

{D}+ :
    {token, {inteiro, TokenLine, list_to_integer(TokenChars)}}.

{D}+\.{D}+:
    {token, {real, TokenLine, list_to_float(TokenChars)}}.

\+ : {token, {'+', TokenLine}}.
\- : {token, {'-', TokenLine}}.
\* : {token, {'*', TokenLine}}.
\/ : {token, {'/', TokenLine}}.
\( : {token, {'(', TokenLine}}.
\) : {token, {')', TokenLine}}.

(.|\n) : skip_token.

Erlang code.