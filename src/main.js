import "bootstrap/dist/css/bootstrap.css"
import "bootstrap"
import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import Home from './components/home'
import Form from './components/form'
import List from './components/List'

const routes = [
  { path: '/', component: Home },
  { path: '/list', component: List },
  { path: '/form', component: Form }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

const app = createApp(App)

app.use(router)
app.mount('#app');
