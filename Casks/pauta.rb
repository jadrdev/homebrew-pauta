cask "pauta" do
  version "0.3.1"
  sha256 "6624c3b984837712e6ef728555f6e7aaff315020f3e2b4727630da71b9bd220d"

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
    Pauta va firmada con un certificado de desarrollo y sin notarizar, así que
    Gatekeeper la bloquea si Homebrew le pone la cuarentena. Si te la ha puesto,
    se le quita con:

      xattr -dr com.apple.quarantine /Applications/Pauta.app

    o se evita instalando con:

      brew install --cask --no-quarantine pauta

    No se quita con trabajo: notarizar exige un certificado Developer ID, y ese
    lo da el programa de pago de Apple.
  EOS
end
