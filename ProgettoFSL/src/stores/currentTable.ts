import { defineStore } from "pinia";
import { ref } from "vue";
import { useCorsiStore, useAziendeStore, useDocentiStore, useSlotStore, useTirociniStore, useStudentiStore} from "./index";

export const useCurrentTableStore = defineStore("currentTable", () => {
  const currentTable = ref<any>(useCorsiStore().corsi)
  function setCurrentTable(table: string){
    switch(table){
      case "Corsi": 
        currentTable.value = [...useCorsiStore().corsi]
        break
      case "Aziende": 
        currentTable.value = [...useAziendeStore().aziende]
        break
      case "Docenti": 
        currentTable.value = [...useDocentiStore().docenti]
        break
      case "Slot": 
        currentTable.value = [...useSlotStore().slot]
        break
      case "Tirocini": 
        currentTable.value = [...useTirociniStore().tirocini]
        break
      case "Studenti": 
        currentTable.value = [...useStudentiStore().studenti]
        break
    }
  }
  return { currentTable, setCurrentTable }
});
