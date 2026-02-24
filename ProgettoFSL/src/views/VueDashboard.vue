<script lang="ts">
export const description = "An inset sidebar with secondary navigation."
export const iframeHeight = "800px"
</script>

<script setup lang="ts">
import { onMounted, ref } from "vue"
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
onMounted(() => {
  //da fare
})
const loading = ref(false)
</script>

<template>
  <SidebarProvider class="dark">
    <AppSidebar />
    <SidebarInset>
      <header class="flex h-16 shrink-0 items-center gap-2 pr-5">
        <div class="flex items-center gap-2 p-4">
          <SidebarTrigger class="-ml-1 text-white" />
          <Separator
            orientation="vertical"
            class="bg-white mr-2 data-[orientation=vertical]:h-4"
          />
        </div>
        <Input placeholder="Cerca" class="text-white"/>
      </header>
      <div v-if="loading" class="animate-pulse flex flex-1 flex-col gap-4 p-4 pt-0">
        <div class="grid auto-rows-min gap-4 md:grid-cols-3">
          <div class="bg-muted/50 aspect-video rounded-xl" />
          <div class="bg-muted/50 aspect-video rounded-xl" />
          <div class="bg-muted/50 aspect-video rounded-xl" />
        </div>
        <div class="bg-muted/50 min-h-[100vh] flex-1 rounded-xl md:min-h-min" />
      </div>
      <div v-else-if="tables===undefined" class="flex grow">
        <EmptyTable />
      </div>
      <div v-else>
        <Table />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>
