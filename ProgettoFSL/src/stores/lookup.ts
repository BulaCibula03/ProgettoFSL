import { defineStore } from 'pinia'
import { ref } from 'vue'

async function fetchLookup(type: string) {
  const response = await fetch('/api/read.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ type, limit: 9999, offset: 0 }),
  })
  const result = await response.json()
  return result.success ? result.data : []
}

export const useCorsoModoStore = defineStore('corsoModo', () => {
  const items = ref<{ idmodo: number; descr: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('corso_modo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useCorsoTipoStore = defineStore('corsoTipo', () => {
  const items = ref<{ idtipo: number; descr: string; ore: number }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('corso_tipo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useSlotTipoStore = defineStore('slotTipo', () => {
  const items = ref<{ id: number; descrizione: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('slottipo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useSlotImpiegoStore = defineStore('slotImpiego', () => {
  const items = ref<{ id: number; attivita: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('slotimpiego')
    loaded.value = true
  }
  return { items, fetch }
})

export const useAziendaTipoStore = defineStore('aziendaTipo', () => {
  const items = ref<{ id: number; natura: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('azienda_tipo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useDocenteTipoStore = defineStore('docenteTipo', () => {
  const items = ref<{ idD: number; tipo: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('docente_tipo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useComuneStore = defineStore('comune', () => {
  const items = ref<{ idComune: number; Comune: string; Provincia: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('comune')
    loaded.value = true
  }
  return { items, fetch }
})

export const useLuogoStore = defineStore('luogo', () => {
  const items = ref<{ id: number; indirizzo: string; città: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('luogo')
    loaded.value = true
  }
  return { items, fetch }
})

export const useFamigliaStore = defineStore('famiglia', () => {
  const items = ref<{ id: number; nome: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('famiglia')
    loaded.value = true
  }
  return { items, fetch }
})

export const useClassiStore = defineStore('classi', () => {
  const items = ref<{ id: number; indirizzo: string; sezione: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('classi')
    loaded.value = true
  }
  return { items, fetch }
})

export const useAziendeSelectStore = defineStore('aziendeSelect', () => {
  const items = ref<{ id: number; nome: string }[]>([])
  const loaded = ref(false)
  async function fetch() {
    if (loaded.value) return
    items.value = await fetchLookup('azienda')
    loaded.value = true
  }
  return { items, fetch }
})