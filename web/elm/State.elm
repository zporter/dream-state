module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg (NoOp, DreamInputMsg))

import DreamInput.State exposing (init, update, new)

init : (Model, Cmd Msg)
init =
  let
    model = Model DreamInput.State.new
    cmds  = Cmd.none
  in
    (model, cmds)

update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
  case action of
    NoOp ->
      ( model, Cmd.none )

    DreamInputMsg msg ->
      let
        (newDreamInput, cmd) =
          DreamInput.State.update msg model.dreamInput
        newModel =
          { model | dreamInput = newDreamInput }
      in
        (newModel, Cmd.map DreamInputMsg cmd)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
