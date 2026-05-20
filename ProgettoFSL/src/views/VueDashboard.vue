<script lang="ts">
export const description = "An inset sidebar with secondary navigation."
export const iframeHeight = "800px"
</script>

<script setup lang="ts">
import { onMounted, ref } from "vue"
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
onMounted(() => {
  
})
const loading = ref(false)
const ricerca = ref<string>('');
function cerca(query: string) {
  const q = query.toLowerCase().trim();

  if (!q) {
    this.titles = this.allTitles;
    return;
  }
  this.titles = this.allTitles.filter(
    (t) =>
        t.primary_title.toLowerCase().includes(q) ||
        t.original_title.toLowerCase().includes(q)
  );
}
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
        <Input @keyup="cerca()" placeholder="Cerca" class="text-white grow"/>
      </header>
      <div class="overscroll-contain pt-18">
        <Table v-if="useCurrentTableStore().currentTable.length!==0"/>
        <EmptyTable v-else />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>
