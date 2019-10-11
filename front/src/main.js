import Vue from 'vue';
import TodoList from './components/TodoList.vue';
import router from './router';
import axios from 'axios';

Vue.prototype.$http = axios;
Vue.config.productionTip = false;

new Vue({
    router,
    render: h => h(TodoList),
}).$mount('#app');