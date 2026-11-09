cask "pauta" do
  version "0.5.0"
  sha256 "480754c009d4dd98d7774ce8b8a5e7db2aadd852adda383d3a36ba638f923f87"

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
