from qiskit import QuantumCircuit, transpile
import os
from os.path import join, isfile
from concurrent.futures import ProcessPoolExecutor
import time
import sys

sys.path.append("../")
from fidelity import get_log_fidelity, get_log_logical_fidelity


def qiskit_optimize_ibm(fn, output_dir: str):
    circ = QuantumCircuit.from_qasm_file(fn)
    optimized_circ = transpile(
        circ, basis_gates=["rz", "cx", "sx", "x"], optimization_level=3
    )
    count_dict = optimized_circ.count_ops()
    output_path = output_dir + fn.split("/")[-1]
    optimized_circ.qasm(filename=output_path)
    log_fidelity = get_log_logical_fidelity(output_path)
    return (
        sum([count_dict[k] for k in count_dict]),
        count_dict["cx"],
        optimized_circ.depth(),
        log_fidelity,
    )


if __name__ == "__main__":
    path = "../circs/ibm_circs/"
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
    fns = [
        fn for fn in os.listdir(path) if isfile(join(path, fn)) and fn[-4:] == "qasm"
    ]
    extra_path = "../circs/ibm_extra_circs/"
    extra_fns = [
        fn
        for fn in os.listdir(extra_path)
        if isfile(join(extra_path, fn)) and fn[-4:] == "qasm"
    ]
    all_fns = fns + extra_fns
    all_paths = [path] * len(fns) + [extra_path] * len(extra_fns)
    output_dir = "qiskit_ibm_optimized/"
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    result_dict = {}
    for i, (fn, path) in enumerate(zip(all_fns, all_paths)):
        if fn[:-5] not in circuit_order:
            continue
        gate_cnt, cnot_cnt, depth, log_fidelity = qiskit_optimize_ibm(
            path + fn, output_dir
        )
        result_dict[fn] = [gate_cnt, cnot_cnt, depth, log_fidelity]
        print(
            f"{fn}, gate: {gate_cnt}, cnot: {cnot_cnt}, depth: {depth}, log_fidelity: {log_fidelity}, by Qiskit"
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
