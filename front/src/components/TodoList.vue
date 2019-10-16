<style>
</style>
<style src="../assets/css/common.css"></style>
<template>
    <!-- <div id="todolistapp">
        <div id="header" class="header">
            <h2>Todo List App</h2>
            <input-todo />
        </div>
        <list></list>
    </div>   -->
    <div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-lg-12">
                <div class="card px-3">
                    <div class="card-body">
                        <input-todo />
                        <div class="list-wrapper">
                            <list></list>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>
<script type="text/javascript">

import InputTodo from './InputTodo';
import List from './List';

export default {
    name : 'todo-list',
    components : { InputTodo, List }
}
</script>