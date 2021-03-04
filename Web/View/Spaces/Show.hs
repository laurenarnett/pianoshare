module Web.View.Spaces.Show where
import Web.View.Prelude

data ShowView = ShowView { space :: Space, user :: User }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <h1>{get #summary space}</h1>
        <h2>{get #username user}'s Room</h2>
        <p>In {get #locality space}</p>
        <p>Posted {get #createdAt space |> timeAgo}</p>
    |]
