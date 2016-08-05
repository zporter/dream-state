module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.App

import Types exposing (Model, Msg (DreamInputMsg))

import DreamInput.View exposing (view)

view : Model -> Html Msg
view model =
  div [ class "jumbotron" ] [
    div [ class "container" ] [
      siteHeader,
      Html.App.map DreamInputMsg <| DreamInput.View.view model.dreamInput
    ]
  ]

siteHeader : Html Msg
siteHeader =
  header [] [
    h1 [] [ text "Dream State" ],
    p [] [ text "Make your dreams come true!" ]
  ]
