cask "pauta" do
  version "1.0.2"
  sha256 "453e97d6d9db4dc4392dff7d9fe2db1b98eefdeb21c024593473cdee2d5e64d2"

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
