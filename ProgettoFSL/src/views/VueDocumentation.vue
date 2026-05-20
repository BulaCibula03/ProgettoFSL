<script setup lang="ts">
</script>

<template>
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
</template>