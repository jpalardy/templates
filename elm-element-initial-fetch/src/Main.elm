module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


type Msg
    = Increment
    | Decrement
    | GotValue (Result Http.Error Int)


type alias Model =
    { value : Int
    }



-------------------------------------------------


getStartValue : Cmd Msg
getStartValue =
    let
        valueDecoder =
            Decode.field "start" Decode.int
    in
    Http.get
        { url = "value.json"
        , expect = Http.expectJson GotValue valueDecoder
        }



-------------------------------------------------


init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = 0 }, getStartValue )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | value = model.value + 1 }, Cmd.none )

        Decrement ->
            ( { model | value = model.value - 1 }, Cmd.none )

        GotValue (Ok value) ->
            ( { model | value = value }, Cmd.none )

        GotValue (Err _) ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "center mt5 pa2 ba br4", style "width" "max-content" ]
        [ button [ onClick Decrement ] [ text "-" ]
        , span [ class "pa2" ] [ text (String.fromInt model.value) ]
        , button [ onClick Increment ] [ text "+" ]
        ]



-------------------------------------------------


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
