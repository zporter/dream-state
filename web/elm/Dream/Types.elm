module Dream.Types exposing (..)

import Http

type alias Dream =
  {
    id      : Int,
    content : String
  }

type Msg =
  NoOp
  | ChangeContent String
  | Fail Http.Error
  | CreateDone Dream
  | Create
