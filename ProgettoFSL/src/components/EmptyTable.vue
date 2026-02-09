<script setup lang="ts">
import { Cloud } from 'lucide-vue-next'
import { Button } from '@/components/ui/button'
import {
  Empty,
  EmptyContent,
  EmptyDescription,
  EmptyHeader,
  EmptyMedia,
  EmptyTitle,
} from '@/components/ui/empty'
</script>

<template>
  <Empty class="border border-dashed">
    <EmptyHeader>
      <EmptyMedia variant="icon">
        <Cloud />
      </EmptyMedia>
      <EmptyTitle>Lista Tabelle Vuota</EmptyTitle>
      <EmptyDescription>
        Aggiungi delle tabelle al database
      </EmptyDescription>
    </EmptyHeader>
  </Empty>
</template>
