# Snegle statistikk flutter

Flutter frontend for SlugStatisticsAPI

Hvordan installere:
    - Last ned flutter
    - Koble telefon til maskinen, telefonen må være i "developer" modus - Eller bruk en emulator.
    - Kjør "flutter doctor" for å se at alt er som det skal. Hvis ja, kjør "flutter run"

Hobby prosjekt for våren, Snegle Statistikk app! Hold kontroll på hvor mange brun snegler du har knerta iløpet av året, se hvor mange som er funnet i din kommune og ditt fylke, personlig statistikk, kommunal og fylkes statistikk (framtidig feature). Ha konkurranse med naboen eller noen andre som er plaget av brun snegler!

Er ikke utvikler av yrke, så arkitektur og kode er ikke ideell, verken i Flutter appen eller APIet(et annet repo, privat foreløpig). Gjør noe vanskeligere enn det trenger for å lære litt mer også :)

All data som blir hentet er antall snegler funnet, kommune og fylke. Alle funn blir lagret lokalt i SQLite, og til Firebase Firestore. Lagres lokalt for å kunne lage brukerstatistikk,og i skyen for å kunne lage kommunal og fylkes statistikk.

Kom gjerne med feedback!

Chris
