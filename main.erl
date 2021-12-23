-module(main).

-record(user, { id:: integer(),
                name:: string(),
                age:: integer(),
                country:: string(),
                city:: string() }).

-export([hello_world/0]).

hello_world() -> io:fwrite("Hello World!").