module Dream.Store exposing (dreamDecoder)

import Json.Decode exposing ((:=))

import Dream.Types exposing (Dream)


dreamDecoder : Json.Decode.Decoder Dream
dreamDecoder =
  Json.Decode.object2 Dream
    ("id" := Json.Decode.int)
    ("content" := Json.Decode.string)
