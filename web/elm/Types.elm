module Types exposing (..)

import DreamInput.Types exposing (DreamInput)

type alias Model =
  {
    dreamInput : DreamInput
  }

type Msg =
  NoOp
  | DreamInputMsg DreamInput.Types.Msg
