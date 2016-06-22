module Main exposing (..)

import Html.App as App
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, style)

main =
  App.beginnerProgram
    { model = model
    , update = update
    , view = view
    }


-- model

type alias Model = Int

model : Model
model = 0


-- update

type Msg
  = Increment
  | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

-- view

view : Model -> Html Msg
view model =
  div [ class "ionic" ]
    [ header
    , contentContainer (content model)
    ]

content model =
  div [ class "list list-inset" ]
    [ div [ class "row", style [("text-align", "center")] ]
      [ div [ class "col" ] [ button [ onClick Decrement, class "button" ] [ text "-" ] ]
      , div [ class "col col-center col-50"  ] [ text (toString model) ]
      , div [ class "col" ] [  button [ onClick Increment, class "button" ] [ text "+" ] ]
      ]
    ]

contentContainer inside =
  div [ class "scroll-content ionic-scroll has-header scroll-content-false" ]
    [ inside ]

header =
  div [ class "bar bar-header bar-positive" ]
    [ h1 [ class "title" ] [ text "Counter.elm" ]
    ]

