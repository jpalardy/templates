module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes as HA
import Html.Events as HE


type Msg
    = Increment
    | Decrement


type alias Model =
    { value : Int
    }



-------------------------------------------------


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
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
