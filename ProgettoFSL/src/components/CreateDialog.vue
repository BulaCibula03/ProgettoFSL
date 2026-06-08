<script setup lang="ts">
import { ref, computed, watch, onMounted } from 'vue'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetFooter,
  SheetClose,
} from '@/components/ui/sheet'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { useStudentiStore } from '@/stores/studenti'
import { useDocentiStore } from '@/stores/docenti'
import { useCorsiStore } from '@/stores/corsi'
import { useAziendeStore } from '@/stores/aziende'
import { useSlotStore } from '@/stores/slot'
import { useCurrentTableStore } from '@/stores/index'
import {
  useCorsoModoStore,
  useCorsoTipoStore,
  useSlotTipoStore,
  useSlotImpiegoStore,
  useAziendaTipoStore,
  useDocenteTipoStore,
  useComuneStore,
  useLuogoStore,
  useFamigliaStore,
  useClassiStore,
  useAziendeSelectStore,
} from '@/stores/lookup'
import type { Studente } from '@/stores/studenti'
import type { Docente } from '@/stores/docenti'
import type { Corso } from '@/stores/corsi'
import type { Azienda } from '@/stores/aziende'
import type { Slot } from '@/stores/slot'

const props = defineProps<{ open: boolean }>()
const emit = defineEmits<{ 'update:open': [value: boolean] }>()

const isOpen = computed({
  get: () => props.open,
  set: (v) => emit('update:open', v),
})

const currentTableStore = useCurrentTableStore()
const studentiStore = useStudentiStore()
const docentiStore = useDocentiStore()
const corsiStore = useCorsiStore()
const aziendeStore = useAziendeStore()
const slotStore = useSlotStore()

// Lookup stores
const corsoModoStore = useCorsoModoStore()
const corsoTipoStore = useCorsoTipoStore()
const slotTipoStore = useSlotTipoStore()
const slotImpiegoStore = useSlotImpiegoStore()
const aziendaTipoStore = useAziendaTipoStore()
const docenteTipoStore = useDocenteTipoStore()
const comuneStore = useComuneStore()
const luogoStore = useLuogoStore()
const famigliaStore = useFamigliaStore()
const classiStore = useClassiStore()
const aziendeSelectStore = useAziendeSelectStore()

const isLoading = ref(false)
const errorMsg = ref<string | null>(null)
const form = ref<Record<string, any>>({})

interface FieldDef {
  key: string
  label: string
  type: 'text' | 'number' | 'date' | 'email' | 'select'
  options?: () => { value: any; label: string }[]
  min?: number
}

