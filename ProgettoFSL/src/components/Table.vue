<script setup lang="ts">
/* ------- Virtual Scroller ------- */
import { RecycleScroller } from 'vue-virtual-scroller'
import 'vue-virtual-scroller/dist/vue-virtual-scroller.css'
/* ------- Table Components ------- */
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Button } from '@/components/ui/button'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
/* ----- Stores ----- */
import { useCurrentTableStore } from '@/stores/index'
import { useStudentiStore } from '@/stores/studenti'
import { useDocentiStore } from '@/stores/docenti'
import { useCorsiStore } from '@/stores/corsi'
import { useAziendeStore } from '@/stores/aziende'
import { useTirociniStore } from '@/stores/tirocini'
import { useSlotStore } from '@/stores/slot'
import { onMounted, ref, watch, computed } from 'vue'

const currentTableStore = useCurrentTableStore()
const studentiStore = useStudentiStore()
const docentiStore = useDocentiStore()
const corsiStore = useCorsiStore()
const aziendeStore = useAziendeStore()
const tirociniStore = useTirociniStore()
const slotStore = useSlotStore()

const tableHeaders = ref<string[]>([])
const isLoading = ref(false)
const currentPage = ref(0)
const pageSize = 100
const visibleRows = computed(() => currentTableStore.currentTable)

onMounted(() => {
  updateTableHeaders()
})

function updateTableHeaders() {
  if (currentTableStore.currentTable.length > 0) {
    const firstRow = currentTableStore.currentTable[0]
    tableHeaders.value = Object.keys(firstRow).filter(key => key !== 'id')
  }
}

async function loadNextPage() {
  const tableType = currentTableStore.currentTableType
  const nextOffset = (currentPage.value + 1) * pageSize
  
  try {
    if (tableType === 'Slot' && nextOffset < slotStore.totalCount) {
      await slotStore.fetchSlots(pageSize, nextOffset)
      currentPage.value += 1
    }
  } catch (error) {
    console.error('Errore durante il caricamento della pagina successiva:', error)
  }
}

async function deleteRow(id: number) {
  isLoading.value = true
  try {
    const tableType = currentTableStore.currentTableType
    let success = false

    switch(tableType) {
      case 'Studenti':
        success = await studentiStore.deleteStudente(id)
        break
      case 'Docenti':
        success = await docentiStore.deleteDocente(id)
        break
      case 'Corsi':
        success = await corsiStore.deleteCorso(id)
        break
      case 'Aziende':
        success = await aziendeStore.deleteAzienda(id)
        break
      case 'Tirocini':
        success = await tirociniStore.deleteTirocinio(id)
        break
      case 'Slot':
        success = await slotStore.deleteSlot(id)
        break
    }

    if (success) {
      updateTableHeaders()
    }
  } catch (error) {
    console.error('Errore durante l\'eliminazione:', error)
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <div class="w-full p-6 space-y-4">
    <div class="rounded-lg border border-slate-700 bg-slate-900/50 overflow-hidden shadow-lg h-[calc(100vh-16rem)] flex flex-col">
      <Table class="text-slate-300 w-full flex-1 flex flex-col">
        <TableHeader class="bg-slate-800 hover:bg-slate-800 border-b border-slate-700 sticky top-0 z-5 flex-shrink-0">
          <TableRow>
            <TableHead v-for="header in tableHeaders" :key="header" class="font-semibold text-slate-200 px-6 py-4">
              {{ header }}
            </TableHead>
            <TableHead class="font-semibold text-slate-200 px-6 py-4 text-right">Azioni</TableHead>
          </TableRow>
        </TableHeader>
        
        <RecycleScroller 
          v-if="visibleRows.length > 0"
          :items="visibleRows"
          :item-size="65"
          class="flex-1 overflow-y-auto"
          @scroll-end="loadNextPage"
        >
          <template #default="{ item }">
            <TableRow 
              class="border-b border-slate-700 hover:bg-slate-800/50 transition-colors h-16"
            >
              <TableCell 
                v-for="header in tableHeaders" 
                :key="header"
                class="px-6 py-4 text-slate-300"
              >
                <span v-if="(item as any)[header]" class="truncate max-w-xs inline-block">
                  {{ String((item as any)[header]).substring(0, 100) }}{{ String((item as any)[header]).length > 100 ? '...' : '' }}
                </span>
                <span v-else class="text-slate-500 italic">-</span>
              </TableCell>
              <TableCell class="px-6 py-4 text-right">
                <DropdownMenu>
                  <DropdownMenuTrigger as-child>
                    <Button 
                      variant="ghost" 
                      size="sm"
                      class="h-8 w-8 p-0 hover:bg-slate-700 hover:text-red-400"
                      :disabled="isLoading"
                    >
                      <span class="sr-only">Apri menu</span>
                      <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10.5 1.5H9.5V3h1V1.5zM10.5 16h-1v1.5h1V16zM16 9.5v1h1.5v-1H16zM1.5 10.5H3v-1H1.5v1z"/>
                        <circle cx="10" cy="10" r="1.5"/>
                      </svg>
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end" class="w-32 bg-slate-800 border-slate-700 text-slate-200">
                    <DropdownMenuItem 
                      @click="deleteRow((item as any).id)"
                      class="cursor-pointer focus:bg-red-900/30 focus:text-red-400 text-red-400"
                      :disabled="isLoading"
                    >
                      Elimina
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              </TableCell>
            </TableRow>
          </template>
        </RecycleScroller>

        <div v-else class="text-center py-8 text-slate-400 flex-1 flex items-center justify-center">
          Nessun dato disponibile
        </div>

        <TableFooter class="bg-slate-800 border-t border-slate-700 flex-shrink-0">
          <TableRow>
            <TableCell :colspan="tableHeaders.length + 1" class="px-6 py-4">
              <div class="flex justify-between items-center">
                <span class="text-slate-200 font-medium">Righe Totali</span>
                <span class="text-slate-100 font-semibold">{{ currentTableStore.currentTable.length }} / {{ slotStore.totalCount || currentTableStore.currentTable.length }}</span>
              </div>
            </TableCell>
          </TableRow>
        </TableFooter>
      </Table>
    </div>
  </div>
</template>

