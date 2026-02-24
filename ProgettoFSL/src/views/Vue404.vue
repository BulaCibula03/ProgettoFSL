<script setup lang="ts">
import { SearchIcon } from 'lucide-vue-next'
/* ------- Components ------- */
import {
  Empty,
  EmptyContent,
  EmptyDescription,
  EmptyHeader,
  EmptyTitle,
} from '@/components/ui/empty'
</script>

<template>
  <Empty>
    <EmptyHeader>
      <EmptyTitle>404 - Not Found</EmptyTitle>
      <EmptyDescription>
        La pagina che stai cercando non esiste.
      </EmptyDescription>
    </EmptyHeader>
    <EmptyContent>
    <EmptyDescription>
        <RouterLink to='/'>Ritorna alla Landing Page</RouterLink>
    </EmptyDescription>
    </EmptyContent>
  </Empty>
</template>