const fieldsByTable: Record<string, FieldDef[]> = {
  Studenti: [
    { key: 'cognome', label: 'Cognome', type: 'text' },
    { key: 'nome', label: 'Nome', type: 'text' },
    { key: 'matricola', label: 'Matricola', type: 'text' },
    { key: 'cittadinanza', label: 'Cittadinanza', type: 'text' },
    { key: 'sesso', label: 'Sesso', type: 'text' },
    { key: 'data_nascita', label: 'Data di nascita', type: 'date' },
    { key: 'cellulareAllievo', label: 'Cellulare allievo', type: 'text' },
    { key: 'cellulareEmergenza1', label: 'Cellulare emergenza 1', type: 'text' },
    { key: 'cellulareEmergenza2', label: 'Cellulare emergenza 2', type: 'text' },
    { key: 'email1', label: 'Email 1', type: 'email' },
    { key: 'email2', label: 'Email 2', type: 'email' },
    {
      key: 'idResidenza', label: 'Residenza', type: 'select',
      options: () => luogoStore.items.map(l => ({ value: l.id, label: `${l.città} - ${l.indirizzo}` }))
    },
    {
      key: 'idNascita', label: 'Luogo di nascita', type: 'select',
      options: () => comuneStore.items.map(c => ({ value: c.idComune, label: `${c.Comune} (${c.Provincia})` }))
    },
    {
      key: 'idGenitore1', label: 'Genitore 1', type: 'select',
      options: () => famigliaStore.items.map(f => ({ value: f.id, label: f.nome }))
    },
    {
      key: 'idGenitore2', label: 'Genitore 2', type: 'select',
      options: () => famigliaStore.items.map(f => ({ value: f.id, label: f.nome }))
    },
    {
      key: 'Classe1', label: 'Classe 1', type: 'select',
      options: () => classiStore.items.map(c => ({ value: c.id, label: `${c.indirizzo} ${c.sezione}` }))
    },
    { key: 'nRegistro1', label: 'N. Registro 1', type: 'number', min: 0 },
    {
      key: 'Classe2', label: 'Classe 2', type: 'select',
      options: () => classiStore.items.map(c => ({ value: c.id, label: `${c.indirizzo} ${c.sezione}` }))
    },
    { key: 'nRegistro2', label: 'N. Registro 2', type: 'number', min: 0 },
  ],
  Docenti: [
    { key: 'nominativo', label: 'Nominativo', type: 'text' },
    { key: 'data_nascita', label: 'Data di nascita', type: 'date' },
    { key: 'luogo', label: 'Luogo', type: 'text' },
    { key: 'cf', label: 'Codice Fiscale', type: 'text' },
    { key: 'indirizzo', label: 'Indirizzo', type: 'text' },
    { key: 'email', label: 'Email', type: 'email' },
    { key: 'cell', label: 'Cellulare', type: 'text' },
    { key: 'esterno', label: 'Esterno (0/1)', type: 'number', min: 0 },
    { key: 'ente', label: 'Ente', type: 'text' },
    {
      key: 'tipo', label: 'Tipo', type: 'select',
      options: () => docenteTipoStore.items.map(d => ({ value: d.tipo, label: d.tipo }))
    },
  ],
  Corsi: [
    {
      key: 'idtipo', label: 'Tipo corso', type: 'select',
      options: () => corsoTipoStore.items.map(t => ({ value: t.idtipo, label: t.descr }))
    },
    {
      key: 'idmodo', label: 'Modalità', type: 'select',
      options: () => corsoModoStore.items.map(m => ({ value: m.idmodo, label: m.descr }))
    },
    { key: 'annoScolastico', label: 'Anno Scolastico', type: 'text' },
    { key: 'descrizione', label: 'Descrizione', type: 'text' },
    { key: 'data_inizio', label: 'Data Inizio', type: 'date' },
    { key: 'data_fine', label: 'Data Fine', type: 'date' },
    { key: 'ore', label: 'Ore', type: 'number', min: 0 },
    { key: 'docente', label: 'Docente', type: 'text' },
    { key: 'esterno', label: 'Esterno (0/1)', type: 'number', min: 0 },
    { key: 'note', label: 'Note', type: 'text' },
    { key: 'enteEsterno', label: 'Ente Esterno', type: 'text' },
  ],
  Aziende: [
    { key: 'nome', label: 'Nome', type: 'text' },
    {
      key: 'natura', label: 'Natura', type: 'select',
      options: () => aziendaTipoStore.items.map(a => ({ value: a.natura, label: a.natura }))
    },
    { key: 'comune_sl', label: 'Comune SL', type: 'text' },
    { key: 'indirizzo_sl', label: 'Indirizzo SL', type: 'text' },
    { key: 'comune', label: 'Comune', type: 'text' },
    { key: 'indirizzo', label: 'Indirizzo', type: 'text' },
    { key: 'cod_fiscale', label: 'Codice Fiscale', type: 'text' },
    { key: 'part_iva', label: 'Partita IVA', type: 'text' },
    { key: 'tel', label: 'Telefono', type: 'text' },
    { key: 'mail', label: 'Email', type: 'email' },
    { key: 'sito', label: 'Sito Web', type: 'text' },
    { key: 'leg_rapp_nome', label: 'Legale Rapp. Nome', type: 'text' },
    { key: 'leg_rapp_nato_a', label: 'Legale Rapp. Nato a', type: 'text' },
    { key: 'leg_rapp_dt', label: 'Legale Rapp. Data', type: 'date' },
    { key: 'leg_rapp_cf', label: 'Legale Rapp. CF', type: 'text' },
    { key: 'leg_tel', label: 'Legale Tel.', type: 'text' },
    { key: 'leg_note', label: 'Legale Note', type: 'text' },
    { key: 'note', label: 'Note', type: 'text' },
    { key: 'ateco', label: 'Ateco', type: 'text' },
    { key: 'check', label: 'Check (0/1)', type: 'number', min: 0 },
    { key: 'nproto', label: 'N. Protocollo', type: 'text' },
    { key: 'dproto', label: 'Data Protocollo', type: 'date' },
    { key: 'firma', label: 'Firma (0/1)', type: 'number', min: 0 },
    { key: 'attiva', label: 'Attiva (0/1)', type: 'number', min: 0 },
    { key: 'prncct', label: 'Prncct', type: 'text' },
    { key: 'idDocente', label: 'ID Docente', type: 'number', min: 1 },
    { key: 'sportiva', label: 'Sportiva (0/1)', type: 'number', min: 0 },
    { key: 'inglese', label: 'Inglese (0/1)', type: 'number', min: 0 },
  ],
  Slot: [
    {
      key: 'idAzienda', label: 'Azienda', type: 'select',
      options: () => aziendeSelectStore.items.map(a => ({ value: a.id, label: a.nome }))
    },
    { key: 'annoScolastico', label: 'Anno Scolastico', type: 'text' },
    { key: 'datai', label: 'Data Inizio', type: 'date' },
    { key: 'dataf', label: 'Data Fine', type: 'date' },
    { key: 'oreprev', label: 'Ore Previste', type: 'number', min: 0 },
    { key: 'idtirocinio', label: 'ID Tirocinio', type: 'number', min: 1 },
    {
      key: 'tipo', label: 'Tipo', type: 'select',
      options: () => slotTipoStore.items.map(s => ({ value: s.id, label: s.descrizione }))
    },
    {
      key: 'impiego', label: 'Impiego', type: 'select',
      options: () => slotImpiegoStore.items.map(s => ({ value: s.id, label: s.attivita }))
    },
    { key: 'schi', label: 'Schi', type: 'number', min: 0 },
    { key: 'sinf', label: 'Sinf', type: 'number', min: 0 },
    { key: 'smec', label: 'Smec', type: 'number', min: 0 },
    { key: 'slst', label: 'Slst', type: 'number', min: 0 },
    { key: 'note', label: 'Note', type: 'text' },
    { key: 'attivita', label: 'Attività', type: 'text' },
    { key: 'idCreatore', label: 'ID Creatore', type: 'number', min: 1 },
  ],
  Tirocini: [
    { key: 'idStudente', label: 'ID Studente', type: 'number', min: 1 },
    {
      key: 'idAzienda', label: 'Azienda', type: 'select',
      options: () => aziendeSelectStore.items.map(a => ({ value: a.id, label: a.nome }))
    },
    { key: 'annoScolastico', label: 'Anno Scolastico', type: 'text' },
    { key: 'note', label: 'Note', type: 'text' },
  ],
}

