module DreamInput.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, placeholder, required, value)
import DreamInput.Types exposing (..)

view : DreamInput -> Html Msg
view dreamInput =
  div [ class "input-group" ] [
    input [
      placeholder "What are you dreaming about?",
      required True,
      class "form-control",
      value dreamInput.content
    ] [],
    span [ class "input-group-btn" ]
      [
        button [ class "btn btn-default" ] [ text "Dream It!" ]
      ]
  ]
