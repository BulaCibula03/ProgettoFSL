<script setup lang="ts">
import type { LucideIcon } from "lucide-vue-next"
/* ------- Sidebar ------- */
import {
  SidebarGroup,
  SidebarGroupContent,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from '@/components/ui/sidebar'
/* ------- Code ------- */
const props = defineProps<{
  items: {
    title: string
    url: string
    icon: LucideIcon
  }[]
}>()
</script>

<template>
  <SidebarGroup class="dark">
    <SidebarGroupContent>
      <SidebarMenu>
        <SidebarMenuItem v-for="item in items" :key="item.title">
          <SidebarMenuButton as-child size="sm" class="dark:bg-slate-900 dark:text-white">
<<<<<<< HEAD
            <RouterLink :to="item.url">
              <component :is="item.icon" />
              <span>{{ item.title }}</span>
            </RouterLink>
=======
            <Routerlink :to="item.url">
              <component :is="item.icon" />
              <span>{{ item.title }}</span>
            </Routerlink>
>>>>>>> 436767acb2c99a416bfd6ff0e4c824d3e34a920d
          </SidebarMenuButton>
        </SidebarMenuItem>
      </SidebarMenu>
    </SidebarGroupContent>
  </SidebarGroup>
</template>
