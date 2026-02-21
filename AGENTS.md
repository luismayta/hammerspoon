# AGENTS.md - Contexto del Proyecto para Agentes de IA

> **Proyecto:** hammerspoon - Configuracion de Hammerspoon para macOS  
> **Automatizacion:** Taskfile | **Lenguaje:** Lua | **Plataforma:** macOS

---

## Descripcion

Configuracion modular de Hammerspoon para automatizacion de escritorio en macOS. Implementa arquitectura limpia con separacion de dominios, features y core.

---

## Arquitectura

```
init.lua (entry point)
    ├── config/         → Variables y configuracion global
    │   ├── global.lua      → Configuracion global (debug, browserPolicy)
    │   ├── workspace/      → Configuracion de workspaces y apps
    │   └── window/         → Configuracion de ventanas y spoons
    ├── core/           → Infraestructura y utilidades
    │   ├── hotkey.lua      → Sistema de hotkeys con presets
    │   ├── logger.lua      → Wrapper de hs.logger
    │   ├── spoon_manager.lua → Gestion de Spoons
    │   ├── module.lua      → Factory para modulos
    │   ├── context.lua     → Contexto de aplicacion
    │   ├── config/         → Loader y schema de config
    │   ├── hs/             → Adapters para hs.application, hs.screen, hs.audio
    │   └── utils/          → Utilidades (string, table, merge)
    ├── domain/         → Servicios de dominio
    │   ├── workspace/      → Logica de workspaces
    │   ├── window/         → Logica de ventanas
    │   └── applications/   → Logica de aplicaciones
    ├── features/       → Features publicas
    │   ├── workspace/      → Feature de workspace
    │   └── window/         → Feature de ventana
    └── mod/            → Modulos legacy (transicion)
        ├── default.lua     → Configuracion por defecto
        ├── windows.lua     → Gestión de ventanas
        ├── switcher.lua    → Switcher de aplicaciones
        ├── vim.lua         → Modo vim global
        ├── tools.lua       → Herramientas
        └── wifi/           → Modulo wifi
```

**Patron:** Inyeccion de dependencias via `context`. Cada feature recibe context con config, hotkey, application, screen, spoon_manager.

---

## API Principal

| Modulo                     | Funcion                        | Descripcion                            |
| -------------------------- | ------------------------------ | -------------------------------------- |
| `core.hotkey`              | `bind(mods, key, desc, fn)`    | Registrar hotkey                       |
| `core.hotkey`              | `bindPreset(preset, key, ...)` | Registrar con preset (hyper, cmdHyper) |
| `core.spoon_manager`       | `use(name, settings)`          | Cargar spoon con configuracion         |
| `domain.workspace.service` | `switchProfile(ctx, name)`     | Cambiar perfil de workspace            |
| `domain.workspace.service` | `launchOrFocus(ctx, appName)`  | Lanzar/enfocar aplicacion              |
| `domain.window.service`    | `toggleFullscreen(ctx)`        | Toggle fullscreen                      |
| `domain.window.service`    | `moveToNextScreen(ctx)`        | Mover ventana a siguiente pantalla     |

---

## Configuracion

### Variables Globales (`config/global.lua`)

| Variable                | Valor      |
| ----------------------- | ---------- |
| `debug`                 | `true`     |
| `browserPolicy.default` | `"chrome"` |

### Profiles de Workspace (`config/workspace/init.lua`)

| Perfil    | Pantalla Principal       | Pantalla Secundaria                       |
| --------- | ------------------------ | ----------------------------------------- |
| developer | Arc                      | Ghostty, Brave Browser, Discord, Obsidian |
| research  | Arc                      | Ghostty, Brave Browser, Discord, Obsidian |
| speaker   | Keynote, Notes, Arc, etc | Brave Browser, Discord                    |

### Hotkeys de Aplicaciones

| Modificadores  | Tecla | Aplicacion        |
| -------------- | ----- | ----------------- |
| `ctrl+alt+cmd` | `t`   | Ghostty           |
| `ctrl+alt+cmd` | `o`   | Obsidian          |
| `ctrl+alt+cmd` | `b`   | Bitwarden         |
| `ctrl+alt+cmd` | `w`   | Switch Profile    |
| `ctrl+alt`     | `a`   | Arc               |
| `ctrl+alt`     | `b`   | Brave Browser     |
| `ctrl+alt`     | `d`   | Discord           |
| `alt`          | `m`   | Toggle Fullscreen |
| `alt`          | `o`   | Move to Screen    |

---

## Presets de Hotkeys

| Preset       | Modificadores              |
| ------------ | -------------------------- |
| `ctrl`       | `{ "ctrl" }`               |
| `cmd`        | `{ "cmd" }`                |
| `alt`        | `{ "alt" }`                |
| `hyper`      | `{ "ctrl", "alt" }`        |
| `cmdHyper`   | `{ "cmd", "ctrl", "alt" }` |
| `shiftHyper` | `{ "shift", "cmd" }`       |

---

## Spoons Utilizados

| Spoon                      | Proposito                      |
| -------------------------- | ------------------------------ |
| `SpoonInstall`             | Gestion de spoons              |
| `WindowScreenLeftAndRight` | Mover ventanas entre pantallas |
| `WinWin`                   | Grid de ventanas               |
| `Cherry`                   | Clipboard manager              |
| `VimMode`                  | Modo vim global                |

---

## Convenciones

- **Modulos:** `local M = {}` con retorno de tabla
- **Funciones:** `M.action` para publicas, `local function` para privadas
- **Logger:** `require("core.logger").get("module.name")`
- **Config:** Centralizada en `config/` con merge

---

## Desarrollo

```bash
task --yes              # Descargar dependencias Taskfile
task environment        # Configurar entornos
task setup              # Setup inicial (.env, hooks, deps)
task --list             # Ver comandos disponibles
```

### Recargar Config

Despues de cambios, recargar Hammerspoon:

- `Cmd+Ctrl+Shift+R` (si esta configurado)
- O desde menu Hammerspoon → Reload Config

---

## Agregar Nueva Feature

1. Crear servicio en `domain/<feature>/service.lua`
2. Crear feature en `features/<feature>/init.lua` con funcion `setup(context)`
3. Agregar config en `config/<feature>/init.lua`
4. Registrar en `init.lua` principal:
   ```lua
   local features = {
     require("features.workspace"),
     require("features.window"),
     require("features.nueva_feature"),  -- agregar
   }
   ```

---

## Estructura de Contexto

```lua
context = {
  config = {...},          -- configuracion completa
  log = hs.logger,         -- logger principal
  hotkey = Hotkey,         -- instancia de hotkey
  application = {...},     -- adapter de application
  screen = {...},          -- adapter de screen
  spoon_manager = {...},   -- gestor de spoons
}
```

---

## Documentacion

| Archivo                                            | Proposito             |
| -------------------------------------------------- | --------------------- |
| [README.md](README.md)                             | Descripcion general   |
| [docs/usage.md](docs/usage.md)                     | Guia de uso           |
| [docs/contributing.md](docs/contributing.md)       | Guia de contribucion  |
| [docs/troubleshooting.md](docs/troubleshooting.md) | Solucion de problemas |
| [CHANGELOG.md](CHANGELOG.md)                       | Historial de cambios  |

---

## Dependencias

- **Hammerspoon** >= 0.9.x
- **macOS** (solo compatible con macOS)
- **Task** (Taskfile runner) para desarrollo
- **Python** 3.11+ para scripts de desarrollo

---

_Ultima actualizacion: 2026-02-21_
