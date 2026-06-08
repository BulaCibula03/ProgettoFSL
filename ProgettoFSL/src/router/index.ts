import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Landing',
      component : () => import('../views/VueLanding.vue')
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: () => import('../views/VueDashboard.vue'),
      //meta: { requiresAuth: true }
    },
    {
      path: '/admin',
      name: 'Admin',
      component: () => import('../views/VueAdmin.vue'),
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('../views/VueLogin.vue')
    },
    {
      path: '/documentazione',
      name: 'Documentazione',
      component: () => import('../views/VueDocumentation.vue')
    },
    {
      path: '/404',
      name: '404',
      component: () => import('../views/Vue404.vue'),
    },
    {
      path: '/:catchAll(.*)',
      redirect: '/404',
    },
  ],
})

// Global navigation guard
/*router.beforeEach(async (to, from, next) => {
  const authStore = useAuthStore()
  const requiresAuth = to.matched.some(r => r.meta.requiresAuth)
  
  if (!requiresAuth) {
    return next()
  }
  
  if (!authStore.isLoggedIn && authStore.lastAuthCheck === 0) {
    const isAuth = await authStore.checkLogin()
    if (!isAuth) {
      return next('/login')
    }
  } else if (!authStore.isLoggedIn) {
    return next('/login')
  }
  
  next()
})*/

export default router
