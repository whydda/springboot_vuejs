<style>

</style>
<template>
  <ul class="d-flex flex-column-reverse todo-list">
     <li v-for="a in todolist" :key="a.id" :class="{checked : a.done, completed: a.done}">
        <div class="form-check" @click="doneToggle(a.id)"> <label class="form-check-label"> <input class="checkbox" type="checkbox" v-model="a.done"> {{ a.todo }} <i class="input-helper"></i><span v-if="a.done"> (완료)</span></label></div>
        <span class="remove" v-on:click.stop="deleteTodo(a.id)">&#x00D7;</span>
     </li>
    <!-- <li v-for="a in todolist" :key="a.id" :class="checked(a.done)"
        @click="doneToggle(a.id)">
      <span>{{ a.todo }}</span>
      <span v-if="a.done"> (완료)</span>
      <span class="close" v-on:click.stop="deleteTodo(a.id)">&#x00D7;</span>
    </li> -->
  </ul>
</template>
<script type="text/javascript">
  import eventBus from '../EventBus'

  export default {
    created : function() {
      eventBus.$on('add-todo', this.addTodo);
    },
    data : function() {
      return {
        todolist : [
          { id:1, todo : "영화보기", done:false },
          { id:2, todo : "주말 산책", done:true },
          { id:3, todo : "ES6 학습", done:false },
          { id:4, todo : "잠실 야구장", done:false },
        ]
      }
    },
    methods : {
      addTodo : function(todo) {
        if (todo !== "") {
          this.todolist.push(
            { id:new Date().getTime(), todo : todo, done:false });
        }
      },
      doneToggle : function(id) {
        var index = this.todolist.findIndex((item)=>item.id === id);
        this.todolist[index].done = !this.todolist[index].done;
      },
      deleteTodo : function(id) {
        var index = this.todolist.findIndex((item)=>item.id === id);
        this.todolist.splice(index,1);
      }
    }
  }
</script>
