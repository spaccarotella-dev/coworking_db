# Coworking DB – Spec Cliente

## Introduzione

Questo progetto nasce dalla richiesta di un cliente che gestisce uno **spazio di coworking**. L’obiettivo era creare un database per gestire **utenti, sale, prenotazioni e servizi extra**, mantenendo tutto organizzato e senza duplicati.
Il progetto si è evoluto seguendo le richieste del cliente passo passo.

---

## RICHIESTE DEL CLIENTE

### 1. Gestione utenti e sale

> “Le persone che vengono a lavorare da me si registrano, lasciandomi nome, cognome e un contatto email. Vorrei poterle distinguere una dall’altra senza confondermi.
>
> Nel coworking ho diverse sale, ognuna con un nome (tipo *Sala Blu*, *Sala Verde*) e una capienza massima.
>
> Chi è registrato può prenotare una sala per lavorare o fare riunioni. Quando qualcuno prenota, io devo sapere:
>
> * chi è la persona
> * quale sala usa
> * il giorno
> * a che ora inizia
> * a che ora finisce
>
> La stessa persona può prenotare più volte, anche la stessa sala in giorni diversi.
> Una sala può essere usata da persone diverse, in momenti diversi.
>
> Voglio poter sapere:
>
> * tutte le prenotazioni fatte da una persona
> * quando una sala è occupata”

---

### 2. Prevenzione duplicati e vincoli

> “Ora, quando una persona si registra, vorrei essere sicuro di non avere doppioni.
> Mi è già successo che la stessa persona si sia registrata due volte usando lo stesso contatto.
>
> Inoltre, non voglio che esistano due sale con lo stesso nome, altrimenti chi gestisce le prenotazioni sbaglia.
>
> Non voglio che la stessa sala venga prenotata due volte nello stesso giorno alla stessa ora di inizio.
> Se qualcuno prova a farlo, il sistema dovrebbe impedirlo.”

---

### 3. Servizi extra

> “Visto che ormai il coworking è partito, vorrei gestire anche i servizi extra, per esempio:
>
> * stampa
> * sala riunioni premium
> * armadietto personale
>
> Ogni servizio ha un nome e un prezzo.
> Gli utenti possono attivare più servizi, e lo stesso servizio può essere attivato da più utenti.
>
> Però c’è una regola importante:
>
> * lo stesso utente non può attivare due volte lo stesso servizio
>
> Voglio sapere:
>
> * quali servizi ha attivi un utente
> * quali utenti hanno attivato un certo servizio”

---

## Riassunto entità e vincoli principali

1. **UTENTE**

   * `id_utente` (PK)
   * nome
   * cognome
   * email (**UNIQUE**)

2. **SALA**

   * `id_sala` (PK)
   * nome_sala (**UNIQUE**)
   * capienza

3. **PRENOTAZIONE**

   * `id_prenotazione` (PK)
   * id_utente (FK → UTENTE)
   * id_sala (FK → SALA)
   * giorno
   * ora_inizio
   * ora_fine
   * **UNIQUE composta:** (`id_sala`, `giorno`, `ora_inizio`)

4. **SERVIZIO**

   * `id_servizio` (PK)
   * nome
   * prezzo

5. **UTENTE_SERVIZIO** (tabella ponte N–N)

   * id_utente (FK → UTENTE)
   * id_servizio (FK → SERVIZIO)
   * **PK composta:** (id_utente, id_servizio)
   * garantisce che lo stesso utente non attivi due volte lo stesso servizio
