module DreamInput.Types exposing (..)

import Http

type alias DreamInput =
  {
    content : String
  }

type Msg =
  NoOp
  | Fail Http.Error
  | CreateDone DreamInput
  | Create
