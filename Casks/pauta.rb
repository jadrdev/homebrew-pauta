cask "pauta" do
  version "0.3.8"
  sha256 "e67f95485f24862c5c85bc3462edc6a97d57887cff3d1d8e8747a85f64668602"

  url "https://github.com/jadrdev/pauta/releases/download/v#{version}/Pauta-#{version}.dmg"
  name "Pauta"
  desc "Gestor de tareas: lo que toca hoy, sin más"
  homepage "https://github.com/jadrdev/pauta"

  # La app pregunta a esta misma API si hay versión nueva, así que el cask y el
  # aviso de dentro de la app cuentan lo mismo y no pueden discrepar.
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pauta.app"

  # Lo que deja detrás al desinstalar. Las tareas **no** se tocan: viven en
  # iCloud Drive y son tuyas, no de la app. Aquí solo las preferencias de este
  # Mac —la hora del repaso, el atajo, el sitio en la barra— que es lo que no
  # tiene sentido conservar cuando la app ya no está.
  zap trash: [
    "~/Library/Group Containers/26W4G92PSS.dev.jadrdev.pauta",
    "~/Library/Preferences/dev.jadrdev.pauta.plist",
  ]

  caveats <<~EOS
    Falta un paso antes de abrirla:

      xattr -dr com.apple.quarantine /Applications/Pauta.app

    Pauta va firmada con un certificado de desarrollo y sin notarizar, y
    Homebrew le pone la cuarentena a todo lo que baja; con las dos cosas
    Gatekeeper dice que la app «está dañada», que no es verdad. Esa orden le
    quita la cuarentena.

    Hay que repetirlo en cada `brew upgrade`, porque cada versión se baja
    otra vez. No se quita con trabajo: notarizar exige un certificado
    Developer ID, y ese lo da el programa de pago de Apple.
  EOS
end
