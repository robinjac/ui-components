module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import List exposing (map)
import Maybe exposing (withDefault)
import Array exposing (get, fromList)
import Html exposing (Attribute)

type Msg = Increment | Decrement
type Pick = First | Last

main : Program () Int Msg
main =
  Browser.sandbox { init = 0, update = update, view = view }

update : Msg -> number -> number
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

getStyleTuple : (String, String) -> Attribute msg 
getStyleTuple (a, b) = style a b

getElement : Pick -> List String -> String
getElement pick list = 
  case pick of
    Last -> (withDefault "" (get 0 (fromList list)))
    First -> (withDefault "" (get 1 (fromList list)))

getStyleList : List String -> Attribute msg 
getStyleList list = style (getElement First list) (getElement Last list)

pageStyle = 
  [
    ("position", "absolute"),
    ("margin", "0"),
    ("width", "100%"),
    ("height", "100%")
  ]

clickerStyle = 
  [
    ["position", "absolute"],
    ["margin", "auto"],
    ["width", "50px"],
    ["height", "50px"],
    ["left", "0"],
    ["right", "0"],
    ["top", "0"],
    ["bottom", "0"]
  ]

view : Int -> Html Msg
view model =
  div (map getStyleTuple pageStyle) [
    div (map getStyleList clickerStyle)
      [ button [ onClick Decrement, style "width" "50px" ] [ text "-" ]
      , div [ style "width" "100%", style "text-align" "center" ] [ text (String.fromInt model) ]
      , button [ onClick Increment, style "width" "50px" ] [ text "+" ]
      ]
  ]