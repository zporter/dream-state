module Dream.New.State exposing (init, update, new)

import Dream.Types exposing (Msg(..))
import Dream.New.Types exposing (Dream)
import Dream.New.Store exposing (create)

new : Dream
new =
  { content = "" }

init : ( Dream, Cmd Msg )
init =
  ( new, Cmd.none )

update : Msg -> Dream -> ( Dream, Cmd Msg )
update msg dream =
  case msg of
    NoOp ->
      ( dream, Cmd.none )
    ChangeContent content ->
      ( { dream | content = content }, Cmd.none )
    Fail _ ->
      -- disregard error; do nothing
      ( dream, Cmd.none )
    CreateDone newDream ->
      init
    Create ->
      ( new, Dream.New.Store.create dream.content)
