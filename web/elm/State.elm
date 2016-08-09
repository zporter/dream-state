module State exposing (init, update, subscriptions)

import Types exposing (Model, Msg (NoOp, DreamMsg))

import Dream.New.State as NewDream exposing (init, update, new)

init : (Model, Cmd Msg)
init =
  let
    model = Model NewDream.new
    cmds  = Cmd.none
  in
    (model, cmds)

update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
  case action of
    NoOp ->
      ( model, Cmd.none )

    DreamMsg msg ->
      let
        (newDream, cmd) =
          NewDream.update msg model.newDream
        newModel =
          { model | newDream = newDream }
      in
        (newModel, Cmd.map DreamMsg cmd)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
