<style>

</style>
<template>
  <div>
    <!-- <input class="input" type="text" id="task" v-model.trim="todo"
           placeholder="입력 후 엔터!" v-on:keyup.enter="addTodo">
    <span class="addbutton" v-on:click="addTodo">추 가</span>
    <span class="addbutton" v-on:click="callServer">서버통신</span> -->
    <h4 class="card-title">해야할 일을 입력하세요.</h4>
    <div class="add-items d-flex"> 
      <input type="text" class="form-control todo-list-input" placeholder="입력후 엔터!" > <button class="add btn btn-primary font-weight-bold todo-list-add-btn">추가</button> 
    </div>
  </div>
</template>
<script type="text/javascript">
  import eventBus from '../EventBus'

  export default {
    name : 'input-todo',
    data : function() {
      return { todo : "" }
    },
    methods : {
      addTodo : function() {
        eventBus.$emit('add-todo', this.todo);
        this.todo = "";
      }, 
      callServer : function(){
        this.$http.get('http://localhost:9090/user/info')
        .then((result) => {
          console.log(result)
          for(let v of result.data.resultData){
            eventBus.$emit('add-todo', v);
          }
        })
      }
    }
  }
</script>
