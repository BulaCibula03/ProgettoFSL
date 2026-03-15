import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Corso {
  id?: number
  idTipo: number
  idModo: number
  annoScolastico: string
  descrizione: string
  data_inizio: string
  data_fine: string
  ore: number
  docente: number
  esterno: number
  note: string
  enteEsterno: string
}

export const useCorsiStore = defineStore('corsi', () => {
  const corsi = ref<Corso[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchCorsi() {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/src-php/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'corso' }),
      })
      const result = await response.json()
      if (result.success) {
        corsi.value = result.data
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
    fetchCorsi,
    createCorso,
    deleteCorso,
  }
})
