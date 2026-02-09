import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useUsersStore = defineStore('users', () => {
  const users = ref<any | undefined>()
  function getUsers(){
    //da fare
  }
  return { users, getUsers }
})

