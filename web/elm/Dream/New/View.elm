module Dream.New.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, required, value)
import Html.Events exposing (onClick, onInput)

import Dream.Types exposing (Msg(Create, ChangeContent))
import Dream.New.Types exposing (Dream)

view : Dream -> Html Msg
view dream =
  div [ class "input-group" ] [
    input [
      placeholder "What are you dreaming about?",
      required True,
      class "form-control",
      value dream.content,
      onInput ChangeContent
    ] [],
    span [ class "input-group-btn" ]
      [
        button [ class "btn btn-default", onClick Create ] [ text "Dream It!" ]
      ]
  ]
