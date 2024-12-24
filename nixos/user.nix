{pkgs, username, ...}:

{
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = ["networkmanager" "wheel" "input" "audio" ];
        shell = pkgs.zsh;
        initialPassword = "Changeme";
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOx5MRocDwBe7GtowUcAFkZtkE81/kJHzk5aPvAvgvsO donielmaker@galaxia"
            "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZdkJQb9qcDlg11bKalFrhJDmm3gcAx7ygSv2AnquI2sBOzu5sPT9rRJ/b9lhITVsfOLZK1ajRYCvCiq1tbpRmPSqpAXPlJOY+ZPAYsNFFiiRbgG0F3bTJgxXJ0A1DZUARxPMX6LimUITncMNo2AlwOl2Ebevr3oX3egoFEHpSfR8RgvWVL8+ISElkL/zhppv7e31I6OXrM1KsWgNtdouT1jL9lFz2VjP8eGyXaQEj/er5837HIuzYk2oVwXiz177JyNyc0UupuM2d8iqyB0xhAs7+6BSONsZeg1n1pQk5BQjN6Syvql2qEJ0fNl9bbt/2KFqwQonl7lkso+4qRdMi6n4B5xSQ60nHn6auznxzwvUVqfKxtpygT+axJ3NXb12xoghjuM/r+dpsDS9MaNQJXC2IOP2hzBXjSFtcw56IQ5IAYzXXsnONRaZEeRd+CNc6IzS6fgGqHATNwEgAumn7WMBCPuB7GrP+tVldR2azvAsd2duKqgANzTL6aDVHos8= danie@Zenith"
        ];
    };
}
