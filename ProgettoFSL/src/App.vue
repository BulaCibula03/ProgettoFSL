<script setup lang="ts">
import { onMounted } from 'vue';
import { useRouter } from 'vue-router';
/* ------- Stores ------- */
import { 
    useStudentiStore, 
    useAziendeStore, 
    useDocentiStore, 
    useTirociniStore 
} from '@/stores/index';
/* ------- Code ------- */
const router = useRouter()

onMounted(async ()=>{
    router.push('/dashboard')
})
</script>

<template>
    <div class="bg-slate-900 h-screen w-screen overflow-auto">
        <RouterView />
    </div>
</template>