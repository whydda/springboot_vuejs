import Vue from 'vue';
import TodoList from './components/TodoList.vue';
import router from './router';
import axios from 'axios';

import 'expose-loader?$!expose-loader?jQuery!jquery'
// 위에서 추가했던 jQuery 밑에 코드를 작성하세요

import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'

Vue.prototype.$http = axios;
Vue.config.productionTip = false;

new Vue({
    router,
    render: h => h(TodoList),
}).$mount('#app');