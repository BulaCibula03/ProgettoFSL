import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Docente {
  id?: number
  nominativo: string
  data_nascita: string
  luogo: string
  cf: string
  indirizzo: string
  email: string
  cell: string
  esterno: number
  ente: string
  tipo: string
}

export const useDocentiStore = defineStore('docenti', () => {
  const docenti = ref<Docente[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchDocenti() {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/src-php/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'docente' }),
      })
      const result = await response.json()
      if (result.success) {
        docenti.value = result.data
      } else {
        error.value = result.error
      }
    } catch (e) {
      error.value = 'Errore di connessione'
    } finally {
      loading.value = false
    }
  }

  async function createDocente(docente: Docente) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/src-php/create.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'docente',
          ...docente,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchDocenti()
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

  async function deleteDocente(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/src-php/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'docente',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchDocenti()
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
    docenti,
    loading,
    error,
    fetchDocenti,
    createDocente,
    deleteDocente,
  }
})
