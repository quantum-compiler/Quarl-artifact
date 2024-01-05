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
import sys

sys.path.append("../")
from fidelity import get_log_fidelity, get_log_logical_fidelity


def tket_optimize_nam(fn: str, output_dir: str):
    circ = circuit_from_qasm(fn)
    FullPeepholeOptimise().apply(circ)
    rebase_pass = auto_rebase_pass({OpType.CX, OpType.X, OpType.Rz, OpType.SX})
    rebase_pass.apply(circ)
    output_path = output_dir + fn.split("/")[-1]
    circuit_to_qasm(circ, output_path)
    log_fidelity = get_log_logical_fidelity(output_path)
    return circ.n_gates, circ.n_2qb_gates(), circ.depth(), log_fidelity


if __name__ == "__main__":
    circuit_order = [
        "tof_3",
        "barenco_tof_3",
        "mod5_4",
        "tof_4",
        "tof_5",
        "barenco_tof_4",
        "mod_mult_55",
        "vbe_adder_3",
        "barenco_tof_5",
        "csla_mux_3",
        "rc_adder_6",
        "gf2^4_mult",
        "hwb6",
        "mod_red_21",
        "tof_10",
        "gf2^5_mult",
        "csum_mux_9",
        "barenco_tof_10",
        "ham15-low",
        "qcla_com_7",
        "gf2^6_mult",
        "qcla_adder_10",
        "gf2^7_mult",
        "gf2^8_mult",
        "qcla_mod_7",
        "adder_8",
        "vqe_nativegates_ibm_tket_8",
        "qgan_nativegates_ibm_tket_8",
        "qaoa_nativegates_ibm_tket_8",
        "ae_nativegates_ibm_tket_8",
        "qpeexact_nativegates_ibm_tket_8",
        "qpeinexact_nativegates_ibm_tket_8",
        "qft_nativegates_ibm_tket_8",
        "qftentangled_nativegates_ibm_tket_8",
        "portfoliovqe_nativegates_ibm_tket_8",
        "portfolioqaoa_nativegates_ibm_tket_8",
    ]
    path = "../circs/ibm_circs/"
    fns = [
        fn for fn in os.listdir(path) if isfile(join(path, fn)) and fn[-4:] == "qasm"
    ]
    extra_path = "../circs/ibm_extra_circs/"
    extra_fns = [
        fn
        for fn in os.listdir(extra_path)
        if isfile(join(extra_path, fn)) and fn[-4:] == "qasm"
    ]
    fns = fns + extra_fns
    paths = [path] * len(fns) + [extra_path] * len(extra_fns)

    output_dir = "tket_ibm_optimized/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    result_dict = {}
    for i, (fn, path) in enumerate(zip(fns, paths)):
        if fn[:-5] not in circuit_order:
            continue
        full_path = path + fn
        gate_cnt, cnot_cnt, depth, log_fidelity = tket_optimize_nam(
            full_path, output_dir
        )
        result_dict[fn] = [gate_cnt, cnot_cnt, depth, log_fidelity]
        print(
            f"{fn}, gate: {gate_cnt}, cnot: {cnot_cnt}, depth: {depth}, log_fidelity: {log_fidelity}, by tket"
        )

    print("ordered gate count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][0])

    print("ordered cnot count: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][1])

    print("ordered depth: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][2])

    print("ordered log fidelity: ")
    for fn in circuit_order:
        print(result_dict[fn + ".qasm"][3])
