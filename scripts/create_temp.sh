#!/bin/bash
shebang="#!/bin/bash"

cat <<EOF > scripts/test.sh
#!/bin/bash
echo echo this is a test \$1 
EOF

sbatch scripts/test.sh First
sbatch scripts/test.sh Second
#rm test.sh
