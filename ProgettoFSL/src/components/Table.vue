<script setup lang="ts">
/* ------- Table Components ------- */
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
/* ----- Da Fare ----- */
import { useCorsiStore } from '@/stores/index'
import { onMounted } from 'vue';
</script>

<template>
  <Table class="text-gray-400 min-h-screen rounded-lg border-1 border-gray overscroll-none">
    <TableHeader>
      <TableRow>
        <TableHead class="w-[100px]"> <!--to define later: da mettere un v-for-->
        </TableHead>
      </TableRow>
    </TableHeader>
    <TableBody>
      <TableRow v-for="row in useCorsiStore().corsi" :key="row.id">
        <TableCell v-for="data in row" class="font-medium">
          {{ data }}
        </TableCell>
      </TableRow>
    </TableBody>
    <TableFooter>
      <TableRow>
        <TableCell colspan="3" class="text-white">
          Righe Totali
        </TableCell>
        <TableCell class="text-right text-white">
          {{ useCorsiStore().corsi.length }}
        </TableCell>
      </TableRow>
    </TableFooter>
  </Table>
</template>
