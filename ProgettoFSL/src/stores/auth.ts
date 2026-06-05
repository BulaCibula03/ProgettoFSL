import LoginForm from '@/components/new-york-v4/blocks/login-01/components/LoginForm.vue';
import type { LucideIcon } from 'lucide-vue-next';
import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

export interface User {
  username: string
  livello: string
}

export interface LoginCredentials {
  username: string
  password: string
}

export interface NewUser {
  username: string
  password: string
  livello: 'admin' | 'user' | 'reduced user'
}

export const useAuthStore = defineStore('auth', () => {
  const user = ref<User>({ username: "", livello: ""})
  const loading = ref(false)
  const error = ref<string | null>(null)
  const isLoggedIn = ref(false)
  const lastAuthCheck = ref<number>(0)
  
  // Previeni check multipli - cache per 30 secondi
  const shouldCheckAuth = computed(() => {
    return Date.now() - lastAuthCheck.value > 30000
  })

  async function login(credentials: LoginCredentials | undefined) {
    loading.value = true
    error.value = null
    
    try {
      let params = undefined
      if(credentials !== undefined){
        params = new URLSearchParams({ username: credentials.username, password: credentials.password });
      } else{
        return false
      }

      const response = await fetch('/api/login.php?log=login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8'
        },
        body: params.toString(),
      })

      const result = await response.json()
      if (result.ok) {
        user.value = {
          username: result.username,
          livello: result.livello,
        }
        if(user.value.username !== "") isLoggedIn.value = true
        return true
      } else {
        error.value = result.message
        return false
      }
    } catch (e) {
      error.value = 'Errore di connessione'
      return false
    } finally {
      loading.value = false
    }
  }

  async function logout() {
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/login.php?log=logout', {
        method: 'POST',
        credentials: 'include',
      })
      const result = await response.json()
      if (result.ok) {
        user.value = { username: "", livello: "" }
        isLoggedIn.value = false
        lastAuthCheck.value = 0 // Reset cache timestamp
        return true
      } else {
        error.value = 'Errore durante il logout'
        return false
      }
    } catch (e) {
      error.value = 'Errore di connessione'
      return false
    } finally {
      loading.value = false
    }
  }

  async function checkLogin() {
    // Se cache è ancora valido e non è il primo check, salta
    if (!shouldCheckAuth.value && lastAuthCheck.value > 0) {
      return isLoggedIn.value
    }
    
    loading.value = true
    error.value = null
    try {
      const response = await fetch('/api/login.php?log=checkLogin', {
        method: 'POST',
        credentials: 'include',
      })
      
      const result = await response.json()
      lastAuthCheck.value = Date.now() // Update cache timestamp
      
      if (result.ok) {
        user.value = {
          username: result.username,
          livello: result.livello,
        }
        isLoggedIn.value = true
        return true
      } else {
        isLoggedIn.value = false
        user.value = { username: "", livello: "" }
        return false
      }
    } catch (e) {
      error.value = 'Errore connessione'
      isLoggedIn.value = false
      return false
    } finally {
      loading.value = false
    }
  }

  async function addUser(newUser: NewUser) {
    loading.value = true
    error.value = null
    try {
      const formData = new FormData()
      formData.append('username', newUser.username)
      formData.append('password', newUser.password)
      formData.append('livello', newUser.livello)

      const response = await fetch('/api/addUser.php?op=addUser', {
        method: 'POST',
        body: formData,
      })
      const result = await response.json()
      if (result.ok) {
        return true
      } else {
        error.value = result.error
        return false
      }
    } catch (e) {
      error.value = 'Errore di connessione'
      return false
    } finally {
      loading.value = false
    }
  }

  return {
    user,
    loading,
    error,
    isLoggedIn,
    lastAuthCheck,
    shouldCheckAuth,
    login,
    logout,
    checkLogin,
    addUser,
  }
})
