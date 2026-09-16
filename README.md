# El tap de Pauta

[Pauta](https://github.com/jadrdev/pauta) es un gestor de tareas para macOS.
Esto es solo la fórmula para instalarlo con Homebrew.

```bash
brew tap jadrdev/pauta
brew trust jadrdev/pauta
brew install --cask --no-quarantine pauta
```

El `brew trust` es de Homebrew 7 en adelante: un tap que no es el oficial no se
carga hasta que dices que te fías de él. Tiene sentido — un cask es código que
se ejecuta en tu Mac.

Y para actualizar, cuando la app avise de que hay versión nueva:

```bash
brew upgrade --cask pauta
```

## Por qué `--no-quarantine`

Pauta va firmada con un certificado de desarrollo y **sin notarizar**. Homebrew
le pone la cuarentena a todo lo que baja, y sin notarizar Gatekeeper dice que la
app está dañada — y no lo está. La bandera se la salta.

No es pereza: notarizar exige un certificado *Developer ID*, y ese lo da el
programa de pago de Apple. El día que lo haya, esta línea sobra y el cask sigue
valiendo igual.

## Qué aporta sobre bajar el disco

Que la actualización se instala. La app **avisa** de que hay versión nueva pero
no la instala, porque instalar sola algo descargado obliga a verificar la firma
de lo que se baja y con esta cuenta no hay con qué. Homebrew sí verifica: el
cask lleva el `sha256` y lo comprueba antes de tocar nada. Así que `brew upgrade`
es el instalador que la app no puede tener.
