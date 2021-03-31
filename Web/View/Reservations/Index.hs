module Web.View.Reservations.Index where
import Web.View.Prelude

data IndexView = IndexView { reservations :: [Reservation] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ReservationsAction}>Reservations</a></li>
            </ol>
        </nav>
        <h1>Index</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Reservation</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach reservations renderReservation}</tbody>
            </table>
        </div>
    |]


renderReservation reservation = [hsx|
    <tr>
        <td>{reservation}</td>
        <td><a href={ShowReservationAction (get #id reservation)}>Show</a></td>
        <td><a href={EditReservationAction (get #id reservation)} class="text-muted">Edit</a></td>
        <td><a href={DeleteReservationAction (get #id reservation)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
