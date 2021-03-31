module Web.View.Reservations.New where
import Web.View.Prelude

data NewView = NewView { reservation :: Reservation, space :: Space }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ReservationsAction}>Reservations</a></li>
                <li class="breadcrumb-item active">New Reservation</li>
            </ol>
        </nav>
        <h1>{get #title space}</h1>
        <h1>New Reservation</h1>
        {renderForm reservation}
    |]
      where
        renderForm :: Reservation -> Html
        renderForm reservation = formFor' reservation (pathTo (CreateReservationAction (get #id space))) [hsx|
            {(dateTimeField #startDatetime)}
            {submitButton}
        |]
