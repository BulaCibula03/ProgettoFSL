<script setup lang="ts">
import { onMounted } from 'vue';
import { useRouter } from 'vue-router';
/* ------- Stores ------- */
import { useAuthStore, useCorsiStore, useCurrentTableStore, useAziendeStore, useDocentiStore, useSlotStore, useStudentiStore, useTirociniStore } from '@/stores/index';
/* ------- Code ------- */
const router = useRouter()
onMounted(async ()=>{
    await useCorsiStore().fetchCorsi()
    await useAziendeStore().fetchAziende()
    await useDocentiStore().fetchDocenti()
    await useSlotStore().fetchSlots()
    await useTirociniStore().fetchTirocini()
    await useStudentiStore().fetchStudenti()
    useCurrentTableStore().setCurrentTable("Corsi")
    useAuthStore().logout()
    router.push('/dashboard')
})
</script>

<template>
    <div class="bg-slate-900 h-screen w-screen overflow-auto">
        <RouterView />
    </div>
</template>