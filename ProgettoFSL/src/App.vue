<script setup lang="ts">
import { useRouter } from 'vue-router';
const router = useRouter()

router.push('/')
</script>

<template>
<div class="bg-slate-900 h-screen w-screen">
    <RouterView />
</div>
</template>