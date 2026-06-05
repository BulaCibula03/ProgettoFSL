<script setup lang="ts">
</script>

<template>
<<<<<<< HEAD
    <div class="dark min-h-screen bg-background flex flex-col overflow-visible"></div>
    <header class="border-b border-border bg-card sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex items-center justify-between h-16">
            <div class="flex items-left">
              <div>
                <h1 class="text-lg font-semibold text-foreground">Sistema Gestione FSL</h1>
                <p class="text-xs text-muted-foreground">Formazione Scuola-Lavoro</p>
              </div>
            </div>
            <div class="flex items-center gap-4">
              <div class="text-sm text-muted-foreground hidden sm:block">
                Accesso rapido
              </div>
              <RouterLink to='/login' class="px-4 py-2 bg-primary text-primary-foreground rounded-sm text-sm font-medium hover:opacity-90 transition-opacity">
                Accedi
              </RouterLink>
            </div>
          </div>
        </div>
      </header>
      <main class="flex-1">
        <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
          <div class="px-4 py-6 sm:px-0">
            <div class="border-4 border-dashed border-border rounded-lg h-96 flex items-center justify-center">
              <h2 class="text-xl font-semibold text-muted-foreground">Documentazione</h2>
            </div>
            <div class="mt-6">
              <p class="text-sm text-muted-foreground"></p>
            </div>
          </div>
        </div>
      </main>
=======
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
>>>>>>> 4ecb5e23f1e3fed08182568b1260a70caea3145e
</template>