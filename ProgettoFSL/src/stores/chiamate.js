import {useAziendeStore} from '../stores/aziende.ts';

const aziendeStore = useAziendeStore();

await aziendeStore.createAzienda({type: "azienda",
        nome: "Azienda di Test",
        natura: 1,
        comune_sl: 10,
        indirizzo_sl: "Via Roma 1",
        comune: 10,
        indirizzo: "Via Milano 5",
        cod_fiscale: "RSSMRA80A01F205X",
        part_iva: "12345678901",
        tel: "0123456789",
        mail: "info@azienda.it",
        sito: "https://azienda.it",
        leg_rapp_nome: "Mario Rossi",
        leg_rapp_nato_a: 10,
        leg_rapp_dt: "1980-01-01 00:00:00",
        leg_rapp_cf: "RSSMRA80A01F205X",
        leg_tel: "3331234567",
        leg_note: "",
        note: "",
        ateco: "47.11",
        check: 1,
        nproto: 123,
        dproto: "2024-01-01 00:00:00",
        firma: 1,
        attiva: 1,
        prncct: 0,
        idDocente: null,
        sportiva: 0,
        inglese: 0
});

window.aziendeStore = aziendeStore;