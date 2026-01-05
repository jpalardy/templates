module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes as HA
import Html.Events as HE
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
    let
        btn text event =
            Html.button
                [ HA.class "px-2 py-1 border rounded bg-gray-200 hover:bg-gray-300"
                , HE.onClick event
                ]
                [ Html.text text ]
    in
    Html.div [ HA.class "w-fit mx-auto mt-9 p-2 border rounded" ]
        [ btn "-" Decrement
        , Html.span [ HA.class "inline-block text-center p-2 w-[3rem]" ] [ Html.text (String.fromInt model.value) ]
        , btn "+" Increment
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
