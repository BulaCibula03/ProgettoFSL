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

  async function fetchTirocini() {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/src-php/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'tirocinio' }),
      })
      const result = await response.json()
      if (result.success) {
        tirocini.value = result.data
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
      const response = await fetch('/src-php/delete.php', {
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
    fetchTirocini,
    deleteTirocinio,
  }
})
