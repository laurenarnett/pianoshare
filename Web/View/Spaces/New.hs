module Web.View.Spaces.New where
import Web.View.Prelude

data NewView = NewView { space :: Space }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SpacesAction}>Spaces</a></li>
                <li class="breadcrumb-item active">New Space</li>
            </ol>
        </nav>
        <h1>New Space</h1>
        {renderForm space}
    |]

renderForm :: Space -> Html
renderForm space = formFor space [hsx|
    {(textField #title)}
    {(textareaField #summary) {fieldLabel = "Summary", helpText = "Describe your rehearsal space", placeholder="A gorgeous Steinway grand..."}}
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
