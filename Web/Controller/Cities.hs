module Web.Controller.Cities where
import Web.Controller.Prelude
import Web.View.Cities.Cities

instance Controller CitiesController where
    action CitiesAction = do
      let city = param @Text "q"
      renderJson (toJSON ["New York" :: Text, "Boston", "DC"])
