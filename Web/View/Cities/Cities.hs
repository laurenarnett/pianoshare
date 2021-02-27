module Web.View.Cities.Cities where
import Web.View.Prelude

data CitiesView = CitiesView { city :: Text }

instance View CitiesView where
  json CitiesView { .. } = toJSON ["nyc" :: Text, "ord", "grb", "bbbbbbbbbbbbbbbbbbbb"]
  html CitiesView { .. } = toHtml city
