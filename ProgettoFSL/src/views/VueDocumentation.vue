<script setup lang="ts">
</script>

<template>
<<<<<<< HEAD
    <div class="documentazione">
        <h1>Documentazione</h1> <!--Funzionalità, introduzione-->
        <p>
            Benvenuto nella documentazione del progetto FSL Galileo.</br>
            In questa pagina troverai tutte le informazioni di funzionamento del progetto.</br> 
        </p>
        <h2>Funzionalità</h2>
        <p>
            Il progetto FSL Galileo è un programma per la gestione degli dati anagrafici della scuola e dei documenti FSL oltre anche quelli dei corsi scolastici.</br>
            Le principali funzionalità includono:</br>
            - Gestione degli studenti: inserimento, modifica, eliminazione e visualizzazione dei dati anagrafici degli studenti.</br>
            - Gestione degli docenti: inserimento, modifica, eliminazione e visualizzazione dei dati anagrafici degli docenti.</br>
            - Gestione dei dati per documenti FSL: inserimento, modifica, eliminazione e visualizzazione dei documenti FSL associati agli studenti.</br>
            - Gestione dei dati per corsi: inserimento, modifica, eliminazione e visualizzazione dei corsi scolastici frequentati dagli studenti.</br>
        </p>
        <h2>Interfaccia utente</h2>
        <img src="../assets/framework.jpeg" alt="Framework utilizzato" class="img-documentazione"><br>
        <p>
            Questa è la schermata delle tabelle caricate dal database su cui in base al livello di accesso è possibile effettuare operazioni specifiche.<br>
        </p>
        <img src="../assets/tabelle.jpeg" alt="Tabelle del database" class="img-documentazione"><br>
        <p>
            Questa è un menu a cascata che permette di visualizzare le tabelle dei dati.<br>
        </p>
        <img src="../assets/cerca.jpeg" alt="Barra di ricerca" class="img-documentazione"><br>
        <p>
            Questa è la barra di ricerca che permette di cercare in base a un criterio nella tabella selezionata.<br>
        </p>
        <img src="../assets/apertura.jpeg" alt="Apertura del database" class="img-documentazione"><br>
        <p>
            Questa è la sidebar che apre il menu a cascata per selezionare una tabella.<br>
        </p>
    </div>
=======
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
>>>>>>> 436767acb2c99a416bfd6ff0e4c824d3e34a920d
</template>