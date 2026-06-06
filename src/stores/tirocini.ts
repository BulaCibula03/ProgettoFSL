import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Tirocinio {
  id?: number
  [key: string]: any
}

export const useTirociniStore = defineStore('tirocini', () => {
  const tirocini = ref<Tirocinio[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)
  const totalCount = ref(0)
  const currentPage = ref(0)
  const pageSize = ref(100)

  async function fetchTirocini(limit: number = 100, offset: number = 0) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'tirocinio', limit, offset }),
      })
      const result = await response.json()
      if (result.success) {
        tirocini.value = result.data
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

  async function deleteTirocinio(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'tirocinio',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
        await fetchTirocini()
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
    tirocini,
    loading,
    error,
    totalCount,
    currentPage,
    pageSize,
    fetchTirocini,
    deleteTirocinio,
  }
})
