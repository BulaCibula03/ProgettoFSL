import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Studente {
  id?: number
  cognome: string
  nome: string
  matricola: string
  cittadinanza: string
  sesso: string
  data_nascita: string
  cellulareAllievo: string
  cellulareEmergenza1: string
  cellulareEmergenza2: string
  email1: string
  email2: string
  idResidenza: number
  idNascita: number
  idGenitore1: number
  idGenitore2: number
  Classe1: number
  nRegistro1: number
  Classe2: number
  nRegistro2: number
}

export const useStudentiStore = defineStore('studenti', () => {
  const studenti = ref<Studente[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)
  const totalCount = ref(0)
  const currentPage = ref(0)
  const pageSize = ref(100)

  async function fetchStudenti(limit: number = 100, offset: number = 0) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'studente', limit, offset }),
      })
      const result = await response.json()
      if (result.success) {
        studenti.value = result.data
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

  async function createStudente(studente: Studente | null) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/create.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'studente',
          ...studente,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchStudenti()
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

  async function deleteStudente(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'studente',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchStudenti()
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
    studenti,
    loading,
    error,
    totalCount,
    currentPage,
    pageSize,
    fetchStudenti,
    createStudente,
    deleteStudente,
  }
})
