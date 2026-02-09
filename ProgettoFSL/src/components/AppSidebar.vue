<script setup lang="ts">
import type { SidebarProps } from '@/components/ui/sidebar'

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

import NavMain from '@/components/NavMain.vue'
import NavProjects from '@/components/NavProjects.vue'
import NavSecondary from '@/components/NavSecondary.vue'
import NavUser from '@/components/NavUser.vue'
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from '@/components/ui/sidebar'

const props = withDefaults(defineProps<SidebarProps>(), {
  variant: "inset",
})

const data = {
  user: {
    name: "shadcn",
    email: "m@example.com",
    avatar: "/avatars/shadcn.jpg",
  },
  navMain: [
    {
      title: "Tabelle",
      url: '#',
      icon: PieChart,
      isActive: true,
      items: [{
        title: "Prova",
        url: "#",
      }],
    },
  ],
  navSecondary: [
    {
      title: "Documentazione",
      url: "#",
      icon: BookOpen,
    },
    {
      title: "Feedback",
      url: "#",
      icon: Send,
    },
  ],
  projects: [
    {
      name: "Design Engineering",
      url: "#",
      icon: Frame,
    },
    {
      name: "Sales & Marketing",
      url: "#",
      icon: PieChart,
    },
    {
      name: "Travel",
      url: "#",
      icon: Map,
    },
  ],
}
</script>

<template>
  <Sidebar v-bind="props" class="dark">
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
      <NavUser :user="data.user" />
    </SidebarFooter>
  </Sidebar>
</template>
