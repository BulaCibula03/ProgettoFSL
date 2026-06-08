<script setup lang="ts">
/* ------- Virtual Scroller ------- */
import { RecycleScroller } from 'vue-virtual-scroller'
import 'vue-virtual-scroller/dist/vue-virtual-scroller.css'
import { ArrowLeft, ArrowRight } from 'lucide-vue-next'
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
const currentPage = ref(1)
const pageSize = 100
const visibleRows = computed(() => currentTableStore.currentTable)

const canGoToPreviousPage = computed(() => currentPage.value > 1)
const canGoToNextPage = computed(() => {
  const tableType = currentTableStore.currentTableType
  let totalCount = 0
  
  switch (tableType) {
    case 'Corsi':
      totalCount = corsiStore.totalCount
      break
    case 'Aziende':
      totalCount = aziendeStore.totalCount
      break
    case 'Docenti':
      totalCount = docentiStore.totalCount
      break
    case 'Slot':
      totalCount = slotStore.totalCount
      break
    case 'Tirocini':
      totalCount = tirociniStore.totalCount
      break
    case 'Studenti':
      totalCount = studentiStore.totalCount
      break
  }
  
  return (currentPage.value * pageSize) < totalCount
})

onMounted(() => {
  updateTableHeaders()
})

function updateTableHeaders() {
  if (currentTableStore.currentTable.length > 0) {
    const firstRow = currentTableStore.currentTable[0]
    tableHeaders.value = Object.keys(firstRow).filter(key => key !== 'id')
  }
}

watch(
  () => currentTableStore.currentTableType,
  () => {
    tableHeaders.value = []
    updateTableHeaders()
  }
)

watch(
  () => currentTableStore.currentTable,
  (newData) => {
    if (newData.length > 0) {
      updateTableHeaders()
    }
  },
  { immediate: true }
)

async function loadNextPage() {
  if (!canGoToNextPage.value) return
  
  const tableType = currentTableStore.currentTableType
  const nextPage = currentPage.value + 1
  const nextOffset = (nextPage - 1) * pageSize
  
  try {
    switch (tableType) {
      case 'Corsi':
        await corsiStore.fetchCorsi(pageSize, nextOffset)
        break
      case 'Aziende':
        await aziendeStore.fetchAziende(pageSize, nextOffset)
        break
      case 'Docenti':
        await docentiStore.fetchDocenti(pageSize, nextOffset)
        break
      case 'Slot':
        await slotStore.fetchSlots(pageSize, nextOffset)
        break
      case 'Tirocini':
        await tirociniStore.fetchTirocini(pageSize, nextOffset)
        break
      case 'Studenti':
        await studentiStore.fetchStudenti(pageSize, nextOffset)
        break
      default:
        console.error('Tabella non valida:', tableType)
    }
    currentPage.value = nextPage
  } catch (error) {
    console.error('Errore durante il caricamento della pagina successiva:', error)
  }
}

