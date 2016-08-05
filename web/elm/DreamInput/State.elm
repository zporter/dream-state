module DreamInput.State exposing (init, update, new)

import DreamInput.Types exposing (..)

new : DreamInput
new =
  { content = "" }

init : ( DreamInput, Cmd Msg )
init =
  ( new, Cmd.none )

update : Msg -> DreamInput -> ( DreamInput, Cmd Msg )
update msg dreamInput =
  case msg of
    NoOp ->
      ( dreamInput, Cmd.none )
    Fail _ ->
      -- disregard error; do nothing
      ( dreamInput, Cmd.none )
    CreateDone newDream ->
      init
    Create ->
      -- ( None, DreamInput.Store.create content)
      init
