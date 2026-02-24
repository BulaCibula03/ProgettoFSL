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
</script>

<template>
  <Table>
    <TableHeader>
      <TableRow>
        <TableHead class="w-[100px]"> <!--to define later: da mettere un v-for-->
        </TableHead>
      </TableRow>
    </TableHeader>
    <TableBody>
      <TableRow v-for="row in useCurrentTableStore().currentTable" :key="row.id">
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
          {{ useCurrentTableStore().currentTable.length }}
        </TableCell>
      </TableRow>
    </TableFooter>
  </Table>
</template>