const currentFields = computed(() => fieldsByTable[currentTableStore.currentTableType] ?? [])

async function loadLookups(tableType: string) {
  switch (tableType) {
    case 'Corsi':
      await Promise.all([corsoModoStore.fetch(), corsoTipoStore.fetch()])
      break
    case 'Slot':
      await Promise.all([slotTipoStore.fetch(), slotImpiegoStore.fetch(), aziendeSelectStore.fetch()])
      break
    case 'Aziende':
      await aziendaTipoStore.fetch()
      break
    case 'Docenti':
      await docenteTipoStore.fetch()
      break
    case 'Studenti':
      await Promise.all([
        comuneStore.fetch(),
        luogoStore.fetch(),
        famigliaStore.fetch(),
        classiStore.fetch(),
      ])
      break
    case 'Tirocini':
      await aziendeSelectStore.fetch()
      break
  }
}

watch([() => currentTableStore.currentTableType, () => props.open], async ([tableType, open]) => {
  form.value = {}
  errorMsg.value = null
  for (const field of currentFields.value) {
    form.value[field.key] = field.type === 'number' ? (field.min ?? 0) : ''
  }
  if (open) {
    await loadLookups(tableType as string)
  }
})

async function handleSubmit() {
  isLoading.value = true
  errorMsg.value = null
  try {
    const tableType = currentTableStore.currentTableType
    let result: number | null = null

    switch (tableType) {
      case 'Studenti':
        result = await studentiStore.createStudente(form.value as Studente)
        break
      case 'Docenti':
        result = await docentiStore.createDocente(form.value as Docente)
        break
      case 'Corsi':
        result = await corsiStore.createCorso(form.value as Corso)
        break
      case 'Aziende':
        result = await aziendeStore.createAzienda(form.value as Azienda)
        break
      case 'Slot':
        result = await slotStore.createSlot(form.value as Slot)
        if (result) await slotStore.fetchSlots()
        break
      case 'Tirocini':
        errorMsg.value = 'Creazione tirocini non ancora disponibile.'
        return
    }

    if (result !== null) {
      await currentTableStore.setCurrentTable(tableType)
      isOpen.value = false
    } else {
      const storeErr = studentiStore.error || docentiStore.error || corsiStore.error ||
                       aziendeStore.error || slotStore.error
      errorMsg.value = storeErr || 'Errore durante la creazione.'
    }
  } catch (e) {
    errorMsg.value = 'Errore imprevisto.'
  } finally {
    isLoading.value = false
  }
}
</script>

