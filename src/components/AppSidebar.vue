<script setup lang="ts">
import { useAuthStore } from '@/stores'
/* ------- Lucide Vue Next ------- */
import {
  BookOpen,
  Bot,
  Command,
  Frame,
  LifeBuoy,
  Map,
  PieChart,
  Send,
  Settings2,
  SquareTerminal,
} from "lucide-vue-next"
/* ------- Navbar ------- */
import NavMain from '@/components/NavMain.vue'
import NavSecondary from '@/components/NavSecondary.vue'
import NavUser from '@/components/NavUser.vue'
/* ------- Sidebar ------- */
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  type SidebarProps,
} from '@/components/ui/sidebar'
/* ------- Code ------- */
const props = withDefaults(defineProps<SidebarProps>(), {
  variant: "inset",
})

const data = {
  navMain: [
    {
      title: "Tabelle",
      url: '#',
      icon: PieChart,
      isActive: true,
      items: [{
          title: "Studenti",
        },
        {
          title: "Docenti"
        },
        {
          title: "Tirocini"
        },
        {
          title: "Aziende"
        },
        {
          title: "Slot"
        },
        {
          title: "Corsi"
        },
      ],
    },
  ],
  navSecondary: [
    {
      title: "Documentazione",
      url: "/documentazione",
      icon: LifeBuoy,
    },
    {
      title: "Feedback",
      url: "#",
      icon: Send,
    },
  ],
}
</script>

<template>
  <Sidebar v-bind="props" class="dark p-0">
    <SidebarHeader class="bg-slate-950">
      <SidebarMenu>
        <SidebarMenuItem class="dark">
          <SidebarMenuButton size="lg" as-child class="dark:bg-slate-900">
            <a href="https://galileicrema.edu.it/" target="_blank">
              <div class="flex aspect-square size-8 items-center justify-center rounded-lg bg-sidebar-primary text-sidebar-primary-foreground">
                <Command class="size-4" />
              </div>
              <div class="dark grid flex-1 text-left text-sm leading-tight dark:bg-slate-900">
                <span class="truncate font-medium dark:text-white">Galileo Galilei Crema</span>
                <span class="truncate text-xs dark:text-white">ITS</span>
              </div>
            </a>
          </SidebarMenuButton>
        </SidebarMenuItem>
      </SidebarMenu>
    </SidebarHeader>
    <SidebarContent class="bg-slate-950">
      <NavMain :items="data.navMain"/>
      <!--<NavProjects :projects="data.projects" /> useless now--> 
      <NavSecondary :items="data.navSecondary" class="mt-auto" />
    </SidebarContent>
    <SidebarFooter class="bg-slate-950">
      <NavUser />
    </SidebarFooter>
  </Sidebar>
</template>