async function loadPreviousPage() {
  if (!canGoToPreviousPage.value) return
  
  const tableType = currentTableStore.currentTableType
  const previousPage = currentPage.value - 1
  const previousOffset = (previousPage - 1) * pageSize
  
  try {
    switch (tableType) {
      case 'Corsi':
        await corsiStore.fetchCorsi(pageSize, previousOffset)
        break
      case 'Aziende':
        await aziendeStore.fetchAziende(pageSize, previousOffset)
        break
      case 'Docenti':
        await docentiStore.fetchDocenti(pageSize, previousOffset)
        break
      case 'Slot':
        await slotStore.fetchSlots(pageSize, previousOffset)
        break
      case 'Tirocini':
        await tirociniStore.fetchTirocini(pageSize, previousOffset)
        break
      case 'Studenti':
        await studentiStore.fetchStudenti(pageSize, previousOffset)
        break
      default:
        console.error('Tabella non valida:', tableType)
    }
    currentPage.value = previousPage
  } catch (error) {
    console.error('Errore durante il caricamento della pagina precedente:', error)
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
  <div class="max-w-6xl mx-auto h-full px-4 py-6">
    <div class="rounded-lg border border-slate-700 bg-slate-900/50 shadow-lg flex flex-col h-[calc(100vh-10rem)] overflow-hidden">

      <!-- Wrapper con scroll orizzontale condiviso -->
      <div class="flex-1 overflow-x-auto overflow-y-hidden flex flex-col">
        
        <!-- Larghezza minima fissa per tutto -->
        <div class="min-w-max flex flex-col h-full">

          <!-- Header -->
          <div class="flex bg-slate-800 border-b border-slate-700 flex-shrink-0">
            <div v-for="header in tableHeaders" :key="header"
              class="w-44 flex-shrink-0 font-semibold text-slate-200 px-4 py-4 text-sm">
              {{ header }}
            </div>
            <div class="w-20 flex-shrink-0 font-semibold text-slate-200 px-4 py-4 text-right text-sm">
              Azioni
            </div>
          </div>

          <!-- Righe -->
          <RecycleScroller
            v-if="visibleRows.length > 0"
            :key="currentTableStore.currentTableType"
            :items="visibleRows"
            :item-size="56"
            key-field="id"
            class="flex-1 overflow-y-auto"
            style="min-width: max-content"
            @scroll-end="loadNextPage"
          >
            <template #default="{ item }">
              <div class="flex border-b border-slate-700 hover:bg-slate-800/50 transition-colors items-center h-14">
                <div v-for="header in tableHeaders" :key="header"
                  class="w-44 flex-shrink-0 px-4 py-3 text-slate-300 text-sm truncate">
                  <span v-if="(item as any)[header] !== null && (item as any)[header] !== undefined && (item as any)[header] !== ''">
                    {{ String((item as any)[header]).substring(0, 80) }}{{ String((item as any)[header]).length > 80 ? '…' : '' }}
                  </span>
                  <span v-else class="text-slate-500 italic">-</span>
                </div>
                <div class="w-20 flex-shrink-0 px-4 py-3 text-right text-white">
                  <DropdownMenu>
                    <DropdownMenuTrigger as-child>
                      <Button variant="ghost" size="sm"
                        class="h-8 w-8 p-0 hover:bg-white hover:text-red-400"
                        :disabled="isLoading">
                        <span class="sr-only">Apri menu</span>
                        <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                          <circle cx="10" cy="4"  r="1.5"/>
                          <circle cx="10" cy="10" r="1.5"/>
                          <circle cx="10" cy="16" r="1.5"/>
                        </svg>
                      </Button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent align="end" class="w-32 bg-slate-800 border-slate-700 text-slate-200">
                      <DropdownMenuItem
                        @click="deleteRow((item as any).id)"
                        class="cursor-pointer focus:bg-red-900/30 focus:text-red-400 text-red-400"
                        :disabled="isLoading">
                        Elimina
                      </DropdownMenuItem>
                      <!--<DropdownMenuItem
                        @click="modifyRow((item as any).id)"
                        class="cursor-pointer focus:bg-red-900/30 focus:text-red-400 text-red-400"
                        :disabled="isLoading">
                        Modifica
                      </DropdownMenuItem>-->
                    </DropdownMenuContent>
                  </DropdownMenu>
                </div>
              </div>
            </template>
          </RecycleScroller>

          <div v-else class="text-center py-8 text-slate-400 flex-1 flex items-center justify-center">
            Nessun dato disponibile
          </div>

        </div>
      </div>

      <!-- Footer -->
      <div class="bg-slate-800 border-t border-slate-700 flex-shrink-0 px-6 py-4 flex justify-between items-center">
        <span class="text-slate-200 font-medium text-sm">
          Totale Records: 
          <span class="text-slate-100 font-semibold">
            {{ 
              currentTableStore.currentTableType === 'Corsi' ? corsiStore.totalCount :
              currentTableStore.currentTableType === 'Aziende' ? aziendeStore.totalCount :
              currentTableStore.currentTableType === 'Docenti' ? docentiStore.totalCount :
              currentTableStore.currentTableType === 'Slot' ? slotStore.totalCount :
              currentTableStore.currentTableType === 'Tirocini' ? tirociniStore.totalCount :
              currentTableStore.currentTableType === 'Studenti' ? studentiStore.totalCount : 0
            }}
          </span>
        </span>
        <button 
          @click="loadPreviousPage" 
          :disabled="!canGoToPreviousPage || isLoading"
          class="p-2 rounded hover:bg-slate-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors">
          <ArrowLeft class="w-4 h-4" />
        </button>
        <span class="text-slate-200 font-medium text-sm">
          Pagina <span class="text-slate-100 font-semibold">{{ currentPage }}</span>
        </span>
        <button 
          @click="loadNextPage" 
          :disabled="!canGoToNextPage || isLoading"
          class="p-2 rounded hover:bg-slate-700 disabled:opacity-50 disabled:cursor-not-allowed transition-colors">
          <ArrowRight class="w-4 h-4" />
        </button>
      </div>
    </div>
  </div>
</template>