{
  imports = [
    ../.
    ../../../common/cpu/intel
    ../../../common/pc/laptop/acpi_call.nix
  ];

  boot.kernelParams = [
    # https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X260#Thinkpad_X260
    "i915.enable_psr=0"
  ];

  # https://wiki.archlinux.org/index.php/TLP#Btrfs
  services.tlp.extraConfig = ''
    SATA_LINKPWR_ON_BAT=med_power_with_dipm
  '';
}
