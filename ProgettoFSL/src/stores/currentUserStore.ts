import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useCurrentUserStore = defineStore('currentUser', () => {
    const currentUser = ref<any | undefined>()
    function setCurrentUser(user: any){
      //da fare
    }
    return { currentUser, setCurrentUser }
})

