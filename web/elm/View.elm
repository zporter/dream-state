module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.App

import Types exposing (Model, Msg (DreamMsg))

import Dream.New.View as NewDream exposing (view)

view : Model -> Html Msg
view model =
  div [ class "jumbotron" ] [
    div [ class "container" ] [
      siteHeader,
      Html.App.map DreamMsg <| NewDream.view model.newDream
    ]
  ]

siteHeader : Html Msg
siteHeader =
  header [] [
    h1 [] [ text "Dream State" ],
    p [] [ text "Make your dreams come true!" ]
  ]
