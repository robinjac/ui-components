port module Main exposing (..)
import Platform exposing (worker)

type Msg
    = Increment
    | Decrement
    | Nothing

init : () -> ( Int, Cmd Msg )
init () = ( 0, sendMessage 0 )

port sendMessage : Int -> Cmd msg

port messageReceiver : (String -> msg) -> Sub msg


main : Program () Int Msg
main = worker {init = init, update = update, subscriptions = subscriptions}

updateState : Int -> (Int, Cmd msg)
updateState model = (model, sendMessage model)

update : Msg -> Int -> (Int, Cmd msg)
update msg model =
    case msg of
        Increment ->
            updateState (model + 1)

        Decrement ->
            updateState (model - 1)

        Nothing ->
            updateState model


decode : String -> Msg
decode value =
    case value of
        "Increment" ->
            Increment

        "Decrement" ->
            Decrement

        _ ->
            Nothing


subscriptions : Int -> Sub Msg
subscriptions _ =
    messageReceiver decode
