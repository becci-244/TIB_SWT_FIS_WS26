<script setup>

import { ref } from 'vue'

const emit = defineEmits(['login'])

const rolle = ref('user')

function weiter() {
  emit('login', rolle.value)
}

</script>

<template>

  <!-- Header -->

  <div class="header">

    <div>

      <h2>Verwaltungsmanager</h2>

      <h1>FIS-Anwendung</h1>

    </div>

    <div class="header-right">

      <div class="datetime">
        15:37 &nbsp;&nbsp;&nbsp; 12.11.2026
      </div>

    </div>

  </div>

  <!-- Loginbereich -->

  <div class="login-card">

    <h2>Login</h2>

    <p>Bitte Rolle auswählen:</p>

    <select v-model="rolle">

      <option value="user">
        Student
      </option>

      <option value="lecturer">
        Dozent
      </option>

      <option value="admin">
        Admin
      </option>

    </select>

    <button
      class="next-btn"
      @click="weiter"
    >
      Weiter
    </button>

  </div>

</template>

<style scoped>

*{
  font-family: Arial;
}

.header{
  display:flex;
  justify-content:space-between;
  align-items:flex-start;
  margin-bottom:40px;
}

.header h1{
  margin:0;
  text-decoration:underline;
  font-size:26px;
}

.header h2{
  margin:0 0 10px 0;
  text-decoration:underline;
  font-size:22px;
}

.datetime{
  font-size:18px;
  font-weight:bold;
}

.login-card{

  width:400px;

  border:2px solid black;

  border-radius:12px;

  padding:30px;

  background:white;
}

.login-card h2{
  margin-top:0;
}

select{

  width:100%;

  padding:12px;

  margin-top:10px;
  margin-bottom:20px;

  border:1px solid black;

  font-size:16px;
}

.next-btn{

  width:100%;

  padding:10px;

  border:1px solid black;

  background:#eee;

  font-weight:bold;

  cursor:pointer;
}

.next-btn:hover{
  background:#ddd;
}

</style>