{
  ...
}:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.users.root = {
    hashedPassword = "$y$j9T$SoPNWsc9Qx3W.3tWd7x7H.$sZqKZS3QCIlNDA1i5jGEoT4fT7ykkVoisPVgPpJwDJ2";
  };
  users.users.fuurin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$y$j9T$SoPNWsc9Qx3W.3tWd7x7H.$sZqKZS3QCIlNDA1i5jGEoT4fT7ykkVoisPVgPpJwDJ2";
  };
}
