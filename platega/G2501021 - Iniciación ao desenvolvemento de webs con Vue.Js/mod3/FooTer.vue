<template>
  <footer class="footer-content footer">
    <ul class="link-aviso">
     <router-link to="/avisolegal" target="_blank" >Aviso Legal</router-link>
    </ul>
     <p>© {{ new Date().getFullYear() }} XestiónApp — Desenvolvido en Vue 3</p>
  </footer>
</template>

<script setup></script>

<style scoped>
.footer {
  background: #1b4965;
  color: white;
  text-align: center;
  padding: 0.2rem 6rem;
  margin-top: 3rem;
  font-size: 0.9rem;
}

.link-aviso {
  display: block;
  margin-top: 6px;
  color: #f9d342;
  cursor: pointer;
}

.footer-content {
  display: flex;
  justify-content: center; /* centra horizontalmente */
  align-items: center;      /* alinea verticalmente na mesma liña */
  gap: 5rem;                /* espazo entre o texto e o enlace */
}

</style>
