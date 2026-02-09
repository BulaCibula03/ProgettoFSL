import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useTablesStore = defineStore('tables', () => {
    const tables = ref<any | undefined>()
    function getTables(){
      //da fare
    }
    return { tables, getTables }
})