<template>
  <Sheet v-model:open="isOpen">
    <SheetContent
      side="right"
      class="bg-slate-900 border-slate-700 text-slate-200 w-full sm:max-w-lg flex flex-col overflow-hidden"
    >
      <SheetHeader class="flex-shrink-0 pb-4 border-b border-slate-700">
        <SheetTitle class="text-slate-100">
          Nuovo {{ currentTableStore.currentTableType.slice(0, -1) }}
        </SheetTitle>
      </SheetHeader>

      <div class="flex-1 overflow-y-auto py-4 pr-1 space-y-4">
        <div
          v-for="field in currentFields"
          :key="field.key"
          class="grid grid-cols-3 items-center gap-3"
        >
          <Label :for="field.key" class="text-slate-400 text-sm text-right col-span-1">
            {{ field.label }}
          </Label>

          <!-- Select -->
          <select
            v-if="field.type === 'select'"
            :id="field.key"
            v-model="form[field.key]"
            class="col-span-2 bg-slate-800 border border-slate-600 text-slate-100 rounded-md px-3 py-2 text-sm focus:outline-none focus:border-blue-500"
          >
            <option value="" disabled>— seleziona —</option>
            <option
              v-for="opt in field.options?.()"
              :key="opt.value"
              :value="opt.value"
            >
              {{ opt.label }}
            </option>
          </select>

          <!-- Input -->
          <Input
            v-else
            :id="field.key"
            v-model="form[field.key]"
            :type="field.type"
            :min="field.min !== undefined ? field.min : undefined"
            class="col-span-2 bg-slate-800 border-slate-600 text-slate-100 focus:border-blue-500"
            :placeholder="field.label"
          />
        </div>
      </div>

      <p v-if="errorMsg" class="text-red-400 text-sm px-1 flex-shrink-0">{{ errorMsg }}</p>

      <SheetFooter class="flex-shrink-0 pt-4 border-t border-slate-700 flex gap-2 justify-end">
        <SheetClose as-child>
          <Button variant="outline" class="border-slate-600 text-slate-300 hover:bg-slate-800">
            Annulla
          </Button>
        </SheetClose>
        <Button
          @click="handleSubmit"
          :disabled="isLoading"
          class="bg-blue-600 hover:bg-blue-700 text-white"
        >
          {{ isLoading ? 'Salvataggio...' : 'Salva' }}
        </Button>
      </SheetFooter>
    </SheetContent>
  </Sheet>
</template>