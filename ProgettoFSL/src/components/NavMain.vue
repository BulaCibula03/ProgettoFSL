<script setup lang="ts">
import { ref } from "vue"
import { ChevronRight, type LucideIcon } from "lucide-vue-next"
/* ------- Collapsible ------- */
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible'
/* ------- Sidebar ------- */
import {
  SidebarGroup,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuAction,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
} from '@/components/ui/sidebar'
/* -------  Stores ------- */
import { useStudentiStore, useDocentiStore, useTirociniStore, useAziendeStore, useSlotStore, useCorsiStore, useCurrentTableStore } from "@/stores";
/* ------- Code ------- */
defineProps<{
  items: {
    title: string
    url: string
    icon: LucideIcon
    isActive?: boolean
    items?: {
      title: string
    }[]
  }[]
}>()

const classes = ref('')

async function loadTabella(title: string){
  switch(title){
    case "Studenti":
      //if(useStudentiStore().studenti.length===0) 
      //await useStudentiStore().fetchStudenti()
      await useCurrentTableStore().setCurrentTable("Studenti")
      break
    case "Docenti":
      //if(useDocentiStore().docenti.length===0) 
      //await useDocentiStore().fetchDocenti()
      await useCurrentTableStore().setCurrentTable("Docenti")
      break
    case "Tirocini":
      //if(useTirociniStore().tirocini.length===0) 
      //await useTirociniStore().fetchTirocini()
      await useCurrentTableStore().setCurrentTable("Tirocini")
      break
    case "Aziende":
      //if(useAziendeStore().aziende.length===0) 
      //await useAziendeStore().fetchAziende()
      await useCurrentTableStore().setCurrentTable("Aziende")
      break
    case "Slot":
      //if(useSlotStore().slot.length===0) 
      //await useSlotStore().fetchSlots()
      await useCurrentTableStore().setCurrentTable("Slot")
      break
    case "Corsi":
      //if(useCorsiStore().corsi.length===0) 
      //await useCorsiStore().fetchCorsi()
      await useCurrentTableStore().setCurrentTable("Corsi")
      break
    default:
      console.log("Errore")
      break
  }
  return 
}
</script>

<template>
  <SidebarGroup class="dark">
    <SidebarGroupLabel>Admin</SidebarGroupLabel>
    <SidebarMenu>
      <Collapsible v-for="item in items" :key="item.title" as-child :default-open="item.isActive">
        <SidebarMenuItem>
          <SidebarMenuButton as-child :tooltip="item.title">
            <a :href="item.url">
              <component :is="item.icon" class="dark text-white"/>
              <span class="dark:text-white">{{ item.title }}</span>
            </a>
          </SidebarMenuButton>
          <template v-if="item.items?.length">
            <CollapsibleTrigger as-child>
              <SidebarMenuAction class="data-[state=open]:rotate-90">
                <ChevronRight />
                <span class="sr-only">Toggle</span>
              </SidebarMenuAction>
            </CollapsibleTrigger>
            <CollapsibleContent>
              <SidebarMenuSub>
                <SidebarMenuSubItem v-for="subItem in item.items" :key="subItem.title">
                  <SidebarMenuSubButton as-child>
                    <button @click="loadTabella(subItem.title)" :id="subItem.title" >
                      <span class="shadow-2xl shadow-blue-700">{{ subItem.title }}</span>
                    </button>
                  </SidebarMenuSubButton>
                </SidebarMenuSubItem>
              </SidebarMenuSub>
            </CollapsibleContent>
          </template>
        </SidebarMenuItem>
      </Collapsible>
    </SidebarMenu>
  </SidebarGroup>
</template>
