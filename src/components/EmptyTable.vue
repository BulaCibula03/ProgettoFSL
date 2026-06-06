<script setup lang="ts">
import { Cloud } from 'lucide-vue-next'
/* ------- Components ------- */
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
      <EmptyDescription class="flex content-center">
        Aggiungi dei dati alla tabella
      </EmptyDescription>
    </EmptyHeader>
  </Empty>
</template>
