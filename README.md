# Especificaciones de Diseño

La aplicación sigue una paleta de colores profesional y relajante, orientada a la confianza y el cuidado de mascotas.

| Elemento | Color Hexadecimal | Representación |
|----------|------------------|----------------|
| Fondo General | `0xFFF0F4F8` | |
| Botones Primarios | `0xFF0D47A1` | |
| AppBar / Iconos | `0xFF1976D2` | |
| Acentos / Footer | `0xFFBBDEFB` | |

---

## 📱 Estructura de Navegación

### 1. Pantalla Principal (`main.dart`)

- **Componente Central:** Contenedor con elevación y bordes redondeados.
- **Identidad:** Título "Dog Club" acompañado de un icono lateral izquierdo.
- **Acciones:**
  - **Botón Iniciar Sesión:** Navega a la pantalla de Login.
  - **Botón Registrarse:** Navega a la pantalla de Registro.

---

### 2. Registro de Usuarios (`registro.dart`)

Formulario para el alta de nuevos clientes con los siguientes campos:

- Nombre de usuario.
- Correo electrónico.
- Contraseña y Confirmación de contraseña.

**Persistencia:** Los datos se almacenan en un `LocalStorage` (Simulación de memoria estática) para permitir el acceso posterior.

---

### 3. Inicio de Sesión (`insesion.dart`)

- **Validación en Tiempo Real:** Incluye un contenedor dinámico que notifica:
  - ✅ **Éxito:** Si las credenciales coinciden con el registro.
  - ❌ **Error:** Si los datos son incorrectos o el usuario no existe.

- **Navegación Inversa:** Acceso rápido a la pantalla de registro si el usuario no tiene cuenta.
