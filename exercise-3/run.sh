#!/bin/bash
set -exuo pipefail

MATLAB="matlab"
MATLABFLAGS="-nodisplay -nosplash -nodesktop"
OUTDIR=outputs

marker_line="For product information, visit www.mathworks.com."

function ml() {
    local ml_function=$1
    local outfile=${OUTDIR}/${ml_function}.output
    # The sed part cuts the textual splash screen
    # The python part strips and cleans-up
    ${MATLAB} ${MATLABFLAGS} -r "${ml_function};exit" ${ml_function}.m | sed -e "1,/${marker_line}/d" | python3 -c "import sys; print(sys.stdin.read().replace('\x1b\x5b\x3f\x31\x6c\x1b\x3e', '').replace('Academic License', '').strip())" > ${outfile}
}

for filename in team02*.m; do
    ml ${filename%.m}
done
