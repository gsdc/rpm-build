# rpm-build

## build container image
```bash
git clone https://github.com/gsdc/rpm-build.git
podman image build --layers=false --tag rpmbuild:centos-9-stream-1.0 -f Containerfile.centos-9-stream ./rpm-build
podman image tag localhost/rpmbuild:centos-9-stream-1.0 localhost/rpmbuild:centos-9-stream
```

## run rpm build
```bash
dnf download --downloaddir ./rpm-build/downloads --source python3.11-createrepo_c
podman run -v ./rpm-build/RPMS:/root/rpmbuild/RPMS:z -v ./rpm-build/downloads:/root/downloads:z -v ./rpm-build/entrypoint.d:/entrypoint.d:z -e RUN_DEFAULT_BUILD="true" -e BUILD_OPTS="--with legacy_hashes" localhost/rpmbuild:centos-9-stream
```

## reinstall
```bash
dnf reinstall ./rpm-build/RPMS/x86_64/createrepo_c-libs-*.el9.x86_64.rpm ./rpm-build/RPMS/x86_64/python3.11-createrepo_c-*.el9.x86_64.rpm
```
