{ stdenv }:
stdenv.mkDerivation rec {
  name = "${target}-bt-firmware-${version}";
  version = "${branch}-00042";
  branch = "master";
  target = "QCA6390";
  src = builtins.fetchGit {
    url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
    ref = "${branch}";
    rev = "7455a36066741a6e52fba65e04f6451b4cdfd9c4";
  };
  buildCommand = ''
    mkdir -p $out/lib/firmware/qca/${target}/
    cp $src/qca/htbtfw20.tlv $out/lib/firmware/qca/${target}/
    cp $src/qca/htnv20.bin $out/lib/firmware/qca/${target}/
  '';
  meta = with stdenv.lib; {
    description = ''
      Firmware to enable bluetooth functionality on the QCA6390 connectivity chip.
    '';
    homepage = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
    license = licenses.unfreeRedistributable;
    maintainers = with maintainers; [ mitchmindtree ];
    platforms = platforms.linux;
  };
}
