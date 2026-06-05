<script setup lang="ts">
</script>

<template>
<div class="dark min-h-screen bg-gray-950 flex flex-col overflow-visible">
  <div class="max-w-4xl mx-auto px-8 py-12 w-full">
    <h1 class="text-3xl font-bold text-white mb-2">Documentazione</h1>
    <div class="h-0.5 w-16 bg-blue-500 rounded-full mb-6"></div>
    <p class="text-slate-300 leading-relaxed mb-10">
      Benvenuto nella documentazione del progetto FSL Galileo.<br>
      In questa pagina troverai tutte le informazioni di funzionamento del progetto.
    </p>
    <h2 class="text-xl font-semibold text-white mb-4">Funzionalità</h2>
    <p class="text-slate-300 leading-relaxed mb-6">
      Il progetto FSL Galileo è un programma per la gestione degli dati anagrafici
      della scuola e dei documenti FSL oltre anche quelli dei corsi scolastici.
      Le principali funzionalità includono:
    </p>
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-12">
      <div class="bg-slate-800 border border-slate-700 rounded-xl p-5">
        <p class="text-blue-400 font-medium mb-1">Gestione Studenti</p>
        <p class="text-slate-400 text-sm leading-relaxed">
          Inserimento, modifica, eliminazione e visualizzazione dei dati anagrafici degli studenti.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl p-5">
        <p class="text-blue-400 font-medium mb-1">Gestione Docenti</p>
        <p class="text-slate-400 text-sm leading-relaxed">
          Inserimento, modifica, eliminazione e visualizzazione dei dati anagrafici dei docenti.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl p-5">
        <p class="text-blue-400 font-medium mb-1">Documenti FSL</p>
        <p class="text-slate-400 text-sm leading-relaxed">
          Inserimento, modifica, eliminazione e visualizzazione dei documenti FSL associati agli studenti.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl p-5">
        <p class="text-blue-400 font-medium mb-1">Gestione Corsi</p>
        <p class="text-slate-400 text-sm leading-relaxed">
          Inserimento, modifica, eliminazione e visualizzazione dei corsi scolastici frequentati dagli studenti.
        </p>
      </div>
    </div>
    <h2 class="text-xl font-semibold text-white mb-6">Interfaccia utente</h2>
    <div class="flex flex-col gap-6">
      <div class="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden">
        <img src="../assets/framework.jpeg" alt="Framework utilizzato" class="w-full object-cover">
        <p class="text-slate-400 text-sm px-5 py-4">
          Schermata delle tabelle caricate dal database: in base al livello di accesso
          è possibile effettuare operazioni specifiche.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden">
        <img src="../assets/tabelle.jpeg" alt="Tabelle del database" class="w-full object-cover">
        <p class="text-slate-400 text-sm px-5 py-4">
          Menu a cascata che permette di visualizzare le tabelle dei dati.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden">
        <img src="../assets/cerca.jpeg" alt="Barra di ricerca" class="w-full object-cover">
        <p class="text-slate-400 text-sm px-5 py-4">
          Barra di ricerca che permette di cercare in base a un criterio nella tabella selezionata.
        </p>
      </div>
      <div class="bg-slate-800 border border-slate-700 rounded-xl overflow-hidden">
        <img src="../assets/apertura.jpeg" alt="Apertura del database" class="w-full object-cover">
        <p class="text-slate-400 text-sm px-5 py-4">
          Sidebar che apre il menu a cascata per selezionare una tabella.
        </p>
      </div>
    </div>
  </div>
</div>
</template>