<script setup lang="ts">
import { type HTMLAttributes, ref } from "vue"
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { useRouter } from "vue-router"
import { useAuthStore, type LoginCredentials } from "@/stores/auth"
/* ------- Card ------- */
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
/* ------- Field ------- */
import {
  Field,
  FieldDescription,
  FieldGroup,
  FieldLabel,
} from '@/components/ui/field'
/* ------- Code ------- */
const props = defineProps<{
  class?: HTMLAttributes["class"]
}>()

const router = useRouter()
const user = ref<LoginCredentials>({ username: "", password: "" })
async function submit(){
  await useAuthStore().login(user.value)
  if(useAuthStore().isLoggedIn) router.push('/dashboard')
}
</script>

<template>
  <div class="min-w-100"> <!--:class="cn('flex flex-col gap-6', props.class)"-->
    <Card class="border-0 shadow-2xl">
      <CardHeader>
        <CardTitle>Esegui il login</CardTitle>
        <CardDescription>
          Inserisci le tue credenziali qui sotto per accedere alla dashboard
        </CardDescription>
      </CardHeader>
      <CardContent>
        <form @submit.prevent='submit()'>
          <FieldGroup>
            <Field>
              <FieldLabel for="email">
                Nome Utente
              </FieldLabel>
              <Input
                id="nomeutente"
                type="text"
                placeholder="mariorossi"
                required
                v-model="user.username"
              />
            </Field>
            <Field>
              <div class="flex items-center">
                <FieldLabel for="password">
                  Password
                </FieldLabel>
                <a
                  href="#"
                  class="ml-auto inline-block text-sm underline-offset-4 hover:underline"
                >
                  Hai dimenticato la password?
                </a>
              </div>
              <Input v-model="user.password" id="password" type="password" required />
            </Field>
            <Field>
              <Button type="submit">
                Login
              </Button>
            </Field>
          </FieldGroup>
        </form>
      </CardContent>
    </Card>
  </div>
</template>