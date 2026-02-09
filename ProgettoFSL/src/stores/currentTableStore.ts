import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useCurrentTableStore = defineStore('currentTable', () => {
  const currentTable = ref<any | undefined>()
  function setCurrentTable(table: any){
    //da fare
  }
  return { currentTable, setCurrentTable }
})

