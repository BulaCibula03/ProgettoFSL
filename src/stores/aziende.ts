import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Azienda {
  id?: number
  nome: string
  natura: string
  comune_sl: string
  indirizzo_sl: string
  comune: string
  indirizzo: string
  cod_fiscale: string
  part_iva: string
  tel: string
  mail: string
  sito: string
  leg_rapp_nome: string
  leg_rapp_nato_a: string
  leg_rapp_dt: string
  leg_rapp_cf: string
  leg_tel: string
  leg_note: string
  note: string
  ateco: string
  check: number
  nproto: string
  dproto: string
  firma: number
  attiva: number
  prncct: string
  idDocente: number
  sportiva: number
  inglese: number
}

export const useAziendeStore = defineStore('aziende', () => {
  const aziende = ref<Azienda[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)
  const totalCount = ref(0)
  const currentPage = ref(0)
  const pageSize = ref(100)

  async function fetchAziende(limit: number = 100, offset: number = 0) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'azienda', limit, offset }),
      })
      const result = await response.json()
      if (result.success) {
        aziende.value = result.data
        totalCount.value = result.total
        currentPage.value = offset / limit
        pageSize.value = limit
      } else {
        error.value = result.error
      }
    } catch (e) {
      error.value = 'Errore di connessione'
    } finally {
      loading.value = false
    }
  }

  async function createAzienda(azienda: Azienda) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/create.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'azienda',
          ...azienda,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchAziende()
        return result.id
      } else {
        error.value = result.error
        return null
      }
    } catch (e) {
      error.value = 'Errore di connessione'
      return null
    } finally {
      loading.value = false
    }
  }

  async function deleteAzienda(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'azienda',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchAziende()
        return true
      } else {
        error.value = result.error
        return false
      }
    } catch (e) {
      error.value = 'Errore di connessione'
      return false
    } finally {
      loading.value = false
    }
  }
  return {
    aziende,
    loading,
    error,
    totalCount,
    currentPage,
    pageSize,
    fetchAziende,
    createAzienda,
    deleteAzienda,
  }
})
