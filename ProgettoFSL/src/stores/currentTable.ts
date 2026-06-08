import { defineStore } from "pinia";
import { computed, ref } from "vue";
import { useCorsiStore, useAziendeStore, useDocentiStore, useSlotStore, useTirociniStore, useStudentiStore} from "./index";

export const useCurrentTableStore = defineStore("currentTable", () => {
  const currentTableOG = ref<any>(useCorsiStore().corsi)
  const currentTableType = ref<string>("Corsi")
  const searchQuery = ref<string>("")

  const currentTable = computed(() => {
    const q = searchQuery.value.toLowerCase().trim()
    if (!q) return currentTableOG.value
    return currentTableOG.value.filter((row: any) =>
      Object.values(row).some((val: any) =>
        String(val).toLowerCase().includes(q)
      )
    )
  })

  function filterTable(query: string) {
    searchQuery.value = query
  }
  
  async function setCurrentTable(table: string){
    searchQuery.value = ""
    currentTableType.value = table
    switch(table){
      case "Corsi":
        currentTableOG.value = useCorsiStore().corsi
        break
      case "Aziende":
        currentTableOG.value = useAziendeStore().aziende
        break
      case "Docenti":
        currentTableOG.value = useDocentiStore().docenti
        break
      case "Slot":
        currentTableOG.value = useSlotStore().slot
        break
      case "Tirocini": 
        currentTableOG.value = useTirociniStore().tirocini
        break
      case "Studenti": 
        currentTableOG.value = useStudentiStore().studenti
        break
    }
  }
  return { currentTable, currentTableOG, currentTableType, filterTable, setCurrentTable }
});
