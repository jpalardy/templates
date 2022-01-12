module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type Msg
    = Increment
    | Decrement


type alias Model =
    { value : Int
    }



{--
-------------------------------------------------
--}


init : Model
init =
    { value = 0 }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | value = model.value + 1 }

        Decrement ->
            { model | value = model.value - 1 }


view : Model -> Html Msg
view model =
    div [ class "center mt5 pa2 ba br4", style "width" "max-content" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , span [ class "pa2" ] [ text (String.fromInt model.value) ]
        , button [ onClick Increment ] [ text "+" ]
        ]



{--
-------------------------------------------------
--}


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
