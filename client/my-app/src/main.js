import Vue from 'vue'
import App from './App.vue'
import { BootstrapVue } from 'bootstrap-vue'


Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')

Vue.use(BootstrapVue);
