// src/stores/usuarioStore.js
import { defineStore } from 'pinia'
import { ref } from 'vue'

// Definimos a store para xestionar o estado do usuario seleccionado

export const useUsuarioStore = defineStore('usuario', () => {
  const id = ref(null)
  const nome = ref('')

// Función para seleccionar un usuario e actualizar o estado

  function seleccionarUsuario(usuario) {
    id.value = usuario.id
    nome.value = usuario.nome
  }

// Función para limpar o usuario seleccionado

  function limparUsuario() {
    id.value = null
    nome.value = ''
  }


// Devolvemos o estado e as accións dispoñibles na store
  return { id, nome, seleccionarUsuario, limparUsuario }
})
