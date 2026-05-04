<template>
  <div class="xestion-usuarios">
    <h4>👥 Xestión de usuarios</h4>

    <form @submit.prevent="gardarUsuario">
      <div class="fila">
        <div class="campo campo-dni">
          <label>DNI/CIF:</label>
          <input v-model="novoUsuario.dni" type="text" required />
        </div>

        <div class="campo campo-nome">
          <label>Nome:</label>
          <input v-model="novoUsuario.nome" type="text" required />
        </div>
      </div>

      <div class="fila">
        <div class="campo campo-correo">
          <label>Correo:</label>
          <input v-model="novoUsuario.correo" type="email" required />
        </div>

        <div class="campo campo-provincia">
          <label>Provincia:</label>
          <select v-model="novoUsuario.provincia">
            <option value="">-- Escolle --</option>
            <option>A Coruña</option>
            <option>Lugo</option>
            <option>Ourense</option>
            <option>Pontevedra</option>
          </select>
        </div>
      </div>

      <div class="fila fila-centrada">
        <div class="campo">
          <label>Activo:</label>
          <input v-model="novoUsuario.activo" type="checkbox" />
        </div>

        <div class="campo">
          <label>Tipo:</label>

          <div class="radio-group">
            <label>
              <input type="radio" value="particular" v-model="novoUsuario.tipoCuenta" />
              Particular
            </label>

            <label>
              <input type="radio" value="empresa" v-model="novoUsuario.tipoCuenta" />
              Empresa
            </label>
          </div>
        </div>
      </div>

      <button type="submit" class="btn-guardar">
        Gardar
      </button>
    </form>

    <h4>📋 Usuarios</h4>

    <table v-if="usuarios.length">
      <thead>
        <tr>
          <th>ID</th>
          <th>DNI</th>
          <th>Nome</th>
          <th>Correo</th>
          <th>Provincia</th>
          <th>Accións</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="(u, index) in usuarios" :key="index">
          <td>{{ index + 1 }}</td>
          <td>{{ u.dni }}</td>
          <td>{{ u.nome }}</td>
          <td>{{ u.correo }}</td>
          <td>{{ u.provincia }}</td>

          <td>
            <button @click="editarUsuario(index)">✏️</button>
            <button @click="eliminarUsuario(index)">🗑️</button>

            <!-- SeN params, SeN store -->
            <router-link to="/tarefas">
              📝 Tarefas
            </router-link>
          </td>
        </tr>
      </tbody>
    </table>

    <p v-else>Non hai usuarios cargados.</p>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from "vue";
import {
  getUsuarios,
  createUsuario,
  updateUsuario,
  deleteUsuario,
} from "../services/usuarios.service.js";

const usuarios = ref([]);

const novoUsuario = reactive({
  dni: "",
  nome: "",
  correo: "",
  provincia: "",
  activo: false,
  tipoCuenta: "",
});

const usuarioSeleccionado = ref(null);

onMounted(() => {
  cargarUsuarios();
});

async function cargarUsuarios() {
  try {
    const res = await getUsuarios();
    usuarios.value = res.data;
  } catch (error) {
    console.error(error);
  }
}

async function gardarUsuario() {
  try {
    if (usuarioSeleccionado.value) {
      await updateUsuario(usuarioSeleccionado.value.id, { ...novoUsuario });
    } else {
      await createUsuario(novoUsuario);
    }

    await cargarUsuarios();
    limparFormulario();
  } catch (error) {
    console.error(error);
  }
}

async function eliminarUsuario(index) {
  const usuario = usuarios.value[index];

  try {
    await deleteUsuario(usuario.id);
    await cargarUsuarios();
  } catch (error) {
    console.error(error);
  }
}

function editarUsuario(index) {
  Object.assign(novoUsuario, usuarios.value[index]);
  usuarioSeleccionado.value = usuarios.value[index];
}

function limparFormulario() {
  novoUsuario.dni = "";
  novoUsuario.nome = "";
  novoUsuario.correo = "";
  novoUsuario.provincia = "";
  novoUsuario.activo = false;
  novoUsuario.tipoCuenta = "";

  usuarioSeleccionado.value = null;
}
</script>
<style scoped>
/* Mantemos todo o CSS existente */
.xestion-usuarios {
  width: 100;
  /* ancho del contenedor */
  margin: 5px auto 2rem auto;
  /* 60px desde arriba para separar del navbar, centrado horizontalmente */
  background: #fff;
  padding: 2rem;
  border-radius: 6px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-bottom: 2rem;
}

.fila {
  display: flex;
  gap: 1rem;
  width: 100%;
}

.fila-centrada {
  justify-content: center;
}

.campo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.campo-dni {
  flex: 1;
}

a {
  text-decoration: none;
}

.campo-nome {
  flex: 3;
}

.campo-correo {
  flex: 2;
}

.campo-provincia {
  flex: 1;
}

.campo label {
  min-width: 80px;
  font-weight: 500;
}

.campo input,
.campo select {
  flex: 1;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 0px;
  box-sizing: border-box;
}

.btn-guardar {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 0.4rem 1.5rem;
  cursor: pointer;
  margin: 0 auto;
  display: block;
}

.btn-guardar:hover {
  background-color: #0056b3;
}

table {
  width: 100%;
  border-collapse: separate;
  margin-top: 1rem;
  font-size: 0.8rem;
  border: 1px solid #ddd;
}

th,
td {
  border: 1px solid #ddd;
  padding: 0.7rem;
  text-align: left;
}

th {
  text-align: center;
  background-color: #f8f9fa;
}

h4 {
  margin-bottom: 1rem;
  font-weight: 600;
  background-color: #73aff0;
  color: white;
}

@media (max-width: 768px) {
  .fila {
    flex-direction: column;
    gap: 0.5rem;
  }
}
</style>
