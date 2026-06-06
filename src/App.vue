<script setup lang="ts">
import { onMounted } from 'vue';
import { useRouter } from 'vue-router';
/* ------- Stores ------- */
import { useAuthStore, useCorsiStore, useCurrentTableStore } from '@/stores/index';
/* ------- Code ------- */
const router = useRouter()
onMounted(async ()=>{
    const authStore = useAuthStore()
    const isAuth = await authStore.checkLogin()
    
    if (!isAuth) {
      router.push('/dashboard')
      return
    }
    
    try {
      await useCorsiStore().fetchCorsi()
      useCurrentTableStore().setCurrentTable('Corsi')
    } catch (err) {
      console.error('Errore caricamento dati iniziali:', err)
    }
})
</script>

<template>
    <div class="bg-slate-900 h-screen w-full overflow-auto">
        <RouterView />
    </div>
</template>