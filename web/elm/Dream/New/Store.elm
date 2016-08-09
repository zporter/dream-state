module Dream.New.Store exposing (..)

import Json.Encode
import String
import Task

import Store exposing (apiUrl, postJson)
import Dream.Types exposing (Msg(Fail, CreateDone))
import Dream.Store exposing (dreamDecoder)

resourceUrl : String
resourceUrl =
  String.join "/" [ apiUrl, "dream" ]


--
-- Encoding
--

dreamEncoder : String -> Json.Encode.Value
dreamEncoder content =
  let
    encodings =
      [
       ( "dream", Json.Encode.object [
         ( "content", Json.Encode.string content )
       ])
      ]
  in
    encodings
      |> Json.Encode.object


--
-- Create
--

-- create dream
create : String -> Cmd Msg
create content =
  dreamEncoder content
    |> Store.postJson dreamDecoder resourceUrl
    |> Task.perform Fail CreateDone
