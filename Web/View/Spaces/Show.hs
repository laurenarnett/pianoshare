module Web.View.Spaces.Show where
import Web.View.Prelude

data ShowView = ShowView { space :: Space }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SpacesAction}>Spaces</a></li>
                <li class="breadcrumb-item active"><a href={UsersAction}>Users</a></li>
                <li class="breadcrumb-item active">Show Space</li>
            </ol>
        </nav>
        <h1>{get #ownerId space}'s Room</h1>
        <p>In {get #locality space}</p>
        <p>Posted {get #createdAt space |> timeAgo}</p>
    |]
