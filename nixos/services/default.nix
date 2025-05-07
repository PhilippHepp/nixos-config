{ inputs, ... }:
{
  imports = with inputs.self.services; [
    homepage
    vaultwarden
  ];
}
