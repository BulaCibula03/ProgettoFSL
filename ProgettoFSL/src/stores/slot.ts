import { defineStore } from 'pinia';
import { ref } from 'vue';

export interface Slot {
  id?: number
  idS?: number
  idAzienda: number
  annoScolastico: string
  datai: string
  dataf: string
  oreprev: number
  idtirocinio: number
  tipo: string
  impiego: string
  schi: number
  sinf: number
  smec: number
  slst: number
  note: string
  attivita: string
  idCreatore: number
}

export const useSlotStore = defineStore('slot', () => {
  const slot = ref<Slot[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)

  async function fetchSlots() {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/read.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type: 'slot' }),
      })
      const result = await response.json()
      if (result.success) {
        slot.value = result.data
      } else {
        error.value = result.error
      }
    } catch (e) {
      error.value = 'Errore di connessione'
    } finally {
      loading.value = false
    }
  }

  async function createSlot(slotData: Slot) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/create.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'slot',
          ...slotData,
        }),
      })
      const result = await response.json()
      if (result.success) {
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

  async function deleteSlot(id: number) {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/delete.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          type: 'slot',
          id,
        }),
      })
      const result = await response.json()
      if (result.success) {
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
    slot,
    loading,
    error,
    fetchSlots,
    createSlot,
    deleteSlot,
  }
})
