<template>
  <div id="app">
    <!-- Aquí se carga el componente principal DE MOMENTO-->
    <XestionUsuarios />
  </div>
</template>

<script setup>
import XestionUsuarios from './components/XestionUsuarios.vue'
</script>

<style>
/* 👇 Estilos globales mínimos */
:global(body) {
  margin: 0;               /* quita el margen por defecto del body */
  background: #f6f6f6;     /* color de fondo general */
}

#app {
  max-width: 80vw;
  margin: 0 auto;          /* centra horizontalmente */
  padding-top: 1rem;       /* 🔹 margen superior pequeño */
  padding-bottom: 1rem;    /* 🔹 espacio para el futuro footer */
  min-height: 100vh;       /* ocupa toda la altura de la pantalla */
  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* el contenido empieza arriba */
}
/* Cuando la pantalla es menor a 768px */
@media (max-width: 768px) {
  .container {
    flex-direction: column;
  }
}

</style>
