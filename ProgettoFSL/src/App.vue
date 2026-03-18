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
import { useCorsiStore } from '@/stores/index';
const router = useRouter()
onMounted(async ()=>{
    //router.push('/dashboard')
    await useCorsiStore().fetchCorsi()
})
</script>

<template>
    <!--<div class="bg-slate-900 h-screen w-screen overflow-auto">
        <RouterView />
    </div>-->
    <!--To modify later-->
    <div>{{ useCorsiStore().corsi }}</div>
</template>