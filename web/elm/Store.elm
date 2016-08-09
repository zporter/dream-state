module Store exposing (..)

import Json.Decode
import Json.Encode
import Http


-- this is a "record type", which is essentially a composable record
-- see http://elm-lang.org/docs/records and scroll to the bottom
-- it says "I match any record as long as it has an integer id field"
type alias RecordWithId a =
  { a | id : Int }


-- Base API URL
apiUrl : String
apiUrl =
  "/api"


-- merge a new RecordWithId into an existing list of RecordWithIds,
-- replacing the old RecordWithId(s) that have the same id,
-- or if there aren't any existing then append it to the end
mergeById : List (RecordWithId a) -> (RecordWithId a) -> List (RecordWithId a)
mergeById existing new =
  let
    -- first, this is the reducing function.
    -- it takes an arbitrary existing record and compares
    -- it with the new record to be merged in, then decides
    -- if it should be replaced with the new record.
    -- it also tracks if that replacement has been made yet (found)
    merger =
      -- this is an anonymous function
      \candidate (found, els) ->
        if new.id == candidate.id then
          -- mark as found, disregard old (candidate) by conssing new
          -- to "cons" means to add to the head of the list
          ( True, new :: els )
        else
          -- doesn't match, so just include it as-is
          ( found, candidate :: els )

    -- destructure the result of the reduction
    (found, coalesced) =
      -- foldl is the same as "reduce" in js, lisp, etc
      -- there is also List.foldr for reducing from the right
      List.foldl merger (False, []) existing

    -- if a replacement wasn't already made, then just cons the new one
    newListReversed =
      if found then coalesced else new :: coalesced
  in
    -- since the cons operator (::) adds to the head of the list,
    -- our original list is now in reverse. let's reverse it back to normal
    List.reverse newListReversed


-- Http supplies a util to post already, but it uses a plaintext
-- content-type header, while we are sending json to our server.
-- to make a reqest, we need a "decoder" to decode the return value,
-- a url to make the request to, and a json value to send as the body
postJson : Json.Decode.Decoder value -> String -> Json.Encode.Value -> Platform.Task Http.Error value
postJson decoder url json =
  let
    body =
      json
        -- encode json value into a String using 0 indent
        |> Json.Encode.encode 0
        -- convert String into an Http.Body
        |> Http.string

    request =
      { verb = "POST"
      , headers = [ ("Content-Type", "application/json") ]
      , url = url
      , body = body
      }
  in
    request
      |> Http.send Http.defaultSettings
      |> Http.fromJson decoder
