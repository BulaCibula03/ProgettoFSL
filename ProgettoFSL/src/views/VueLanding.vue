<script setup lang="ts">
  import {
    Building2,
    Users,
    GraduationCap,
    ClipboardList,
    ArrowRight,
    BarChart3,
    BookOpen,
  } from 'lucide-vue-next'
</script>

<template>
    <div class="dark min-h-screen bg-background flex flex-col overflow-visible">
      <header class="border-b border-border bg-card sticky top-0 z-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex items-center justify-between h-16">
            <div class="flex items-center gap-3">
              <div>
                <h1 class="text-lg font-semibold text-foreground">Sistema Gestione PCTO</h1>
                <p class="text-xs text-muted-foreground">Percorsi Competenze Trasversali</p>
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
        <section class="py-16 px-4 sm:px-6 lg:px-8">
          <div class="max-w-7xl mx-auto">
            <div class="text-center max-w-3xl mx-auto mb-16">
              <div class="inline-block mb-4 px-3 py-1 bg-accent rounded-full text-xs font-medium text-accent-foreground">
                Piattaforma Intranet
              </div>
              <h2 class="text-4xl md:text-5xl font-bold text-foreground mb-4 leading-tight">
                Gestione Integrata dei PCTO
              </h2>
              <p class="text-lg text-muted-foreground leading-relaxed">
                Coordina in modo semplice ed efficiente gli studenti tirocinanti, le aziende partner, i docenti tutor e tutte le attività formative del percorso PCTO dell'istituto
              </p>
            </div>
  
            <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
              <div class="group bg-card border border-border rounded-lg p-6 hover:border-primary/30 hover:shadow-lg transition-all duration-300">
                <h3 class="text-lg font-semibold text-card-foreground mb-2">Studenti Tirocinanti</h3>
                <p class="text-sm text-muted-foreground">
                  Gestione completa delle anagrafiche, monitoraggio percorsi e storico formativo
                </p>
              </div>
  
              <div class="group bg-card border border-border rounded-lg p-6 hover:border-primary/30 hover:shadow-lg transition-all duration-300">
                <h3 class="text-lg font-semibold text-card-foreground mb-2">Aziende Partner</h3>
                <p class="text-sm text-muted-foreground">
                  Database aziende convenzionate con contatti, sedi, referenti e convenzioni attive
                </p>
              </div>
  
              <div class="group bg-card border border-border rounded-lg p-6 hover:border-primary/30 hover:shadow-lg transition-all duration-300">
                <h3 class="text-lg font-semibold text-card-foreground mb-2">Docenti Tutor</h3>
                <p class="text-sm text-muted-foreground">
                  Coordinamento insegnanti, assegnazione responsabilità e valutazioni studenti
                </p>
              </div>
  
              <div class="group bg-card border border-border rounded-lg p-6 hover:border-primary/30 hover:shadow-lg transition-all duration-300">
                <h3 class="text-lg font-semibold text-card-foreground mb-2">Attività PCTO</h3>
                <p class="text-sm text-muted-foreground">
                  Pianificazione, monitoraggio, rendicontazione e valutazione delle attività
                </p>
              </div>
            </div>
  
            <div class="bg-card border border-border rounded-lg p-8 mb-16">
              <div class="flex items-center gap-3 mb-8">
                <h3 class="text-2xl font-semibold text-card-foreground">Panoramica Istituto</h3>
              </div>
              <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
                <div class="p-4 bg-background rounded-lg border border-border/50">
                  <div class="text-4xl font-bold text-primary mb-2">342</div>
                  <div class="text-sm text-muted-foreground font-medium">Studenti Attivi</div>
                  <div class="text-xs text-muted-foreground/70 mt-1">In percorsi PCTO</div>
                </div>
                <div class="p-4 bg-background rounded-lg border border-border/50">
                  <div class="text-4xl font-bold text-primary mb-2">87</div>
                  <div class="text-sm text-muted-foreground font-medium">Aziende Convenzionate</div>
                  <div class="text-xs text-muted-foreground/70 mt-1">Partner attivi</div>
                </div>
                <div class="p-4 bg-background rounded-lg border border-border/50">
                  <div class="text-4xl font-bold text-primary mb-2">24</div>
                  <div class="text-sm text-muted-foreground font-medium">Docenti Tutor</div>
                  <div class="text-xs text-muted-foreground/70 mt-1">In servizio</div>
                </div>
                <div class="p-4 bg-background rounded-lg border border-border/50">
                  <div class="text-4xl font-bold text-primary mb-2">156</div>
                  <div class="text-sm text-muted-foreground font-medium">Tirocini in Corso</div>
                  <div class="text-xs text-muted-foreground/70 mt-1">Ore svolte</div>
                </div>
              </div>
            </div>
  
            <div class="grid md:grid-cols-2 gap-6 mb-16">
              <div class="bg-card border border-border rounded-lg p-8">
                <h3 class="text-xl font-semibold text-card-foreground mb-4">Funzionalità Principali</h3>
                <ul class="space-y-3">
                  <li class="flex items-start gap-3">
                    <div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5 animate-ping">
                      <div class="w-2 h-2 rounded-full bg-primary"></div>
                    </div>
                    <span class="text-sm text-muted-foreground">Archivio centralizzato studenti, aziende e docenti</span>
                  </li>
                  <li class="flex items-start gap-3">
                    <div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5 animate-ping">
                      <div class="w-2 h-2 rounded-full bg-primary"></div>
                    </div>
                    <span class="text-sm text-muted-foreground">Assegnazione e monitoraggio tirocini</span>
                  </li>
                  <li class="flex items-start gap-3">
                    <div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5 animate-ping">
                      <div class="w-2 h-2 rounded-full bg-primary"></div>
                    </div>
                    <span class="text-sm text-muted-foreground">Rendicontazione ore e attività svolte</span>
                  </li>
                  <li class="flex items-start gap-3">
                    <div class="w-5 h-5 rounded-full bg-primary/20 flex items-center justify-center flex-shrink-0 mt-0.5 animate-ping">
                      <div class="w-2 h-2 rounded-full bg-primary"></div>
                    </div>
                    <span class="text-sm text-muted-foreground">Valutazione e certificazione competenze</span>
                  </li>
                </ul>
              </div>
  
              <div class="bg-gradient-to-br from-primary/5 to-accent/5 border border-primary/10 rounded-lg p-8">
                <h3 class="text-xl font-semibold text-foreground mb-4">Per Chi è Questa Piattaforma</h3>
                <div class="space-y-3">
                  <div class="flex items-start gap-3">
                    <GraduationCap class="w-5 h-5 text-primary flex-shrink-0 mt-0.5" :stroke-width="2" />
                    <div>
                      <div class="text-sm font-medium text-foreground">Studenti</div>
                      <div class="text-xs text-muted-foreground">Visualizzazione percorsi e rendicontazione</div>
                    </div>
                  </div>
                  <div class="flex items-start gap-3">
                    <BookOpen class="w-5 h-5 text-primary flex-shrink-0 mt-0.5" :stroke-width="2" />
                    <div>
                      <div class="text-sm font-medium text-foreground">Docenti</div>
                      <div class="text-xs text-muted-foreground">Coordinamento e valutazione attività</div>
                    </div>
                  </div>
                  <div class="flex items-start gap-3">
                    <Building2 class="w-5 h-5 text-primary flex-shrink-0 mt-0.5" :stroke-width="2" />
                    <div>
                      <div class="text-sm font-medium text-foreground">Aziende</div>
                      <div class="text-xs text-muted-foreground">Gestione tirocinanti e comunicazioni</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
  
            <div class="bg-gradient-to-r from-primary to-primary/80 rounded-lg p-12 text-center text-primary-foreground">
              <h3 class="text-3xl font-semibold mb-4">Accedi Ora</h3>
              <p class="mb-6 max-w-2xl mx-auto text-primary-foreground/90">
                Gestisci tutte le attività PCTO dell'istituto in modo centralizzato, trasparente e efficiente
              </p>
              <RouterLink to='/login' class="px-8 py-3 bg-primary-foreground text-primary rounded-lg font-semibold hover:opacity-90 transition-opacity inline-flex items-center gap-2">
                Accedi al Sistema
                <ArrowRight class="w-5 h-5" :stroke-width="2" />
              </RouterLink>
            </div>
          </div>
        </section>
      </main>
  
      <footer class="border-t border-border bg-card">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
          <div class="flex flex-col sm:flex-row items-center justify-between text-sm text-muted-foreground">
            <div>
              <p>&copy; 2024 Sistema Gestione PCTO</p>
              <p class="text-xs text-muted-foreground/70">Piattaforma interna per percorsi competenze trasversali e orientamento</p>
            </div>
            <div class="mt-4 sm:mt-0">
              <p class="text-xs">Versione 1.0</p>
            </div>
          </div>
        </div>
      </footer>
    </div>
</template>