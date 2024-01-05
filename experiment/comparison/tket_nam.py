from pytket import Circuit, OpType
from pytket.qasm import circuit_from_qasm, circuit_to_qasm
from pytket.passes import (
    FullPeepholeOptimise,
    RemoveRedundancies,
    PauliSimp,
    SequencePass,
    CliffordSimp,
)
import os
from os.path import join, isfile
from pytket.passes.auto_rebase import auto_rebase_pass


def tket_optimize_nam(fn: str, output_dir: str):
    circ = circuit_from_qasm(fn)
    FullPeepholeOptimise().apply(circ)
    # rebase_pass = auto_rebase_pass({OpType.CX, OpType.X, OpType.Rz, OpType.H})
    # rebase_pass.apply(circ)
    output_path = output_dir + fn.split("/")[-1]
    circuit_to_qasm(circ, output_path)
    return circ.n_gates, circ.n_2qb_gates(), circ.depth()


if __name__ == "__main__":
    circuit_order = [
        "tof_3",
        "barenco_tof_3",
        "mod5_4",
        "tof_4",
        "barenco_tof_4",
        "tof_5",
        "mod_mult_55",
        "vbe_adder_3",
        "barenco_tof_5",
        "csla_mux_3",
        "rc_adder_6",
        "gf2^4_mult",
        "tof_10",
        "mod_red_21",
        "hwb6",
        "gf2^5_mult",
        "csum_mux_9",
        "barenco_tof_10",
        "qcla_com_7",
        "ham15-low",
        "gf2^6_mult",
        "qcla_adder_10",
        "gf2^7_mult",
        "gf2^8_mult",
        "qcla_mod_7",
        "adder_8",
    ]
    path = "../circs/nam_circs/"
    fns = [
        fn for fn in os.listdir(path) if isfile(join(path, fn)) and fn[-4:] == "qasm"
    ]
    output_dir = "tket_nam_optimized/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    result_dict = {}
    for i, fn in enumerate(fns):
        full_path = path + fn
        gate_cnt, cnot_cnt, depth = tket_optimize_nam(full_path, output_dir)
        result_dict[fn] = [gate_cnt, cnot_cnt, depth]
        print(f"{fn}, gate: {gate_cnt}, cnot: {cnot_cnt}, depth: {depth}, by tket")

    print("ordered gate count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][0])

    print("ordered cnot count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][1])

    print("ordered depth: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][2])
