import { defineStore } from 'pinia';
import { ref } from 'vue';
import moment from 'moment';

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
  const totalCount = ref(0)
  const currentPage = ref(0)
  const pageSize = ref(100)

  async function fetchDocenti(limit: number = 100, offset: number = 0) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'docente', limit, offset }),
      })
      const result = await response.json()
      if (result.success) {
        docenti.value = result.data
        totalCount.value = result.total
        currentPage.value = offset / limit
        pageSize.value = limit
        let docente: any
        for(docente in docenti.value){
          docente.data_nascita = moment(docente.data_nascita).format('YYYY-MM-DD, hh:mm:ss')
        }
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
      const response = await fetch('/api/create.php', {
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
      const response = await fetch('/api/delete.php', {
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
    totalCount,
    currentPage,
    pageSize,
    fetchDocenti,
    createDocente,
    deleteDocente,
  }
})
