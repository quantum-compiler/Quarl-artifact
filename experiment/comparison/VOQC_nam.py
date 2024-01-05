from pyvoqc.voqc import VOQCCircuit, get_library_handle
import os
from os.path import join, isfile

handle = get_library_handle()


def VOQC_optimize_nam(fn):
    circ = VOQCCircuit(handle, fn)
    circ.optimize_nam()
    print(circ.count_gates())
    return circ.total_gate_count()


if __name__ == "__main__":
    qasm_path = "../circs/nam_circs/"
    qasm_fns = [
        fn
        for fn in os.listdir(qasm_path)
        if isfile(join(qasm_path, fn)) and fn[-4:] == "qasm"
    ]
    for fn in qasm_fns:
        r = VOQC_optimize_nam(qasm_path + fn)
        print(f"Optimization results of VOQC for {fn} on Nam's gate set")
        print(f"{r} gates after pass 'optimize_nam'")
