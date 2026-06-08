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

const filteredData = computed(() => {
  const q = ricerca.value.toLowerCase().trim()
  if (!q) return tableStore.currentTable
  return tableStore.currentTable.filter((row: any) =>
    Object.values(row).some((val: any) =>
      String(val).toLowerCase().includes(q)
    )
  )
})

watch(() => tableStore.currentTable, async () => { await nextTick() })

onMounted(() => {})
</script>

<template>
  <SidebarProvider class="dark">
    <AppSidebar class="h-screen"/>
    <SidebarInset class="overflow-hidden">
      <header class="sticky top-0 flex h-16 bg-slate-950 shrink-0 items-center z-20">
        <div class="flex items-center gap-2 p-4 z-10">
          <SidebarTrigger class="-ml-1 text-white" />
          <Separator
            orientation="vertical"
            class="bg-white mr-2 data-[orientation=vertical]:h-4"
          />
        </div>
        <Input v-model="ricerca" placeholder="Cerca" class="text-white grow"/>
      </header>
      <div class="overflow-hidden">
        <Table v-if="tableStore.currentTable.length !== 0" :rows="filteredData" />
        <EmptyTable v-else />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>