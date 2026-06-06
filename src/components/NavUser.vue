<script setup lang="ts">
import { ref } from 'vue'
import { useAuthStore } from "@/stores"
import { useRouter } from "vue-router"
/* ------- Lucide Vue Next ------- */
import {
  BadgeCheck,
  Bell,
  ChevronsUpDown,
  CreditCard,
  LogOut,
  Sparkles,
} from "lucide-vue-next"
/* ------- Avatar ------- */
import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from '@/components/ui/avatar'
/* ------- Dropdown ------- */
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuGroup,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
/* ------- Sidebar ------- */
import {
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  useSidebar,
} from '@/components/ui/sidebar'
/* ------- Code ------- */
const router = useRouter()
const avatar: string = "/avatars/shadcn.jpg"
const { isMobile } = useSidebar()
const isLoggingOut = ref(false)

async function handleLogout(){
  if (isLoggingOut.value) return
  
  isLoggingOut.value = true
  
  try {
    const success = await useAuthStore().logout()
    if (success) {
      await new Promise(r => setTimeout(r, 100))
      router.push('/')
    } else {
      throw new Error('Logout failed')
    }
  } catch (error) {
    console.error('Logout error:', error)
    useAuthStore().user = { username: '', livello: '' }
    useAuthStore().isLoggedIn = false
    router.push('/')
  } finally {
    isLoggingOut.value = false
  }
}
</script>

<template>
  <SidebarMenu class="dark">
    <SidebarMenuItem>
      <DropdownMenu>
        <DropdownMenuTrigger as-child>
          <SidebarMenuButton
            size="lg"
            class="dark:bg-slate-900 dark:text-white data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground"
          >
            <Avatar class="h-8 w-8 rounded-lg">
              <AvatarImage :src="avatar" :alt="useAuthStore().user.username" />
              <AvatarFallback class="rounded-lg">
                CN
              </AvatarFallback>
            </Avatar>
            <div class="grid flex-1 text-left text-sm leading-tight">
              <span class="truncate font-medium">{{ useAuthStore().user.username }}</span>
              <span class="truncate text-xs">{{ useAuthStore().user.livello }}</span>
            </div>
            <ChevronsUpDown class="ml-auto size-4" />
          </SidebarMenuButton>
        </DropdownMenuTrigger>
        <DropdownMenuContent
          class="w-[--reka-dropdown-menu-trigger-width] min-w-56 rounded-lg dark"
          :side="isMobile ? 'bottom' : 'right'"
          align="end"
          :side-offset="4"
        >
          <DropdownMenuLabel class="p-0 font-normal">
            <div class="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
              <Avatar class="h-8 w-8 rounded-lg">
                <AvatarImage :src="avatar" :alt="useAuthStore().user.username" />
                <AvatarFallback class="rounded-lg">
                  CN
                </AvatarFallback>
              </Avatar>
              <div class="grid flex-1 text-left text-sm leading-tight">
                <span class="truncate font-semibold">{{ useAuthStore().user.username }}</span>
                <span class="truncate text-xs">{{ useAuthStore().user.livello }}</span>
              </div>
            </div>
          </DropdownMenuLabel>
          <DropdownMenuGroup>
          </DropdownMenuGroup>
          <DropdownMenuGroup>
          </DropdownMenuGroup>
          <DropdownMenuSeparator />
          <DropdownMenuItem>
            <LogOut />
            <button 
              @click="handleLogout()"
              :disabled="isLoggingOut"
              class="ml-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {{ isLoggingOut ? 'Logout in corso...' : 'Log out' }}
            </button>
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
    </SidebarMenuItem>
  </SidebarMenu>
</template>
