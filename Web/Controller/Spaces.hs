module Web.Controller.Spaces where

import Web.Controller.Prelude
import Web.View.Spaces.Index
import Web.View.Spaces.New
import Web.View.Spaces.Edit
import Web.View.Spaces.Show

instance Controller SpacesController where
    action SpacesAction = do
        spaces <- query @Space |> fetch
        render IndexView { .. }

    action NewSpaceAction = do
        let space = newRecord
        render NewView { .. }

    action ShowSpaceAction { spaceId } = do
        space <- fetch spaceId
        render ShowView { .. }

    action EditSpaceAction { spaceId } = do
        space <- fetch spaceId
        render EditView { .. }

    action UpdateSpaceAction { spaceId } = do
        space <- fetch spaceId
        space
            |> buildSpace
            |> ifValid \case
                Left space -> render EditView { .. }
                Right space -> do
                    space <- space |> updateRecord
                    setSuccessMessage "Space updated"
                    redirectTo EditSpaceAction { .. }

    action CreateSpaceAction = do
        let space = newRecord @Space
        space
            |> buildSpace
            |> ifValid \case
                Left space -> render NewView { .. } 
                Right space -> do
                    space <- space |> createRecord
                    setSuccessMessage "Space created"
                    redirectTo SpacesAction

    action DeleteSpaceAction { spaceId } = do
        space <- fetch spaceId
        deleteRecord space
        setSuccessMessage "Space deleted"
        redirectTo SpacesAction

buildSpace space = space
    |> fill @["ownerId","summary","locality","administrativeArea","country","postalCode","thoroughfare","premise","price","latitude","longitude","spaceType"]
