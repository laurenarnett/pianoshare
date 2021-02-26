module Web.View.Spaces.Edit where
import Web.View.Prelude

data EditView = EditView { space :: Space }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SpacesAction}>Spaces</a></li>
                <li class="breadcrumb-item active">Edit Space</li>
            </ol>
        </nav>
        <h1>Edit Space</h1>
        {renderForm space}
    |]

renderForm :: Space -> Html
renderForm space = formFor space [hsx|
    {(textField #ownerId)}
    {(textField #summary)}
    {(textField #locality)}
    {(textField #administrativeArea)}
    {(textField #country)}
    {(textField #postalCode)}
    {(textField #thoroughfare)}
    {(textField #premise)}
    {(textField #price)}
    {(textField #latitude)}
    {(textField #longitude)}
    {(textField #spaceType)}
    {submitButton}
|]
