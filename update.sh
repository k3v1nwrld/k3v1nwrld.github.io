# In update.sh
# Update your package manager commands here (e.g., apt-get install)

# Create a temporary directory for compressed packages (optional, customize the name)
mkdir -p tmp_packages

# Generate compressed packages in the temporary directory
dpkg-scanpackages -m ./ /dev/null > tmp_packages/Packages
gzip -cf tmp_packages/Packages > tmp_packages/Packages.gz
xz -9fkev tmp_packages/Packages > tmp_packages/Packages.xz
bzip2 -cf tmp_packages/Packages > tmp_packages/Packages.bz2
zstd -c19 tmp_packages/Packages > tmp_packages/Packages.zst

# Add the temporary directory (and its contents) to Git staging area
git add tmp_packages/
