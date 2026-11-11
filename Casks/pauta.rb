cask "pauta" do
  version "1.0.0"
  sha256 "33a4f9dcd250154fa7c04bfb0c0ee3cc508c592cca6e2809a33386bde21c89e7"

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
end
