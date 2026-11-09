# El tap de Pauta

[Pauta](https://github.com/jadrdev/pauta) es un gestor de tareas para macOS.
Esto es solo la fórmula para instalarlo con Homebrew.

```bash
brew tap jadrdev/pauta
brew trust jadrdev/pauta
brew install --cask pauta
```

El `brew trust` es de Homebrew 7 en adelante: un tap que no es el oficial no se
carga hasta que dices que te fías de él. Tiene sentido — un cask es código que
se ejecuta en tu Mac.

Y para actualizar, cuando la app avise de que hay versión nueva:

```bash
brew upgrade --cask pauta
```

## Ya no hay que quitarle la cuarentena

Desde la 0.4.16, Pauta va **firmada con un certificado Developer ID y
notarizada por Apple**, con el ticket grapado en el disco y en la app. Gatekeeper
la abre a la primera, también sin red.

Hasta la 0.4.15 iba firmada con un certificado de desarrollo y sin notarizar, y
había que hacer `xattr -dr com.apple.quarantine /Applications/Pauta.app` después
de cada instalación. Si lo ves en algún sitio, es de antes.

## Qué aporta sobre bajar el disco

Que la actualización se instala. La app **avisa** de que hay versión nueva pero
no se instala sola. Homebrew sí: el cask lleva el `sha256` del disco y lo
comprueba antes de tocar nada, así que `brew upgrade` es el instalador que la
app todavía no tiene.
