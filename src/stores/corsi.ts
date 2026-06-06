import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Corso {
  id?: number
  idtipo: number
  idmodo: number
  annoScolastico: string
  descrizione: string
  data_inizio: string
  data_fine: string
  ore: number
  docente: string
  esterno: number
  note: string
  enteEsterno: string
}

export const useCorsiStore = defineStore('corsi', () => {
  const corsi = ref<Corso[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)
  const totalCount = ref(0)
  const currentPage = ref(0)
  const pageSize = ref(100)

  async function fetchCorsi(limit: number = 100, offset: number = 0) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'corso', limit, offset }),
      })
      const result = await response.json()
      if (result.success) {
        corsi.value = result.data
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

  async function createCorso(corso: Corso) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/create.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'corso',
          ...corso,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchCorsi()
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

  async function deleteCorso(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'corso',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchCorsi()
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
    corsi,
    loading,
    error,
    totalCount,
    currentPage,
    pageSize,
    fetchCorsi,
    createCorso,
    deleteCorso,
  }
})
