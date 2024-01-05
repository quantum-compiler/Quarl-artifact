from qiskit import QuantumCircuit, transpile
import os
from os.path import join, isfile
from concurrent.futures import ProcessPoolExecutor
import time
import sys

sys.path.append("../")
from fidelity import get_log_fidelity, get_log_logical_fidelity


def get_circuit_info(fn):
    circ = QuantumCircuit.from_qasm_file(fn)
    count_dict = circ.count_ops()
    log_fidelity = get_log_logical_fidelity(fn)
    return (
        sum([count_dict[k] for k in count_dict]),
        count_dict["cx"],
        circ.depth(),
        log_fidelity,
    )


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
    path = "quartz_ibm_optimized/"
    fns = [
        fn for fn in os.listdir(path) if isfile(join(path, fn)) and fn[-4:] == "qasm"
    ]
    result_dict = {}
    for i, (fn, path) in enumerate(zip(fns, [path] * len(fns))):
        gate_cnt, cnot_cnt, depth, log_fidelity = get_circuit_info(path + fn)
        result_dict[fn] = [gate_cnt, cnot_cnt, depth, log_fidelity]
        print(
            f"{fn}, gate: {gate_cnt}, cnot: {cnot_cnt}, depth: {depth}, log_fidelity: {log_fidelity}, by Quartz"
        )

    print("ordered gate count: ")
    for fn in circuit_order:
        print(result_dict[fn + "_optimized.qasm"][0])

    print("ordered cnot count: ")
    for fn in circuit_order:
        print(result_dict[fn + "_optimized.qasm"][1])

    print("ordered depth: ")
    for fn in circuit_order:
        print(result_dict[fn + "_optimized.qasm"][2])

    print("ordered log fidelity: ")
    for fn in circuit_order:
        print(result_dict[fn + "_optimized.qasm"][3])
