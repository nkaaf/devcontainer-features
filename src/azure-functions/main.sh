. /etc/os-release

# Microsoft GPG Repository Signing Key: https://learn.microsoft.com/en-us/linux/packages#how-to-use-the-gpg-repository-signing-key

case "$ID" in
    ubuntu)
        repo="https://packages.microsoft.com/repos/microsoft-ubuntu-${VERSION_CODENAME}-prod"
        case "$VERSION_ID" in
            16.04|17.04|18.04|18.10|19.04|20.04|22.04|24.04)
                microsoft_key_url='https://packages.microsoft.com/keys/microsoft.asc'
                ;;
            *)
                echo "Unsupported Ubuntu version: $VERSION_ID" >&2
                exit 1
                ;;
        esac
        ;; 
    debian)
        major_release="${VERSION_ID%%.*}"
        repo="https://packages.microsoft.com/debian/${major_release}/prod"

        case "${VERSION_ID%%.*}" in
            8|9|10|11|12)
                microsoft_key_url='https://packages.microsoft.com/keys/microsoft.asc'
                ;;
            13)
                microsoft_key_url='https://packages.microsoft.com/keys/microsoft-2025.asc'
                ;;
            *)
                echo "Unsupported Debian version: $VERSION_ID" >&2
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Unsupported distribution: $ID" >&2
        exit 1
        ;;
esac

key=$(mktemp)
dearmored=$(mktemp)
trap 'rm --force "$key" "$dearmored"' EXIT

curl --fail --silent --show-error --location  --output "$key"\
    "$microsoft_key_url"
gpg --dearmor < "$key" > "$dearmored"

install --directory --owner root --group root --mode 0755 \
    /etc/apt/keyrings
install --owner root --group root --mode 0644 \
    "$dearmored" /etc/apt/keyrings/microsoft.gpg

ls /etc/apt/keyrings/microsoft.gpg
gpg --show-keys --keyid-format LONG /etc/apt/keyrings/microsoft.gpg

printf 'deb [arch=%s signed-by=/etc/apt/keyrings/microsoft.gpg] %s %s main\n' \
    "$(dpkg --print-architecture)" \
    "$repo" \
    "$VERSION_CODENAME" |
    tee /etc/apt/sources.list.d/dotnetdev.list >/dev/null

cat /etc/apt/sources.list.d/dotnetdev.list

apt-get update
apt-get install azure-functions-core-tools-4
