# Snegle statistikk flutter

Hobby prosjekt for våren, Snegle Statistikk app! Hold kontroll på hvor mange brun snegler du har knerta iløpet av året, se hvor mange som er funnet i din kommune og ditt fylke, personlig statistikk, kommunal og fylkes statistikk. Ha konkurranse med naboen eller noen andre som er plaget av brun snegler!

Dette er en MVP så flere features og optimalisering av appen og backend er planlagt!

## Hvordan installere

    1 Last ned flutter

    2.1 Koble telefon til maskinen, telefonen må være i "developer" modus 
    2.2 Eller bruk en emulator.

    3 Kjør "flutter doctor" for å se at alt er som det skal. Hvis ja, kjør "flutter run"

## Data håndtering

All data som blir hentet er antall snegler funnet, kommune og fylke. Alle funn blir lagret lokalt i SQLite, og til Firebase Firestore. Lagres lokalt for å kunne lage brukerstatistikk, og i skyen for å kunne lage kommunal og fylkes statistikk.

## Om meg

Er ikke utvikler av yrke, så arkitektur og kode er ikke ideell, verken i Flutter appen eller APIet (et annet repo, privat foreløpig). Gjør noe vanskeligere enn det trenger for å lære litt mer også :) Dette skal være en app som er gratis uten reklamer og dritt! Er laget for gøy og for å teste meg selv og kanskje ha noe å vise til for en framtidig arbeidsgiver (ta kontakt om du vil snakke med meg om jobb mulighet rundt Bergen!).

## Mål videre

    * Redesign av arkitektur, bruke BLoC eller Provider for å holde rede på state i app.
    * Flere statistikker:
        - Funfacts:
            > Snitt fangst per dag i Norge
            > Dato for flest fangster i Norge
            > Kommune med flest fanster i Norge
            > Fylke med flest fangster i Norge
        - Års statistikk for kommuner og fylker
        - Måneds statistikk for kommuner og fylker
    * Legge til at man kan registrere om det er Regn, Sol eller Overskyet når       funnene ble gjort
    * Release i Play Store og Apple Store før våren, iallefall MVP for å teste.

Last ned, test og kom gjerne med feedback og forslag til features eller fixes!

Chris
