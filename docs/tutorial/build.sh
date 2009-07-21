#!/bin/bash

tut_dir=`dirname ${0}`
cd "${tut_dir}"
tut_dir=`pwd`

if [ ! -d "_build" ]; then
  mkdir "_build"
fi

cp -a code/* _build/
cd _build

for d in 01_target 02_container 03_structure site; do
  cp -a _common/* "${d}/"
  cat > "${d}/diff.sh" <<EOF
#!/bin/bash

pushd \`dirname \${0}\` > /dev/null
name=\`basename \\\`pwd\\\`\`
diff -r ../../code/\${name}/stylesheets stylesheets/
popd > /dev/null
EOF
  chmod 755 "${d}/diff.sh"
  cat > "${d}/use.sh" <<EOF
#!/bin/bash

pushd \`dirname \${0}\` > /dev/null
name=\`basename \\\`pwd\\\`\`
dest="../../code/\${name}/\${1}"
if [ ! -f "\${dest}" ]; then
  echo "File \${dest} does not exist; does this file belong in _common?"
  exit 1
fi
cp "\${1}" "\${dest}"
popd > /dev/null
EOF
  chmod 755 "${d}/use.sh"
done

rm -rf _common

cat > activate <<EOF
#!/bin/bash 

cd "${tut_dir}/_build"
pushd ../../../lib > /dev/null
libdir=\`pwd\`
popd > /dev/null

export OLD_RUBYLIB=\${RUBYLIB}
export RUBYLIB=\${libdir}
EOF

cat > deactivate <<EOF
#!/bin/bash

export RUBYLIB=\${OLD_RUBYLIB}
export OLD_RUBYLIB=
EOF
