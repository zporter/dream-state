module Main exposing (..)

import Html.App
import State exposing (init, update, subscriptions)
import View exposing (view)

-- main function
main : Program Never
main =
  Html.App.program
    {
      init          = init,
      update        = update,
      view          = view,
      subscriptions = subscriptions
    }
