import { createRouter, createWebHistory } from 'vue-router'

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
      component: () => import('../views/VueDashboard.vue')
    },
    {
      path: '/admin',
      name: 'Admin',
      component: () => import('../views/VueAdmin.vue')
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('../views/VueLogin.vue')
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

export default router
