import { createApp } from 'vue';
import App from './components/App.vue';
import router from './router';
import './bootstrap';


createApp(App).use(router).mount('#app');
