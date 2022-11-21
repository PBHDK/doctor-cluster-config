# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ 
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "mmc_spi" ];

  #nixpkgs.overlays = [
  #  (import ../pkgs)
  #];

  hardware.deviceTree.name = "sifive/hifive-unmatched-a00.dtb";

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.callPackage ./kernel.nix {});
  boot.kernelParams = [ "console=tty0" "console=ttySIF0,115200" "earlycon=sbi" ];
  boot.initrd.kernelModules = [ "nvme" "mmc_block" "mmc_spi" "spi_sifive" "spi_nor" ];

  systemd.services."serial-getty@hvc0" = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    mtdutils
  ];

  fileSystems."/" =  { 
    device = "/dev/disk/by-uuid/18a3df38-55d0-419c-9e5a-0a0a6c56893e";
    fsType = "ext4";
  };

  swapDevices = [ ];
}