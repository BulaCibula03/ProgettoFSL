import useAziendeStore from '../stores/aziende.ts';

const aziendeStore = useAziendeStore();

await aziendeStore.login('admin', 'admin123');

console.log('User:', aziendeStore.user);
window.aziendeStore = aziendeStore;