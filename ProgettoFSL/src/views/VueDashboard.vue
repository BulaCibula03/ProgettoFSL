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
    <AppSidebar class="h-screen"/>
    <SidebarInset>
      <header class="flex h-16 shrink-0 items-center gap-2 pr-5 fixed">
        <div class="flex items-center gap-2 p-4">
          <SidebarTrigger class="-ml-1 text-white" />
          <Separator
            orientation="vertical"
            class="bg-white mr-2 data-[orientation=vertical]:h-4"
          />
        </div>
        <Input placeholder="Cerca" class="text-white"/>
      </header>
      <div class="pt-18 overscroll-contain">
        <Table />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>
