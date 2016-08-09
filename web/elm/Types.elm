module Types exposing (..)

import Dream.Types exposing (Msg)
import Dream.New.Types as NewDream exposing (Dream)

type alias Model =
  {
    newDream : NewDream.Dream
  }

type Msg =
  NoOp
  | DreamMsg Dream.Types.Msg
