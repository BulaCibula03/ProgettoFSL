<script lang="ts">
export const description = "An inset sidebar with secondary navigation."
export const iframeHeight = "800px"
</script>

<script setup lang="ts">
import { computed, onMounted, ref, watch, nextTick } from "vue"
import { useCurrentTableStore } from "@/stores"
/* ------- Components ------- */
import EmptyTable from "@/components/EmptyTable.vue"
import Table from "@/components/Table.vue"
import { Input } from "@/components/ui/input"
import { Separator } from "@/components/ui/separator"
/* ------- Sidebar ------- */
import AppSidebar from "@/components/AppSidebar.vue"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"
/* ------- Code ------- */
const tableStore = useCurrentTableStore()
const loading = ref(false)
const ricerca = ref<string>('')

watch(ricerca, (val) => {
  tableStore.filterTable(val)
})

watch(
  () => tableStore.currentTable,
  async () => {
    await nextTick()
  }
)

onMounted(() => {
  // Caricamento iniziale
})

</script>

<template>
  <SidebarProvider class="dark">
    <AppSidebar class="h-screen"/>
    <SidebarInset>
      <header class="w-screen fixed flex h-16 bg-slate-950 shrink-0 items-center z-20">
        <div class="flex items-center gap-2 p-4 z-10">
          <SidebarTrigger class="-ml-1 text-white" />
          <Separator
            orientation="vertical"
            class="bg-white mr-2 data-[orientation=vertical]:h-4"
          />
        </div>
        <Input v-model="ricerca" placeholder="Cerca" class="text-white mr-3 max-w-255"/>
        <button class="text-white bg-slate-900 px-4 py-1.5 rounded-lg border-1 border-slate-800 mr-3 w-32"><i class="fa-solid fa-plus">+ Add</i></button>
      </header>
      <div class="overscroll-contain pt-18">
        <Table v-if="useCurrentTableStore().currentTable.length!==0"/>
        <EmptyTable v-else />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>
